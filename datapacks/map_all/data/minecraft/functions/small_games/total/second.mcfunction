scoreboard players set count.4 board 0
execute as @a[tag=play.total] run scoreboard players add count.4 board 1
execute if score gametotal state matches 1..1000 if score count.4 board matches ..1 run function small_games/total/neover
# execute if score count.4 board matches ..1 run function small_games/total/neover