kill @e[type=armor_stand,tag=battle.ranpotion]
summon armor_stand 157 35 -340 {Tags:["battle.ranpotion"],CustomName:'["药水"]',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,NoGravity:1b,Invisible:true,NoBasePlate:true,DisabledSlots:2039583}
summon armor_stand 131 35 -340 {Tags:["battle.ranpotion"],CustomName:'["药水"]',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,NoGravity:1b,Invisible:true,NoBasePlate:true,DisabledSlots:2039583}
execute as @e[tag=battle.ranpotion] at @s run function battle/entitygetranpotion