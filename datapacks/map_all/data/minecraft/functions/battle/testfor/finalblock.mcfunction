function battle/testfor/countblock
execute if score battle.tmp.1 board > battle.tmp.2 board run function battle/addscore/red
execute if score battle.tmp.1 board < battle.tmp.2 board run function battle/addscore/blue
execute if score battle.tmp.1 board = battle.tmp.2 board run function battle/addscore/none
# execute if score  matches 9.. run function battle/addscore/blue

gamemode spectator @a[tag=battle.sel]
function battle/trynextround