title @a[team=hide.play.hun] title ["\u00a76You won!"]
title @a[team=hide.play.ani] title ["\u00a7cYou lost!"]
tellraw @a[team=hide.play.hun] ["\n\u00a7b   动物获胜！\n"]
tellraw @a[team=hide.play.ani] ["\n\u00a7b   动物获胜！\n"]
tellraw @a[team=hide.wait] ["\n\u00a7b   动物获胜！\n"]
execute as @a[team=hide.wait] run function hideseek/join
execute as @a[team=hide.play.hun] run function hideseek/join
execute as @a[team=hide.play.ani] run function hideseek/join
gamemode adventure @a[team=hide.wait]
function hideseek/gameover/over

# function hideseek/gameover/over