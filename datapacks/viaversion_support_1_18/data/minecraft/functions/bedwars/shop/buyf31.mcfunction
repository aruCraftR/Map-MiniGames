execute as @s at @s store result score @s bw.tmp.ir run clear @s iron_ingot 0
execute as @s at @s store result score @s bw.tmp.gd run clear @s gold_ingot 0
execute as @s at @s store result score @s bw.tmp.dm run clear @s diamond 0
execute as @s at @s store result score @s bw.tmp.em run clear @s emerald 0
## Buy.-31 
execute if score @s bw.tmp.em matches 3.. run clear @s emerald 3
execute unless score @s bw.tmp.em matches 3.. run tellraw @s ["\u00a7c你的资源不够买这个东西!"]
execute unless score @s bw.tmp.em matches 3.. run playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 0 1
execute if score @s bw.tmp.em matches 3.. run tellraw @s ["\u00a7a你购买了\u00a76Better Bow * 1"]
execute if score @s bw.tmp.em matches 3.. run give @s bow{Enchantments:[{id:"minecraft:power",lvl:1s},{id:"minecraft:punch",lvl:1s}],Unbreakable:1b,HideFlags:63,CanPlaceOn:["#minecraft:bwplace"],CanDestroy:["#minecraft:bedblocks"]} 1
