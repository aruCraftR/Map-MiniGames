tp @s ~ ~ ~1
execute at @s if blocks ~ ~-1 ~ ~ ~-1 ~ 74 111 55 all run scoreboard players add blackcount board 1
execute at @s if blocks ~ ~-1 ~ ~ ~-1 ~ 74 111 55 all unless score blackcount board matches 5.. at @s run function small_games/chess/five/check/black/c
# setblock 74 111 55 black_wool 
