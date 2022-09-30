title @a[tag=bw.player] title ["\u00a7aBedwars"]
title @a[tag=bw.player] subtitle ["\u00a7fEnjoy the game!"]
execute as @e[tag=diamond,type=marker] at @s run summon minecraft:area_effect_cloud ~ ~1.8 ~ {Age:-2147483648,Duration:-1,WaitTime: -2147483648,Tags:["bedwars","diamond.title"],CustomName:'"\\u00a7b\\u00a7l钻石"',CustomNameVisible:1b}
execute as @e[tag=diamond,type=marker] at @s run summon minecraft:area_effect_cloud ~ ~1.5 ~ {Age:-2147483648,Duration:-1,WaitTime: -2147483648,Tags:["bedwars","diamond.subtitle"],CustomName:'"To be edited"',CustomNameVisible:1b}
execute as @e[tag=emerald,type=marker] at @s run summon minecraft:area_effect_cloud ~ ~1.8 ~ {Age:-2147483648,Duration:-1,WaitTime: -2147483648,Tags:["bedwars","emerald.title"],CustomName:'"\\u00a72绿宝石"',CustomNameVisible:1b}
execute as @e[tag=emerald,type=marker] at @s run summon minecraft:area_effect_cloud ~ ~1.5 ~ {Age:-2147483648,Duration:-1,WaitTime: -2147483648,Tags:["bedwars","emerald.subtitle"],CustomName:'"To be edited"',CustomNameVisible:1b}

tellraw @a[tag=bw.player] ["\u00a7a重置完毕！"]
scoreboard players set bw.reset board 0
forceload remove -573 299 -397 121
schedule clear bedwars/resets/mogu
schedule clear bedwars/resets/unnamed

tag @a[team=bw.wait] add bw.play
title @a[tag=bw.player] reset
title @a[tag=bw.player] title ["\u00a7eBedwars"]
title @a[tag=bw.player] subtitle ["\u00a7a游戏开始！"]
execute if score bw.mode state matches 0..3 run execute as @a[team=bw.wait,tag=!GOABLE.SPEC] at @s run function minecraft:bedwars/before/random_team
execute if score bw.mode state matches 4..7 run execute as @a[team=bw.wait,tag=!GOABLE.SPEC] at @s run function minecraft:bedwars/before/random_team_2teams
tag @a[team=bw.wait] remove bw.play
tellraw @a ["\u00a7a\u00a7l[MESSAGE] \u00a76起床战争\u00a7b游戏已经开始！"]
tellraw @a[team=bw.blue] ["\u00a76你加入了\u00a79蓝队"]
tellraw @a[team=bw.green] ["\u00a76你加入了\u00a7a绿队"]
tellraw @a[team=bw.red] ["\u00a76你加入了\u00a7c红队"]
tellraw @a[team=bw.yellow] ["\u00a76你加入了\u00a7e黄队"]
tellraw @a[team=bw.wait] ["\u00a77你现在处于旁观模式。"]
gamemode adventure @a[team=bw.yellow]
gamemode adventure @a[team=bw.blue]
gamemode adventure @a[team=bw.green]
gamemode adventure @a[team=bw.red]
# execute as @a run function minecraft:bedwars/before/teleport
tp @a[team=bw.yellow] -383 30 210 -90 0
tp @a[team=bw.blue] -303 30 288 -180 0
tp @a[team=bw.green] -225 30 208 90 0
tp @a[team=bw.red] -305 30 130 0 0

scoreboard players set bd.blue state 1
scoreboard players set bd.green state 1
scoreboard players set bd.yellow state 1
scoreboard players set bd.red state 1
scoreboard players set bw.blue state 1
scoreboard players set bw.green state 1
scoreboard players set bw.yellow state 1
scoreboard players set bw.red state 1

data merge block -302 30 131 {Items: []}
data merge block -226 30 211 {Items: []}
data merge block -306 30 287 {Items: []}
data merge block -382 30 207 {Items: []}

setblock -371 31 210 yellow_bed[facing=west]
setblock -372 31 210 yellow_bed[facing=west,part=head]

setblock -305 31 142 red_bed[facing=north]
setblock -305 31 141 red_bed[facing=north,part=head]

setblock -237 31 208 lime_bed[facing=east]
setblock -236 31 208 lime_bed[facing=east,part=head]

setblock -303 31 276 blue_bed[facing=south]
setblock -303 31 277 blue_bed[facing=south,part=head]


execute if score bw.mode state matches 1 run setblock -371 31 210 air
execute if score bw.mode state matches 1 run setblock -372 31 210 air

execute if score bw.mode state matches 1 run setblock -305 31 142 air
execute if score bw.mode state matches 1 run setblock -305 31 141 air

execute if score bw.mode state matches 1 run setblock -237 31 208 air
execute if score bw.mode state matches 1 run setblock -236 31 208 air

execute if score bw.mode state matches 1 run setblock -303 31 276 air
execute if score bw.mode state matches 1 run setblock -303 31 277 air

execute if score bw.mode state matches 1 run tellraw @a[tag=bw.player] ["\n   \u00a7c\u00a7l无床模式\u00a76已启用。\n"]
execute if score bw.mode state matches 5 run tellraw @a[tag=bw.player] ["\n   \u00a7c\u00a7l无床模式\u00a76已启用。\n"]
execute if score bw.mode state matches 2 run tellraw @a[tag=bw.player] ["\n   \u00a7a\u00a7l全解锁模式\u00a76已启用。\n"]
execute if score bw.mode state matches 6 run tellraw @a[tag=bw.player] ["\n   \u00a7a\u00a7l全解锁模式\u00a76已启用。\n"]

execute if score bw.mode state matches 2 run tag @a[tag=bw.player] add bw.attack
execute if score bw.mode state matches 2 run tag @a[tag=bw.player] add bw.armor
execute if score bw.mode state matches 2 run tag @a[tag=bw.player] add bw.speed
execute if score bw.mode state matches 2 run tag @a[tag=bw.player] add bw.fastii

execute if score bw.mode state matches 6 run tag @a[tag=bw.player] add bw.attack
execute if score bw.mode state matches 6 run tag @a[tag=bw.player] add bw.armor
execute if score bw.mode state matches 6 run tag @a[tag=bw.player] add bw.speed
execute if score bw.mode state matches 6 run tag @a[tag=bw.player] add bw.fastii


execute if score bw.mode state matches 5 run setblock -371 31 210 air
execute if score bw.mode state matches 5 run setblock -372 31 210 air

execute if score bw.mode state matches 5 run setblock -305 31 142 air
execute if score bw.mode state matches 5 run setblock -305 31 141 air

execute if score bw.mode state matches 5 run setblock -237 31 208 air
execute if score bw.mode state matches 5 run setblock -236 31 208 air

execute if score bw.mode state matches 5 run setblock -303 31 276 air
execute if score bw.mode state matches 5 run setblock -303 31 277 air

scoreboard players set bw.state state 1
