execute store result score getx board run data get block ~ ~ ~ x
execute store result score gety board run data get block ~ ~ ~ y
execute store result score getz board run data get block ~ ~ ~ z
tellraw @a [{"score":{"name": "getx","objective": "board"},"color": "red"}," ",{"score":{"name": "gety","objective": "board"},"color": "red"}," ",{"score":{"name": "getz","objective": "board"},"color": "red"}]