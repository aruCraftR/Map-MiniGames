summon marker ~ ~ ~ {Tags:["gun.line","gun.new"],data:{guntype:7}}
tp @e[tag=gun.new] @s
tp @e[tag=gun.new] ~ ~1.6 ~
execute as @e[tag=gun.new] at @s unless block ^ ^ ^0.5 #gunblock run tp @s ^ ^ ^0.5
scoreboard players operation @e[tag=gun.new,limit=1] park.uuid = @s park.uuid
scoreboard players set @e[tag=gun.new] PSTJ 30
tag @e[tag=gun.new] remove gun.new

summon marker ~ ~ ~ {Tags:["gun.line","gun.new"],data:{guntype:7}}
tp @e[tag=gun.new] @s
tp @e[tag=gun.new] ~ ~1.6 ~ ~10 ~
execute as @e[tag=gun.new] at @s unless block ^ ^ ^0.5 #gunblock run tp @s ^ ^ ^0.5
scoreboard players operation @e[tag=gun.new,limit=1] park.uuid = @s park.uuid
scoreboard players set @e[tag=gun.new] PSTJ 30
tag @e[tag=gun.new] remove gun.new

summon marker ~ ~ ~ {Tags:["gun.line","gun.new"],data:{guntype:7}}
tp @e[tag=gun.new] @s
tp @e[tag=gun.new] ~ ~1.6 ~ ~-10 ~
execute as @e[tag=gun.new] at @s unless block ^ ^ ^0.5 #gunblock run tp @s ^ ^ ^0.5
scoreboard players operation @e[tag=gun.new,limit=1] park.uuid = @s park.uuid
scoreboard players set @e[tag=gun.new] PSTJ 30
tag @e[tag=gun.new] remove gun.new

playsound minecraft:block.piston.contract player @s ~ ~ ~ 1 2 1
item modify entity @s weapon.mainhand usegun