clone 79 125 50 79 125 50 75 106 54
clone 79 125 54 79 125 54 75 106 55
clone 79 125 58 79 125 58 75 106 56
clone 75 125 50 75 125 50 74 106 54
clone 75 125 54 75 125 54 74 106 55
clone 75 125 58 75 125 58 74 106 56
clone 71 125 50 71 125 50 73 106 54
clone 71 125 54 71 125 54 73 106 55
clone 71 125 58 71 125 58 73 106 56

scoreboard players set boom.fill.result board 0
execute if score chess.state state matches 1 store result score boom.fill.result board run fill 73 106 56 75 106 54 minecraft:black_stained_glass replace black_wool
execute if score chess.state state matches 1 if score boom.fill.result board matches 5.. run function minecraft:small_games/chess/boom/win/black

scoreboard players set boom.fill.result board 0
execute if score chess.state state matches 1 store result score boom.fill.result board run fill 73 106 56 75 106 54 minecraft:white_stained_glass replace white_wool
execute if score chess.state state matches 1 if score boom.fill.result board matches 5.. run function minecraft:small_games/chess/boom/win/white

execute if score chess.state state matches 1 run function minecraft:small_games/chess/boom/check/pj
