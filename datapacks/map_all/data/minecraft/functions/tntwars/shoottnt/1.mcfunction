# execute at @s positioned 0.0 0.0 0.0 rotated as @s anchored eyes run summon marker ^ ^ ^3 {Tags:["tmp"]}
execute as @s at @s positioned 0.0 0.0 0.0 run summon marker ^ ^ ^1 {Tags:["t.tmp"]}
execute anchored eyes run summon tnt_minecart ^ ^ ^1 {Tags:["t.new","tntwars.tnt"]}
execute anchored eyes run summon tnt_minecart ^ ^ ^3 {Tags:["t.new","tntwars.tnt"]}
execute anchored eyes run summon tnt_minecart ^ ^ ^5 {Tags:["t.new","tntwars.tnt"]}
tag @s add t.t.tmp
execute as @e[tag=t.new] run data modify entity @s Owner set from entity @a[limit=1,tag=t.t.tmp] UUID
tag @s remove t.t.tmp
# summon tnt_minecart ^ ^ ^2 {Tags:["tntwars.tnt"]}
execute as @e[tag=t.new] run data modify entity @s Motion set from entity @e[limit=1,tag=t.tmp] Pos
# execute as @e[tag=tntwars.tnt] at @s run tp ~ ~1 ~
execute as @e[tag=t.new] at @s run data modify entity @s Motion set from entity @e[tag=t.tmp,type=marker,limit=1] Pos
# execute as @e[tag=t.new] at @s run data modify entity @s Motion[1] set value 0.5
tag @e[tag=t.new] remove t.new

kill @e[tag=t.tmp,type=marker]