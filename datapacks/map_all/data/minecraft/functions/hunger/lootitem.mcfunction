# say @a[scores={bw.kill=1..},team=hunger]
# scoreboard players reset @a[scores={bw.kill=1..},team=hunger] bw.kill
advancement revoke @s only hunger/player_was_killed
team leave @s
tag @s add hunger.sel
data modify block 133 -40 86 front_text.messages[0] set value '[{"selector":"@a[tag=hunger.sel]","color":"aqua"},"\\u00a7a 的背包"]'
team join hunger @s
summon item ~ ~ ~ {Item:{id:"minecraft:bundle",Count:1b,tag:{hungerItem:1b}},Tags:["hunger.loot.new"],CustomNameVisible:1b}
data modify entity @e[limit=1,type=item,tag=hunger.loot.new] Item.tag.Items set from entity @s Inventory
data modify entity @e[limit=1,type=item,tag=hunger.loot.new] Item.tag.display.Name set from block 133 -40 86 front_text.messages[0]
data modify entity @e[limit=1,type=item,tag=hunger.loot.new] CustomName set from block 133 -40 86 front_text.messages[0]
tag @e[tag=hunger.loot.new] remove hunger.loot.new
# execute as @a[team=hunger] if predicate minecraft:hunger/killed
scoreboard players reset @s die
tag @s remove hunger.sel
clear @s
tellraw @s ["\u00a7c你的物品已经掉落。"]