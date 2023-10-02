execute if score @s zombie.coin matches 800.. run tag @s add buy.pass
execute as @s[tag=buy.pass] run scoreboard players remove @s zombie.coin 800
execute as @s[tag=buy.pass] run give @s minecraft:carrot_on_a_stick{hp:2,gun:1,bullet:200,cdtime:10,display:{Name:'"\\u00a7a基础魔法棒"',Lore:['"\\u00a7b可使用次数：\\u00a7e200"','"\\u00a7bCD: \\u00a7e10tick"','"\\u00a7b伤害：\\u00a7e3.0 HP"','"\\u00a7b消耗能量：\\u00a7e2"']},CustomModelData:9,speed:1}
execute as @s[tag=buy.pass] run playsound entity.experience_orb.pickup player @s ~ ~ ~ 1 1 1
execute as @s[tag=!buy.pass] run playsound entity.enderman.teleport player @s ~ ~ ~ 1 0 1
execute as @s[tag=!buy.pass] run tellraw @s ["\u00a7c购买失败！金币不够。"]
execute as @s[tag=buy.pass] run tellraw @s ["\u00a7a购买成功！"]
tag @s remove buy.pass