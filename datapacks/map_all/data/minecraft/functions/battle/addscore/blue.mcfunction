scoreboard players add battle.score.b board 1
tag @a[team=wait.battle] add battle.sel
tag @a[team=play.battle.r] add battle.sel
tag @a[team=play.battle.b] add battle.sel

tellraw @a[tag=battle.sel] ["\n   \u00a7a本局，\u00a7b蓝队\u00a7a胜利，获得一分。\n"]
title @a[tag=battle.sel] title ["\u00a76回合结束"]
title @a[tag=battle.sel] subtitle ["\u00a7b蓝队得分"]

gamemode spectator @a[tag=battle.sel]
tag @a remove battle.sel
function battle/trynextround

# scoreboard players set battle.state state 2
# schedule function battle/nextround 5s