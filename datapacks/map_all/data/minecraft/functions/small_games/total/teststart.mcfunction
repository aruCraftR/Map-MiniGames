playsound ui.button.click player @s
scoreboard players set wait.player tick 0 
execute as @a[team=wait.total,gamemode=adventure] run scoreboard players add wait.player tick 1
scoreboard players add gametotal state 0
# execute if score pw.state state matches 1.. run function minecraft:poolwar/spec
execute unless score gametotal state matches 1.. if score wait.player tick matches ..1 run tellraw @s ["\u00a7c人数不够！请等待至少2人！"]
execute unless score gametotal state matches 1.. if score wait.player tick matches ..1 run playsound entity.enderman.teleport player @s ~ ~ ~ 1 0 1
execute unless score gametotal state matches 1.. if score wait.player tick matches 2.. run function minecraft:small_games/total/start
