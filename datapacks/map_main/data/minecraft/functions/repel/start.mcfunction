scoreboard players set repel state 1
scoreboard players set cnt.repel number 1
scoreboard players set start.repel.second tick 30
execute as @a[team=wait.repel,gamemode=adventure] run spreadplayers -93 62 0 20 under 42 false @s

team join play.repel @a[team=wait.repel,gamemode=adventure] 
tellraw @a ["\u00a7b\u00a7l[GAMESTART] \u00a7eRepeling War\u00a7a 开始了！"]
title @a[team=play.repel] title ["\u00a7e\u00a7lRepeling War"]
team modify play.repel friendlyFire false
title @a[team=play.repel] subtitle ["\u00a7r将其他玩家击退下去！"]
tellraw @a[team=play.repel] ["\u00a7c你将在\u00a7610 s\u00a7c后获得武器。"]
tellraw @a[team=play.repel] ["\n\u00a76提示：如果您使用投影MOD，建议在设置中更换绑定物品，避免导致无法游戏。\n"]
schedule function minecraft:repel/givethings 10s