##scoreboard players set §c红§8　§r红队:§a✓ bw.info 10
##scoreboard players set §9蓝§8　§r蓝队:§a✓ bw.info 9
##scoreboard players set §a绿§8　§r绿队:§a✓ bw.info 8
##scoreboard players set §e黄§8　§r黄队:§a✓ bw.info 7
scoreboard players reset §9蓝§8　§r蓝队:§a§l✓ bw.info
scoreboard players reset §9蓝§8　§r蓝队:§e§l❁ bw.info
scoreboard players set §9蓝§8　§r蓝队:§c§l✗ bw.info 9
##execute as @a[tag=bw.player] at @s run playsound entity.ender_dragon.growl player @s ~ ~ ~ 1 1 1
tellraw @a[tag=bw.player] ["\n\u00a7r\u00a7l团灭 > \u00a79蓝队\u00a7c已被淘汰！\n"]
# setblock -371 31 210 yellow_bed[facing=west]
# setblock -372 31 210 yellow_bed[facing=west,part=head]
# setblock -305 31 142 red_bed[facing=north]
# setblock -305 31 141 red_bed[facing=north,part=head]
# setblock -237 31 208 air
# setblock -236 31 208 air
setblock -303 31 276 air
setblock -303 31 277 air
scoreboard players reset bw.blue state
scoreboard players reset bd.blue state
##✓✗✖❁