# setblock 121 120 60 minecraft:air
# /data get entity @s RootVehicle
setblock 121 120 60 minecraft:air
execute positioned 122 120 59 as @e[tag=lobby.car,type=minecart,distance=3..] run function lobby/car/detectdie
execute positioned 122 120 59 as @e[tag=lobby.car,type=minecart,distance=..3] run function lobby/car/detectgo