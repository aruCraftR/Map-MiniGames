tellraw @a[team=chestgame] ["\u00a70\u00a7l黑方\u00a76\u00a7l胜利！"]
title @a[team=chestgame] title ["\u00a7c\u00a7lGame Over!"]
title @a[team=chestgame] subtitle ["\u00a70\u00a7l黑方\u00a76\u00a7l胜利！"]
title @a[team=chestgame,tag=chess.black] title ["\u00a76你赢了！"]
scoreboard players set chess.state state 2
schedule function small_games/chess/tp 5s