gamemode spectator @a[team=play.zombie,gamemode=adventure]
title @a[team=play.zombie] title ["\u00a7cYou lost!"]
title @a[team=play.zombie] subtitle ["\u00a7b所有村民已经阵亡。"]
function zombieever/over/all
tellraw @a[team=play.zombie] ["\n\u00a72\u00a7l   \u00a76游戏结束！持续轮数：",{"score":{"objective": "board","name": "zombie.round"},"color":"yellow"},"\n"]
