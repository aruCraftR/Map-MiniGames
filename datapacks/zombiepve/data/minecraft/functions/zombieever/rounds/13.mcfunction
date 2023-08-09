# summon marker ~ ~ ~ {Tags:["pve","pve.spawn","pve.spawn.findkey"]}
execute as @e[tag=pve.spawn.findkey] at @s run summon drowned ~ ~ ~ {Tags:["pve.zombie"],DeathLootTable:"minecraft:empty",Attributes:[{Base:0.3d,Name:"generic.movement_speed"},{Base:5d,Name:"generic.attack_damage"},{Base:1d,Name:"generic.attack_speed"}],ArmorItems:[{},{},{},{id:"minecraft:leather_helmet",Count:1b,tag:{Unbreakable:1b}}],HandItems:[{id:"minecraft:trident",Count:1b},{}]}
execute as @e[tag=pve.spawn.findkey,limit=8,sort=random] at @s run summon guardian ~ ~ ~ {Tags:["pve.zombie"],DeathLootTable:"minecraft:empty",Attributes:[{Base:0.3d,Name:"generic.movement_speed"},{Base:5d,Name:"generic.attack_damage"},{Base:1d,Name:"generic.attack_speed"}],ArmorItems:[{},{},{},{id:"minecraft:leather_helmet",Count:1b,tag:{Unbreakable:1b}}]}

execute as @e[tag=pve.zombie] run data merge entity @s {PersistenceRequired:1b,ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.0f,0.0f]}
scoreboard players set zombie.state state 2