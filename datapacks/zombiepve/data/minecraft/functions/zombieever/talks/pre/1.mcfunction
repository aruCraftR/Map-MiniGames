summon minecraft:villager 630 10 -82 {CustomName:'["\\u00a74蜜斯莱哈雅 \\u00a7d[召唤师]"]',Invulnerable:0b,NoAI:1b,Silent:1b,PersistenceRequired:1b,VillagerData:{profession:"minecraft:librarian",type:"minecraft:desert"},Offers:{Recipes:[]},Tags:["pve.npc.pre","pve.zombie"],CustomNameVisible:1b}
bossbar set zombie:zombiecount name ["\u00a7a前言：\u00a7f背景"]
tellraw @a[team=play.zombie] ["\u00a7d群众：\u00a7f欢迎勇者们的到来！"]
effect give @a[team=play.zombie] blindness 4 25 true
effect give @a[team=play.zombie] slowness 4 25 true
effect give @a[team=play.zombie] jump_boost 4 128 true
effect give @a[team=play.zombie] invisibility 4 25 true
schedule function minecraft:zombieever/talks/pre/2 4s append
scoreboard players set zombie.round board 0
scoreboard players reset * zombie.villager.click