playsound ui.button.click player @s
scoreboard players set wait.player tick 0 
execute as @a[team=wait.tntwars,gamemode=adventure] run scoreboard players add wait.player tick 1

execute if score tnt.state state matches 1.. run function minecraft:tntwars/spec
execute unless score tnt.state state matches 1.. if score wait.player tick matches ..1 run tellraw @s ["\u00a7c人数不够！请等待至少2人！"]
execute unless score tnt.state state matches 1.. if score wait.player tick matches ..1 run playsound entity.enderman.teleport player @s ~ ~ ~ 1 0 1
execute unless score tnt.state state matches 1.. if score wait.player tick matches 2.. run function minecraft:tntwars/start