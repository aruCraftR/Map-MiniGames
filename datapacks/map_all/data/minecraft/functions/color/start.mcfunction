title @a[team=wait.color] title [{"text":"Color Blindness Game","color":"#009966","bold": true}]
title @a[team=wait.color] subtitle ["\u00a7rShine your eyes !"]
tellraw @a[team=wait.color] ["\n\u00a76    游戏开始！方块将在\u00a7e3\u00a76秒后开始变化！ ","\n"]
execute as @a[team=wait.color] run spreadplayers -39 52 0 10 false @s
execute as @a[team=wait.color] at @s run playsound entity.player.levelup player @s 14 3 -44 1 1 1
team join play.color @a[team=wait.color]
scoreboard players set color.state state 1
schedule clear minecraft:color/summon
schedule function minecraft:color/summon 3s
scoreboard players operation color.tt tick = color.time state
scoreboard players operation color.tre tick = color.maxtime state
tellraw @a[team=play.color] ["\u00a7c\u00a7l 注意！！！ 在检测颜色时请不要跳动！"]
# execute if score color.tick tick matches ..0 run scoreboard players set color.state state 3
# execute if score color.tick tick matches ..0 run scoreboard players operation color.tick tick = color.tt state
# execute if score color.tick tick matches ..0 if score color.tre tick matches 1.. run scoreboard players remove color.tt state 1
# execute if score color.tick tick matches ..0 if score color.tre tick matches 1.. run scoreboard players remove color.tre tick 1