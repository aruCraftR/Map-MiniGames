summon marker ~ ~ ~ {Tags:["chess.tmp"]}
# execute as @e[type=marker,tag=chess.tmp] at @s run setblock ~ ~ ~ diamond_block
execute as @e[type=marker,tag=chess.tmp] at @s run function small_games/chess/gojp/change/ways/a
# setblock 74 111 55 black_wool 
kill @e[type=marker,tag=chess.tmp]
