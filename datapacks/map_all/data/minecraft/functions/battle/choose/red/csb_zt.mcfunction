execute if score battle.item.b.3 board matches 1.. run function battle/item/crossbow_zt
execute if score battle.item.b.3 board matches 1.. run function battle/choose/tp
execute if score battle.item.b.3 board matches 1.. run scoreboard players remove battle.item.b.3 board 1
execute if score battle.item.b.3 board matches ..0 run setblock 144 44 -368 minecraft:redstone_block
