#Set Windmill Tag
execute as @e[type=minecraft:armor_stand,nbt={Tags:["windmill_s"]},tag=!summonWMW] at @s run tag @s add windmill
execute as @e[type=minecraft:armor_stand,nbt={Tags:["windmill_w"]},tag=!summonWMW] at @s run tag @s add windmill
execute as @e[type=minecraft:armor_stand,nbt={Tags:["windmill_n"]},tag=!summonWMW] at @s run tag @s add windmill
execute as @e[type=minecraft:armor_stand,nbt={Tags:["windmill_e"]},tag=!summonWMW] at @s run tag @s add windmill

#Set Scoreboard
scoreboard objectives add WMR dummy
scoreboard objectives add summonWMW dummy
scoreboard players add @e[tag=windmill] WMR 1
scoreboard players set @e[tag=windmill,scores={WMR=180..}] WMR 0
scoreboard players add @e[tag=windmill,tag=!summonWMW] summonWMW 1
scoreboard players set @e[tag=windmill,scores={summonWMW=1..}] WMR 1

#Set Windmill Rotation value from score
execute as @e[tag=windmill] store result entity @s Rotation[1] float 2 run scoreboard players get @s WMR

#Summon Windmill Wings
execute as @e[type=minecraft:armor_stand,nbt={Tags:["windmill_s"]},tag=!summonWMW] at @s run function windmill:summon_wings_south
execute as @e[type=minecraft:armor_stand,nbt={Tags:["windmill_w"]},tag=!summonWMW] at @s run function windmill:summon_wings_west
execute as @e[type=minecraft:armor_stand,nbt={Tags:["windmill_n"]},tag=!summonWMW] at @s run function windmill:summon_wings_north
execute as @e[type=minecraft:armor_stand,nbt={Tags:["windmill_e"]},tag=!summonWMW] at @s run function windmill:summon_wings_east
execute as @e[tag=windmill,tag=!summonWMW] at @s run function windmill:set_wings_tag
execute as @e[tag=windmill,tag=!summonWMW] at @s run setblock ~ ~ ~ minecraft:gray_terracotta
execute as @e[tag=windmill,tag=!summonWMW] at @s run tp ~ ~-1.2 ~

#Set Tag & Score to execute one time
tag @e[scores={summonWMW=1..},tag=!summonWMW] add summonWMW
scoreboard players reset @e[tag=summonWMW] summonWMW
tag @e[scores={summonWMW=0}] remove summonWMW


#Set Windmill Wings
execute as @e[tag=windmill] at @s run function windmill:set_wings

#Remove Wings When Middle Block is broken
execute as @e[tag=windmill] at @s unless block ~ ~1.2 ~ minecraft:gray_terracotta run function windmill:remove_wings