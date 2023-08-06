# ### Door

# fill 373 22 -48 371 25 -48 minecraft:barrier
# fill 374 22 -49 370 25 -49 minecraft:iron_bars

# ## In
# # Left
# fill 369 21 -128 371 24 -128 minecraft:barrier
# fill 371 22 -127 369 23 -127 minecraft:iron_bars
# # Right
# fill 331 21 -128 329 24 -128 minecraft:barrier
# fill 329 22 -127 331 23 -127 iron_bars
# # Medium
# fill 353 22 -134 347 26 -134 minecraft:iron_bars keep

# tag @e[tag=zombie.spawn.now] remove zombie.spawn.now
# tag @e[tag=zombie.spawn.main] add zombie.spawn.now
fill 594 3 -58 594 5 -60 minecraft:iron_bars
fill 637 13 -46 637 11 -47 minecraft:air
fill 637 13 -46 639 11 -46 minecraft:iron_bars
data merge block 597 11 1 {Items:[]}
# /give @s minecraft:tripwire_hook{display:{Name:'"\\u00a7a钥匙"',Lore:['"\\u00a7e用于打开大门的钥匙"']},lock:1}
data merge block 597 11 1 {Items:[{id:"minecraft:tripwire_hook",Count:1b,tag:{display:{Name:'"\\u00a7a钥匙"',Lore:['"\\u00a7e用于打开大门的钥匙"']},lock:1},Slot:13}]}
execute as @e[tag=pve.house.chest] at @s run data merge block ~ ~ ~ {Items:[],Lock:"ss114514"}
fill 535 -51 -124 535 -49 -121 minecraft:iron_bars
fill 579 -9 -119 578 -10 -119 minecraft:air

kill @e[type=villager,tag=pve.npc]
summon minecraft:villager 630 10 -94 {CustomName:'["\\u00a7e亚奇洛贝\\u00a77 - 右键互动"]',Invulnerable:1b,NoAI:1b,Silent:1b,PersistenceRequired:1b,VillagerData:{profession:"minecraft:librarian",type:"minecraft:swamp"},Offers:{Recipes:[]},Tags:["pve.npc"]}