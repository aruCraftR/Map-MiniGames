from os import system


instruments_list = [
    'harp', "bass", "basedrum", "snare", "hat", "guitar", "flute", "bell", "chime",
    "xylophone", "iron_xylophone", "cow_bell", "didgeridoo", "bit", "banjo", "pling"
]

LINE = "    bass_{ins} = ToneConversionSettings({n}, ('{ins}_-1',), (9, 32), 9)"
LINE1 = "    normal_{ins} = ToneConversionSettings({n}, ('{ins}',), (33, 57), 33)"
LINE2 = "    treble_{ins} = ToneConversionSettings({n}, ('{ins}_1',), (58, 81), 57)"

for i, j in enumerate(instruments_list):
    print(LINE.format(n=i, ins=j))
    print(LINE1.format(n=i, ins=j))
    print(LINE2.format(n=i, ins=j))
system('pause')
