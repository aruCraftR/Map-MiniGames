setblock 74 111 33 white_wool 
scoreboard players set whitecount board 1
# tellraw @a [0]
# Part 1
# execute unless score whitecount board matches 3.. run tellraw @a [1]
execute as @s at @s run summon marker ~ 116 ~ {Tags:["chess.calc"]}
execute unless score whitecount board matches 3.. as @e[tag=chess.calc] at @s run function small_games/chess/boom/check/white/a
kill @e[tag=chess.calc]
execute as @s at @s run summon marker ~ 116 ~ {Tags:["chess.calc"]}

execute unless score whitecount board matches 3.. as @e[tag=chess.calc] at @s run function small_games/chess/boom/check/white/b
kill @e[tag=chess.calc]
# Part 2
# execute unless score whitecount board matches 3.. run tellraw @a [2]
execute as @s at @s run summon marker ~ 116 ~ {Tags:["chess.calc"]}
execute unless score whitecount board matches 3.. run scoreboard players set whitecount board 1

execute unless score whitecount board matches 3.. as @e[tag=chess.calc] at @s run function small_games/chess/boom/check/white/c
kill @e[tag=chess.calc]
execute as @s at @s run summon marker ~ 116 ~ {Tags:["chess.calc"]}
execute unless score whitecount board matches 3.. as @e[tag=chess.calc] at @s run function small_games/chess/boom/check/white/d
kill @e[tag=chess.calc]
# Part 3
# execute unless score whitecount board matches 3.. run tellraw @a [3]
execute as @s at @s run summon marker ~ 116 ~ {Tags:["chess.calc"]}
execute unless score whitecount board matches 3.. run scoreboard players set whitecount board 1

execute unless score whitecount board matches 3.. as @e[tag=chess.calc] at @s run function small_games/chess/boom/check/white/e
kill @e[tag=chess.calc]
execute as @s at @s run summon marker ~ 116 ~ {Tags:["chess.calc"]}
execute unless score whitecount board matches 3.. as @e[tag=chess.calc] at @s run function small_games/chess/boom/check/white/f
kill @e[tag=chess.calc]
# Part 4
# execute unless score whitecount board matches 3.. run tellraw @a [4]
execute unless score whitecount board matches 3.. run scoreboard players set whitecount board 1
execute as @s at @s run summon marker ~ 116 ~ {Tags:["chess.calc"]}
execute unless score whitecount board matches 3.. as @e[tag=chess.calc] at @s run function small_games/chess/boom/check/white/g
kill @e[tag=chess.calc]
execute as @s at @s run summon marker ~ 116 ~ {Tags:["chess.calc"]}
execute unless score whitecount board matches 3.. as @e[tag=chess.calc] at @s run function small_games/chess/boom/check/white/h
kill @e[tag=chess.calc]
# Total
# execute unless score whitecount board matches 3.. run tellraw @a [3]

execute if score whitecount board matches 3.. at @s run function small_games/chess/boom/action/takeover/white