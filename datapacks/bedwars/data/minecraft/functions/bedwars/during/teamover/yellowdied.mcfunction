##scoreboard players set §c红§8　§r红队:§a✓ bw.info 10
##scoreboard players set §9蓝§8　§r蓝队:§a✓ bw.info 9
##scoreboard players set §a绿§8　§r绿队:§a✓ bw.info 8
##scoreboard players set §e黄§8　§r黄队:§a✓ bw.info 7
scoreboard players reset §e黄§8　§r黄队:§a§l✓ bw.info
scoreboard players reset §e黄§8　§r黄队:§e§l❁ bw.info
scoreboard players set §e黄§8　§r黄队:§c§l✗ bw.info 7
tellraw @a[tag=bw.player] ["\n\u00a7r\u00a7l团灭 > \u00a7e黄队\u00a7c已被淘汰！\n"]
scoreboard players reset bw.yellow state
scoreboard players reset bd.yellow state
setblock -371 31 210 air
setblock -372 31 210 air
# setblock -305 31 142 red_bed[facing=north]
# setblock -305 31 141 red_bed[facing=north,part=head]
##✓✗✖❁