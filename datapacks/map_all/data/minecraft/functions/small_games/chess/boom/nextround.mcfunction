clear @a[team=chestgame]
#/give @p minecraft:ghast_spawn_egg{EntityTag:{id:"minecraft:marker",Tags:["chess.put.white"]},CanPlaceOn:['glass'],hideFlags:63,display:{Name:'"\\u00a7a放置棋"'}} 1
#/give @p minecraft:bat_spawn_egg{EntityTag:{id:"minecraft:marker",Tags:["chess.put.black"]},CanPlaceOn:['glass'],hideFlags:63,display:{Name:'"\\u00a7a放置棋"'}} 1
scoreboard players set chess.countdown board 60
scoreboard players add chess.turn board 1
execute if score chess.turn board matches 3.. run scoreboard players set chess.turn board 1

function minecraft:small_games/chess/boom/action/check/pj
execute if score chess.state state matches 2 run scoreboard players set chess.turn board 0

execute if score chess.turn board matches 1 run function small_games/chess/boom/turn/black
execute if score chess.turn board matches 2 run function small_games/chess/boom/turn/white