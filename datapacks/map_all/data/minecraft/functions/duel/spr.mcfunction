tag @a remove duel.out
tag @r[team=wait.duel] add duel.out
execute if score duel.ranteam board matches 1..1 run team join play.duel.blue @a[tag=duel.out]
execute if score duel.ranteam board matches 0..0 run team join play.duel.yellow @a[tag=duel.out]
tellraw @a[tag=duel.out,team=play.duel.yellow] ["\u00a7a你加入了 \u00a7e战桥黄队"]
tellraw @a[tag=duel.out,team=play.duel.blue] ["\u00a7a你加入了 \u00a79战桥蓝队"]
scoreboard players add duel.ranteam board 1
execute if score duel.ranteam board matches 2.. run scoreboard players set duel.ranteam board 0
execute as @a[tag=duel.out] at @s run function duel/item
tag @a remove duel.out