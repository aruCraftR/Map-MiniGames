tag @a remove wolf.acting
function minecraft:twolf/action/resethighlight

scoreboard players set wolf.time board -1
scoreboard players set wolf.ttime board -1

clear @a[tag=wolf.tip]

# execute unless score wolf.failed state matches 1 if score wolf.event board matches 2..7 run tellraw @a[tag=wolf.tip] ["\u00a7c请闭眼。"]

# 新一局 9
execute if score wolf.event board matches 8 run function minecraft:twolf/events/end/trigger

# 白天 8
execute if score wolf.event board matches 7 run function minecraft:twolf/events/day/trigger

# 预言家 7
execute if score wolf.event board matches 6 run function minecraft:twolf/events/6/trigger

# 女巫 6
execute if score wolf.event board matches 5 run function minecraft:twolf/events/5/trigger

# 狼 5
execute if score wolf.event board matches 4 run function minecraft:twolf/events/4/trigger

# 纵火犯 4
execute if score wolf.event board matches 3 run function minecraft:twolf/events/3/trigger


# 守卫 3
execute if score wolf.event board matches 2 run function minecraft:twolf/events/2/trigger




# 丘比特 1/2
execute if score wolf.event board matches 0 run function minecraft:twolf/events/1/trigger

execute if score wolf.event board matches 1 run function minecraft:twolf/events/job/cupid2

scoreboard players reset @a LRS_CS