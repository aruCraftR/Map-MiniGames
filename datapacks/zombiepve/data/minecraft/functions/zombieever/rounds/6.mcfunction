# summon marker ~ ~ ~ {Tags:["pve","pve.spawn","pve.spawn.village"]}
execute if score zombie.type board matches 2 as @e[tag=pve.spawn.village,limit=8,sort=random] at @s run summon zombie_villager ~ ~ ~ {Tags:["pve.zombie"],DeathLootTable:"minecraft:empty",Attributes:[{Base:0.35d,Name:"generic.movement_speed"},{Base:5d,Name:"generic.attack_damage"},{Base:1.4d,Name:"generic.attack_speed"}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],ArmorItems:[{},{},{},{id:"minecraft:leather_helmet",Count:1b,tag:{Unbreakable:1b}}]}
execute if score zombie.type board matches 1 as @e[tag=pve.spawn.village,limit=8,sort=random] at @s run summon zombie_villager ~ ~ ~ {Tags:["pve.zombie"],DeathLootTable:"minecraft:empty",Attributes:[{Base:0.2d,Name:"generic.movement_speed"},{Base:3d,Name:"generic.attack_damage"},{Base:1d,Name:"generic.attack_speed"}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],ArmorItems:[{},{},{},{id:"minecraft:leather_helmet",Count:1b,tag:{Unbreakable:1b}}]}
execute as @a[team=play.zombie,gamemode=adventure] as @e[tag=pve.spawn.village,limit=1,sort=random] at @s run summon zombie ~ ~ ~ {Tags:["pve.zombie"],DeathLootTable:"minecraft:empty",Attributes:[{Base:0.2d,Name:"generic.movement_speed"},{Base:3d,Name:"generic.attack_damage"},{Base:1d,Name:"generic.attack_speed"}],ArmorItems:[{},{},{},{id:"minecraft:leather_helmet",Count:1b,tag:{Unbreakable:1b}}]}

execute as @e[tag=pve.zombie] run data merge entity @s {PersistenceRequired:1b,ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.0f,0.0f]}
scoreboard players set zombie.state state 1
