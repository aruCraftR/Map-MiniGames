execute if data entity @s SelectedItem.tag.gun run tag @s add tmp.usinggun
# xp set @s 0 points
execute as @s[tag=tmp.usinggun] run execute store result score gun.tmp board as @s at @s run data get entity @s SelectedItem.tag.bullet
execute as @s[tag=tmp.usinggun] if score @s cooldowntime matches 1.. run execute if score gun.tmp board matches 1.. run title @s actionbar [{"translate":"\u00a76☼ \u00a7e[%s\u00a7e] \u00a7e弹药剩余: \u00a7a%s\u00a7d ⚝ \u00a7b冷却时间：%s\u00a7ct\u00a76 ☼","with":[{"nbt":"SelectedItem.tag.display.Name","interpret":true,"entity":"@s"},{"score":{"name": "gun.tmp","objective": "board"},"color": "green"},{"score":{"name": "@s","objective": "cooldowntime"},"color": "red"}]}]
execute as @s[tag=tmp.usinggun] unless score @s cooldowntime matches 1.. run execute if score gun.tmp board matches 1.. run title @s actionbar [{"translate":"\u00a76☼ \u00a7e[%s\u00a7e] \u00a7e弹药剩余: \u00a7a%s\u00a7d ⚝ %s\u00a76 ☼","with":[{"nbt":"SelectedItem.tag.display.Name","interpret":true,"entity":"@s"},{"score":{"name": "gun.tmp","objective": "board"},"color": "green"},{"nbt":"SelectedItem.tag.display.Lore[2]","interpret":true,"entity":"@s"}]}]
execute as @s[tag=tmp.usinggun] run execute unless score gun.tmp board matches 1.. run title @s actionbar [{"translate":"\u00a7c☼ \u00a7e[%s\u00a7e] \u00a7c弹药不足 \u00a7c ☼","with":[{"nbt":"SelectedItem.tag.display.Name","interpret":true,"entity":"@s"}]}]

# "\u00a7c\u00a7l冷却中: ",{"score":{"objective": "cooldowntime","name": "@s"},"color":"yellow"},"\u00a7et"
# execute as @s[tag=tmp.usinggun] run scoreboard players operation @s bw.tmp.em = gun.tmp board
# scoreboard players reset @s bw.tmp.em
tag @s remove tmp.usinggun
