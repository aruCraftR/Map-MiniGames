tag @a[scores={hp.gethurt=0..},team=play.hotpot,limit=1] add hp.flag
execute as @a[scores={hp.hurt=-1..},team=play.hotpot.k] at @s if entity @a[tag=hp.flag] run function hotpotever/changeto
execute as @a[scores={hp.hurt=-1..},team=play.hotpot.k] at @s unless entity @a[tag=hp.flag] run function hotpotever/changetofaild
tag @a[tag=hp.flag] remove hp.flag
scoreboard players reset @a hp.hurt
# scoreboard players reset @a hp.gethurt
kill @e[type=item,nbt={Item:{tag:{hotpot:1}}}]