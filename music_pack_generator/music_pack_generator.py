from enum import Enum
from fractions import Fraction
from functools import cache
from os.path import isfile, join, isdir, split, splitext
from sys import exit
from os import mkdir, system
from traceback import print_exc
from typing import Callable, Iterable, NamedTuple, Optional, TypeVar
import pynbs


NBS_FILE_SUFFIX = '.nbs'
SOUND_ID_PREFFIX = 'minecraft:block.note_block.'
HARDCORED_HARP_CMD_FORMAT = 'execute as @s run playsound {sound_id} voice @s ~ ~ ~ {volume} {pitch} {volume}'
HARDCORED_MUSIC_CMD_FORMAT = 'execute as @s[scores=<time={tick}>] run function minecraft:{tone}'
OCTAVE = ('c{}', 'c{}sharp', 'd{}', 'd{}sharp', 'e{}', 'f{}', 'f{}sharp', 'g{}', 'g{}sharp', 'a{}', 'a{}sharp', 'b{}')
ROUND = 100
"""
可用范围: 0 <= key <= 87 (NBS可用范围)
计算公式移植于ONBS
当前脚本中将存在未使用代码与大量硬编码内容
"""

I = TypeVar('I', int, float)


def input_nbs_file() -> pynbs.File:
    while True:
        file = input('请选择需要转换的一个NBS文件(.nbs): ')
        if not isfile(file):
            print('文件不存在!')
            continue
        elif not file.endswith(NBS_FILE_SUFFIX):
            print('文件不为NBS文件')
            continue
        try:
            return pynbs.read(file), file
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


instruments_list = [
    'harp', "bass", "basedrum", "snare", "hat", "guitar", "flute", "bell", "chime",
    "xylophone", "iron_xylophone", "cow_bell", "didgeridoo", "bit", "banjo", "pling"
]


class ToneConversionSettings(NamedTuple):
    instrument_number: int                      # 乐器ID, ONBS项目代码内可找到
                                                # https://github.com/OpenNBS/OpenNoteBlockStudio/blob/master/scripts/dat_instrument/dat_instrument.gml
    sounds: Iterable[str]                       # 声音名称, 即mc中playsound时使用的乐器名称(没有开头的minecraft:block.note_block.)
    key_range: tuple[int, int]                  # [0~87] 闭区间, 使规则生效的key范围, key为NBS下方midi键盘从左到右的编号
    key_offset: int                             # [0~87] 计算音高值时需要给原始key值减去的偏移量
    volume: Optional[Iterable[float]] = None    # [0~1] sounds中每个乐器的音量值, volume元素个数应与sounds相同, 成一一对应关系。不填则全部sounds的音量为1


tone_cmd_generator_mapping: dict[int, list['ToneCmdGenerator']] = {}


class ToneCmdGenerator(Enum):   # 可添加预设以生成其他音色的转换规则
    bass_harp = ToneConversionSettings(0, ('bass',), (9, 32), 9)
    normal_harp = ToneConversionSettings(0, ('harp',), (33, 57), 33)
    treble_harp = ToneConversionSettings(0, ('chime', 'bell'), (58, 81), 57, (0.84, 0.80))

    @staticmethod
    def get_generator(instrument: int, mixed_key: int) -> Optional['ToneCmdGenerator']:
        if instrument not in tone_cmd_generator_mapping:
            return None
        for i in tone_cmd_generator_mapping[instrument]:
            conversion_settings = i.value
            min_key, max_key = conversion_settings.key_range
            if min_key <= mixed_key <= max_key:
                return i
        return None

    @staticmethod
    def get_available_key(instrument: int, mixed_key: int, auto_offset: bool = True) -> Optional[int]:
        if instrument not in tone_cmd_generator_mapping:
            return None
        boundaries: list[int] = []
        for i in tone_cmd_generator_mapping[instrument]:
            conversion_settings = i.value
            min_key, max_key = conversion_settings.key_range
            boundaries.extend(conversion_settings.key_range)
            if min_key <= mixed_key <= max_key:
                return mixed_key
        return get_closest(mixed_key, boundaries)[0]

    def __init__(self, *conversion_settings) -> None:
        super().__init__(ToneConversionSettings(*conversion_settings))
        cs = self.value
        if cs.instrument_number not in tone_cmd_generator_mapping:
            tone_cmd_generator_mapping[cs.instrument_number] = []
        tone_cmd_generator_mapping[cs.instrument_number].append(self)
        self.sounds = [f'{SOUND_ID_PREFFIX}{i}' for i in cs.sounds]
        self.check_settings()

    def check_settings(self):
        cs = self.value
        if cs.volume is not None and (len(cs.sounds) != len(cs.volume)):
            print(f'ToneConversionSettings设置有误: {cs.sounds} 与 {cs.volume} 无法对应')
            system('pause')
            exit()

    def get_cmds(self, mixed_key: int) -> list[str]:
        pitch = calc_pitch(self.get_relative_key(mixed_key))
        if self.value.volume is None:
            return [HARDCORED_HARP_CMD_FORMAT.format(sound_id=i, pitch=pitch, volume=1) for i in self.sounds]
        else:
            return [HARDCORED_HARP_CMD_FORMAT.format(sound_id=i, pitch=pitch, volume=j) for i, j in zip(self.sounds, self.value.volume, strict=True)]

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


class ToneMapping(dict):
    def __init__(self, name, age):
        self.name = name
        self.age = age


@cache
def get_tone_mapping() -> dict[int, str]:
    mapping = {}
    key = -10
    for i in range(9):
        for j in OCTAVE:
            key += 1
            if key < 0:
                continue
            mapping[key] = j.format(i)
            if key == 87:
                break
    return mapping


def mode1():
    """生成音高文件"""
    while True:
        folder = input('请选择文件生成目标文件夹: ')
        if isdir(folder):
            break
        print('请选择有效的文件夹')
    key = -10
    for i in range(9):
        for j in OCTAVE:
            key += 1
            if key < 0:
                continue
            for num, ins in enumerate(instruments_list):
                generator = ToneCmdGenerator.get_generator(num, key)
                if generator is None:
                    continue
                ins_folder = join(folder, ins)
                file = join(ins_folder, f'{j.format(i)}.mcfunction')
                if not isdir(ins_folder):
                    mkdir(ins_folder)
                with open(file, 'w') as f:
                    f.write('\n'.join(generator.get_cmds(key)))
            if key == 87:
                break
    print('完成')
    system('pause')


def get_closest(number: int | float, compares: Iterable[I]) -> list[I]:
    return sorted(compares, key=lambda c: abs(c - number))


def mode2():
    tone_path = input('请输入音高文件的调用路径(如piano/tone代表使用minecraft:piano/tone/xxx调用): ')
    tone_mapping = get_tone_mapping()
    nbs, path = input_nbs_file()
    # 其实factor用浮点还是分数对精度影响几乎没有, 不过既然有分数可以用, 那就用分数吧
    factor = Fraction(20, Fraction(nbs.header.tempo).limit_denominator()) if nbs.header.tempo != 20 else 1
    print(f'时间缩放系数(计算时将使用分数以确保精确度):{float(factor)} ({factor})')
    print(f'总tick数:{nbs.header.song_length} -> {round(factor * nbs.header.song_length)}')
    print('正在导出文件')
    with open(f'{join(split(path)[0], splitext(path)[0])}.mcfunction', 'w') as f:
        for tick, chord in nbs:
            actual_tick=round(factor * tick)
            for note in chord:
                key = note.key
                available_key = ToneCmdGenerator.get_available_key(note.instrument, key)
                if available_key is None:
                    print(f'[没有转换规则] tick {tick} ({actual_tick}): {instruments_list[note.instrument]}')
                    continue
                if available_key != key:
                    print(f'[范围外音高转换] tick {tick} ({actual_tick}): <音色: {instruments_list[note.instrument]}> {key} -> {available_key}')
                tone = f'{tone_path}/{tone_mapping[available_key]}'
                f.write(HARDCORED_MUSIC_CMD_FORMAT.format(tick=actual_tick, tone=tone).replace('<', '{').replace('>', '}') + '\n')
    print('完成, 文件已保存到nbs文件同级目录中同名的.mcfunction文件中')


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
