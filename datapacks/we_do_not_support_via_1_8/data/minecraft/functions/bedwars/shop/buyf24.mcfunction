execute as @s at @s store result score @s bw.tmp.ir run clear @s iron_ingot 0
execute as @s at @s store result score @s bw.tmp.gd run clear @s gold_ingot 0
execute as @s at @s store result score @s bw.tmp.dm run clear @s diamond 0
execute as @s at @s store result score @s bw.tmp.em run clear @s emerald 0
## Buy.-24 
execute if score @s bw.tmp.gd matches 1.. run clear @s gold_ingot 1
execute unless score @s bw.tmp.gd matches 1.. run tellraw @s ["\u00a7c你的资源不够买这个东西!"]
execute unless score @s bw.tmp.gd matches 1.. run playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 0 1
execute if score @s bw.tmp.gd matches 1.. run tellraw @s ["\u00a7a你购买了\u00a76Arrow * 4"]
execute if score @s bw.tmp.gd matches 1.. run give @s arrow{HideFlags:63,CanPlaceOn:["#minecraft:bwplace"],CanDestroy:["#minecraft:bedblocks"]} 4