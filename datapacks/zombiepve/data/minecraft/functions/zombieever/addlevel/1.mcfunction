scoreboard players remove @s bw.tmp.em 1
xp add @s 1 levels
xp set @s 1 points

execute if score @s bw.tmp.em matches 1.. run function minecraft:zombieever/addlevel/1
execute if score @s bw.tmp.em matches ..0 run scoreboard players reset @s bw.tmp.em