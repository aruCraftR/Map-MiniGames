fill 504 -41 -117 503 -43 -117 air
tellraw @a[team=play.zombie] ["\n \u00a77\u00a7o一扇墙壁被破坏了...\n"]

# playsound entity.firework_rocket.twinkle player @a[team=play.zombie] ~ ~ ~ 1 1 1
playsound minecraft:entity.generic.explode player @a[team=play.zombie] ~ ~ ~ 1 1 1

function zombieever/talks/stronghold_boss/1