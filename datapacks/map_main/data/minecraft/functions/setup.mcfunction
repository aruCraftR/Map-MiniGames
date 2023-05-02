tellraw @a ["\u00a7b\u00a7l[Gamom Datapacks] \u00a7aReloaded successfully ! \u00a7e[Language: 简体中文]"]
function minecraft:bedwars/setup

scoreboard objectives remove hurt.1
scoreboard objectives add hurt.1 minecraft.custom:minecraft.damage_taken
scoreboard objectives remove cooldowntime
scoreboard objectives add cooldowntime dummy ["冷却时间"]
scoreboard objectives remove zombie.hurt
scoreboard objectives add zombie.hurt minecraft.custom:damage_dealt "Zombie Damage"
scoreboard objectives remove spec
scoreboard objectives add spec trigger ["\u00a77全局旁观者操作"]
scoreboard objectives remove globle.game
scoreboard objectives add globle.game dummy "游戏ID，用于玩家重新加入"
scoreboard players set globle globle.game 1
# game.total globle.game = globle globle.game
scoreboard objectives remove hub
scoreboard objectives remove rejoin
scoreboard objectives add hub trigger "\u00a7b回城操作"
scoreboard objectives add rejoin trigger "\u00a7e重新加入游戏操作"
scoreboard objectives remove xp
scoreboard objectives add xp level "经验等级"
bossbar remove minecraft:battle
bossbar add minecraft:battle "BATTLE GAME"
bossbar set minecraft:battle color green
bossbar set minecraft:battle max 60
bossbar set minecraft:battle value 0
# function selfcheck/check
say §b§l若您是第一次使用此地图，请管理员（或者控制台）先运行 §6/function selfcheck/check §b§l检查兼容情况。§a(建议在有玩家的情况下测试)
say §c§l当前地图兼容 Minecraft 游戏版本：§b§l1.19.4
# say §b§l若您是第一次使用此地图，请管理员（或者控制台）先运行 §6/function selfcheck/check §b§l查看兼容情况。

# function inits/reset_random
# function inits/resetuuid
kill @e[tag=lobby.car,type=minecart]

execute in overworld run forceload add 0 0