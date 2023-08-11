
#播放
#小星星
execute as @s[tag=music_little_stars] at @s run function minecraft:music/little_stars

execute as @s[tag=music_kano] at @s run function minecraft:music/kano

execute as @s[tag=music_flower_dance] at @s run function minecraft:music/flower_dance
execute as @s[tag=music_clear_morning] at @s run function minecraft:music/clear_morning
execute as @s[tag=music_constant_moderato] at @s run function minecraft:music/constant_moderato
execute as @s[tag=music_fate] at @s run function minecraft:music/fate
# execute as @s[tag=music_memories] at @s run function minecraft:music/memories


tag @s[tag=!music_little_stars,tag=!music_kano,tag=!music_flower_dance,tag=!music_fate,tag=!music_clear_morning,tag=!music_constant_moderato] add music_kano
#分数
scoreboard players add @s[tag=music.playing] time 1