title @a[team=hide.runner,gamemode=adventure] title ["\u00a76You won!"]
title @a[team=hide.runner,gamemode=spectator] title ["\u00a7cGame Over"]
title @a[team=hide.killer] title ["\u00a7cYou lost!"]
tellraw @a[team=hide.runner] ["\n\u00a7b   时间结束，动物获胜！\n"]
tellraw @a[team=hide.runner] ["\n\u00a7b   时间结束，动物获胜！\n"]
tellraw @a[team=hide.wait2] ["\n\u00a7b   时间结束，动物获胜！\n"]

function hide2/gameover/over

# function hideseek/gameover/over