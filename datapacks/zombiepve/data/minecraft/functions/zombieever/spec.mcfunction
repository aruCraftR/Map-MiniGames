gamemode spectator @s
tellraw @s ["\u00a7c很抱歉，游戏已经开始！您将在下局游戏加入！"]
tp @s 370.0 22 -155 0 0
scoreboard players set @s zombie.coin 300
tellraw @s ["\u00a76+300 Coins (加入游戏)"]
team join play.zombie
give @s wooden_sword{Unbreakable:1b}
give @s wooden_axe{Unbreakable:1b}
item replace entity @s armor.head with leather_helmet{Unbreakable:1b}
item replace entity @s armor.chest with leather_chestplate{Unbreakable:1b}
item replace entity @s armor.legs with leather_leggings{Unbreakable:1b}
item replace entity @s armor.feet with leather_boots{Unbreakable:1b}
give @s minecraft:carrot_on_a_stick{gun:1,bullet:500,cdtime:10,display:{Name:'"\\u00a7aShooter"',Lore:['"\\u00a7b子弹数量：\\u00a7e500"','"\\u00a7bCD: \\u00a7e10tick"','"\\u00a7b伤害：\\u00a7e3.0 HP"']}}