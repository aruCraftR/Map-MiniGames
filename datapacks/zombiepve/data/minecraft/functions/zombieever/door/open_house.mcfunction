fill 637 13 -46 639 11 -46 minecraft:air replace iron_bars
fill 637 13 -46 637 11 -47 minecraft:iron_bars

tellraw @a[team=play.zombie] ["\n \u00a77\u00a7o一扇大门打开了...\n"]

playsound minecraft:block.chest.open player @a[team=play.zombie] ~ ~ ~ 1 0.5 1

# function zombieever/nextround
scoreboard players set zombie.round board 16
tp @e[tag=pve.npc.yaqiluobei,limit=1] 597 4 -61 -57 -8
