summon minecraft:marker ~ ~-0.8 ~ {Tags:["snow.new"],Invulnerable:1b,NoAI:1b,Silent:1b,NoGravity:1b,PersistenceRequired:1b,Duration:21474,Radius:0f}
summon minecraft:marker ~-1 ~-0.8 ~ {Tags:["snow.new"],Invulnerable:1b,NoAI:1b,Silent:1b,NoGravity:1b,PersistenceRequired:1b,Duration:21474,Radius:0f}
summon minecraft:marker ~1 ~-0.8 ~ {Tags:["snow.new"],Invulnerable:1b,NoAI:1b,Silent:1b,NoGravity:1b,PersistenceRequired:1b,Duration:21474,Radius:0f}
summon minecraft:marker ~ ~-0.8 ~-1 {Tags:["snow.new"],Invulnerable:1b,NoAI:1b,Silent:1b,NoGravity:1b,PersistenceRequired:1b,Duration:21474,Radius:0f}
summon minecraft:marker ~ ~-0.8 ~1 {Tags:["snow.new"],Invulnerable:1b,NoAI:1b,Silent:1b,NoGravity:1b,PersistenceRequired:1b,Duration:21474,Radius:0f}
execute as @e[tag=snow.new,type=marker] at @s unless block ~ ~ ~ #minecraft:snowmineable run kill @s
scoreboard players set @e[type=marker,tag=snow.new] snow.tick 12
tag @e[type=marker,tag=snow.new] add snow.disa
tag @e[type=marker,tag=snow.new] remove snow.new