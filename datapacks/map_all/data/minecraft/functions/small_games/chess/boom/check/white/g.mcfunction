tp @s ~-1 ~ ~1
execute at @s if blocks ~ ~-1 ~ ~ ~-1 ~ 74 111 55 all run scoreboard players add whitecount board 1
execute at @s if blocks ~ ~-1 ~ ~ ~-1 ~ 74 111 55 all unless score whitecount board matches 3.. at @s run function small_games/chess/boom/check/white/g
# setblock 74 111 55 white_wool 
