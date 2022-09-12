scoreboard players set duel.state state 0
tellraw @a ["\u00a7a[I] ",{"text":"Duel Game","color":"yellow","bold": true}," \u00a7a: \u00a7b游戏结束！\n"]
gamemode adventure @a[gamemode=spectator,team=play.duel.blue]
gamemode adventure @a[gamemode=spectator,team=wait.duel]
gamemode adventure @a[gamemode=spectator,team=wait.duel.yellow]

# execute if entity @a[team=car.wait,tag=play.total] run function small_games/total/next_game
execute as @a[gamemode=adventure,team=wait.duel] run function duel/join
execute as @a[gamemode=adventure,team=play.duel.yellow] run function duel/join
execute as @a[gamemode=adventure,team=play.duel.blue] run function duel/join

execute if entity @a[team=wait.duel,tag=play.total] run function small_games/total/next_game

schedule clear minecraft:duel/summon
kill @e[type=item,nbt={Item:{tag:{duel:1}}}]
