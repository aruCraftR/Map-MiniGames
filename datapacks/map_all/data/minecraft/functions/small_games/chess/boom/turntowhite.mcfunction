fill ~ ~-1 ~ ~ ~-1 ~ white_stained_glass replace glass
fill ~ 115 ~ ~ 115 ~ white_wool replace orange_wool
playsound ui.button.click player @a[team=chestgame] ~ ~ ~ 
# function small_games/chess/five/check/pj
execute at @s run function small_games/chess/boom/action/placewhite
# execute if score chess.state state matches 1 run function small_games/chess/boom/check/pj
kill @s

#/give @p minecraft:ghast_spawn_egg{EntityTag:{id:"minecraft:marker",Tags:["chess.put.white"]},CanPlaceOn:['glass'],hideFlags:63,display:{Name:'"\\u00a7a放置棋"'}} 1
