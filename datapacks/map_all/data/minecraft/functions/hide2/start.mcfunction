scoreboard players set start.player tick 0 
effect clear @a[team=hide.wait2]
execute as @a[team=hide.wait2,gamemode=adventure] run scoreboard players add start.player tick 1
scoreboard players operation hide2.maxtime board = start.player tick
scoreboard players set 100 board 200
scoreboard players operation hide2.maxtime board *= 100 board
execute if score hide2.maxtime board matches 800.. run scoreboard players set hide2.maxtime board 800
scoreboard players operation hide2.resttime board = hide2.maxtime board
scoreboard players set hide2.huntgo board 30
function hide2/starting/reset
function hide2/starting/ranteam

tellraw @a[team=hide.runner] ["\n\u00a7c   追杀者将在30秒后出动。\n"]
tellraw @a[team=hide.killer] ["\n\u00a7c   你将在30秒后出动。\n"]
scoreboard players set hide2.state state 2
gamemode spectator @a[tag=GOABLE.SPEC]
team join hide.wait2 @a[tag=GOABLE.SPEC]

tp @a[team=hide.runner] 137 59 -129 -180 0
tp @a[team=hide.killer] 133 60 -118 90 0

tellraw @a[team=hide.killer] ["\n\u00a76\u00a7l   注意：为了您的游戏体验，请不要使用小地图以及其他作弊模组！\n"]