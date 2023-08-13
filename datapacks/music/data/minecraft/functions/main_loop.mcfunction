
#播放
execute unless score @s music matches 1.. run scoreboard players set @s music 1

# 范围外转换: scoreboard players set @s[scores={music=(n + 1)..}] 1  其中n为最后一首歌的编号
scoreboard players set @s[scores={music=9..}] music 1

execute as @s[scores={music=1}] at @s run function minecraft:music/kano
execute as @s[scores={music=2}] at @s run function minecraft:music/flower_dance
execute as @s[scores={music=3}] at @s run function minecraft:music/clear_morning
execute as @s[scores={music=4}] at @s run function minecraft:music/constant_moderato
execute as @s[scores={music=5}] at @s run function minecraft:music/target_for_love
execute as @s[scores={music=6}] at @s run function minecraft:music/string_theocracy_mili
execute as @s[scores={music=7}] at @s run function minecraft:music/arknights_gui
execute as @s[scores={music=8}] at @s run function minecraft:music/faster_than_light

# execute as @s[tag=music_little_stars] at @s run function minecraft:music/little_stars
# execute as @s[tag=music_fate] at @s run function minecraft:music/fate
# execute as @s[tag=music_memories] at @s run function minecraft:music/memories

#分数
scoreboard players add @s[tag=music.playing] time 1