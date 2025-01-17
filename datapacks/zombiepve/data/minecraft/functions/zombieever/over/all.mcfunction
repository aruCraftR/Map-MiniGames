schedule function zombieever/over/back 5s
tellraw @a ["\u00a72\u00a7lZombie Day >>> \u00a76游戏结束！游戏进度：",{"score":{"objective": "board","name": "zombie.round"},"color":"yellow"}]
scoreboard players set zombie.state state 5
schedule clear zombieever/nextround
bossbar set zombie:zombiecount name ["\u00a7c游戏结束！"]
scoreboard players reset * zombie.coin
schedule clear minecraft:zombieever/nextround
schedule clear #minecraft:zom_talks

forceload add 656 -41 596 -112
forceload add 585 -67 495 -154
forceload add 597 -111 714 1
scoreboard players set zombie.round board 0
kill @e[type=villager,tag=pve.npc]

kill @e[tag=pve.root]
kill @e[tag=pve.zombie]
kill @e[type=item,x=653,y=29,z=-51,distance=0..80]
kill @e[type=item,x=536,y=-24,z=-107,distance=0..80]
kill @e[type=experience_orb,x=628,y=39,z=-82,distance=0..60]
kill @e[type=experience_orb,x=536,y=-24,z=-107,distance=0..80]

forceload remove 597 -111 714 1
forceload remove 656 -41 596 -112
forceload remove 585 -67 495 -154