from enum import Enum
from os.path import isfile, join, isdir
from sys import exit
from os import system
from traceback import print_exc
from typing import Callable, Iterable, NamedTuple, Optional
import pynbs


NBS_FILE_SUFFIX = '.nbs'
SOUND_ID_PREFFIX = 'minecraft:block.note_block.'
HARDCORED_HARP_CMD_FORMAT = 'execute as @s run playsound {sound_id} voice @s ~ ~ ~ 1 {pitch} 1'
HARDCORED_MUSIC_CMD_FORMAT = 'execute as @s[scores=<time={tick}>] run function minecraft:{tone}'
OCTAVE = ('f{}sharp', 'g{}', 'g{}sharp', 'a{}', 'a{}sharp', 'b{}', 'c{}', 'c{}sharp', 'd{}', 'd{}sharp', 'e{}', 'f{}')
ROUND = 100
MIN_KEY = 9
MAX_KEY = 81
"""
可用范围: key >= 9 and key <= 81
即6个八度
计算公式移植于ONBS
自定义程度更高的音乐包生成器可能会单独开仓库写
当前脚本中将存在未使用代码与大量硬编码内容
"""


def input_nbs_file() -> pynbs.File:
    while True:
        file = input('请选择需要转换的一个NBS文件(.nbs): ')
        if not isfile(file):
            print('文件不存在!')
        elif file.endswith(NBS_FILE_SUFFIX):
            print('文件不为NBS文件')
        try:
            return pynbs.read(file)
        except Exception:
            print('读取文件时出现错误:')
            print_exc()


def input_int(info: str, checkers: Iterable[tuple[Callable[[int], bool], str]]):
    while True:
        try:
            integer = int(input(info))
        except ValueError:
            print('请输入纯数字')
            continue
        ok = True
        for checker, i in checkers:
            if not checker(integer):
                print(i)
                ok = False
        if ok:
            return integer


def get_instrument(instrument_number: int) -> Optional[str]:
    if instrument_number > 0:
        print('尚未支持非钢琴音色')
        return None
    if instrument_number < 16:
        return "harp"
    else:
        print('尚不支持自定义音色')
    return None


class ToneConversionSettings(NamedTuple):
    instrument_number: int
    sounds: Iterable[str]
    key_range: tuple[int, int]  # 闭区间
    key_offset: int


tone_cmd_generator_mapping: dict[int, list['ToneCmdGenerator']] = {}


class ToneCmdGenerator(Enum):   # 可添加预设以生成其他音色的转换规则
    bass_harp = ToneConversionSettings(0, ('bass',), (9, 32), 9)
    normal_harp = ToneConversionSettings(0, ('harp',), (33, 57), 33)
    treble_harp = ToneConversionSettings(0, ('chime', 'bell'), (58, 81), 57)

    @staticmethod
    def get_generator(instrument: int, mixed_key: int):
        instruments = tone_cmd_generator_mapping[instrument]
        for i in instruments:
            conversion_settings = i.value
            min_key, max_key = conversion_settings.key_range
            if min_key <= mixed_key <= max_key:
                return i

    def __init__(self, *conversion_settings) -> None:
        super().__init__(ToneConversionSettings(*conversion_settings))
        cs = self.value
        if cs.instrument_number not in tone_cmd_generator_mapping:
            tone_cmd_generator_mapping[cs.instrument_number] = []
        tone_cmd_generator_mapping[cs.instrument_number].append(self)
        self.sounds = [f'{SOUND_ID_PREFFIX}{i}' for i in cs.sounds]

    def get_cmds(self, mixed_key: int) -> list[str]:
        pitch = calc_pitch(self.get_relative_key(mixed_key))
        return [HARDCORED_HARP_CMD_FORMAT.format(sound_id=i, pitch=pitch) for i in self.sounds]

    def get_relative_key(self, mixed_key):
        return mixed_key - self.value.key_offset


def mix_key(note_key: int, note_pitch: int):
    return note_key + note_pitch / 100


def calc_pitch(relative_key: int) -> float:
    return round((0.5 * (2 ** (relative_key / 12))), ROUND)


def calc_volume(layer_volume: float, note_velocity: int) -> float:
    return layer_volume / 100 / 100 * note_velocity


def calc_stereo(layer_panning: int, note_panning: int) -> float | int:
    s = (layer_panning + note_panning) / 2  # Stereo values to X coordinates, calc'd from the average of both note and layer pan.
    if s == 100:
        return 0
    if s > 100:
        return (s - 100) / -100
    if s < 100:
        return ((s - 100) * -1) / 100
    raise ValueError    # 此异常没有实际作用, 只是让IDE不报错


def get_tone_mapping() -> dict[int, str]:
    mapping = {}
    key = 8
    for i in range(1, 8):
        for j in OCTAVE:
            key += 1
            if key > 81:
                break
            mapping[key] = j.format(i)
    return mapping


def mode1():
    """生成音高文件"""
    while True:
        folder = input('请选择文件生成目标文件夹: ')
        if isdir(folder):
            break
        print('请选择有效的文件夹')
    key = 8
    for i in range(1, 8):
        for j in OCTAVE:
            key += 1
            if key > 81:
                break
            file = join(folder, f'{j.format(i)}.mcfunction')
            if isfile(file):
                print(f'文件{j}{i}.mcfunction已存在, 跳过保存')
                continue
            with open(file, 'w') as f:
                f.write('\n'.join(ToneCmdGenerator.get_generator(0, key).get_cmds(key)))
    print('完成')
    system('pause')


def mode2():
    tone_path = input('请输入音高文件的调用路径(如piano/tone代表使用minecraft:piano/tone/xxx调用): ')
    tone_mapping = get_tone_mapping()
    nbs = input_nbs_file()
    factor = 20 / nbs.header.tempo if nbs.header.tempo != 20 else 1
    for tick, chord in nbs:
        for note in chord:
            key = note.key
            if key < MIN_KEY:
                key = MIN_KEY
            elif key > MAX_KEY:
                key = MAX_KEY
            tone = f'{tone_path}/{tone_mapping[key]}'
            print(HARDCORED_MUSIC_CMD_FORMAT.format(tick=round(tick * factor), tone=tone).replace('<', '{').replace('>', '}'))


if __name__ == '__main__':
    # nbs = input_nbs_file()
    # tone_offset = input_int('请输入音调偏移量(±)')
    match input_int('1.生成音高文件\n2.由NBS文件生成单文件函数\n请选择模式: ', ((lambda i: 0 < i < 3, '模式不存在'),)):
        case 1:
            mode1()
            exit()
        case 2:
            mode2()
            exit()
