tellraw @a ["\u00a7b\u00a7l小游戏合集 \u00a7a游戏开始。"]
scoreboard players set gametotal state 1
team join play.total @a[team=wait.total]
tag @a[team=play.total] add play.total
function small_games/total/reset
function small_games/total/next_game