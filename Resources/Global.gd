extends Node

#player
var player_pos : Vector2
var player_damage_multiplier : float = 1
var player_health : int 

#gun
var cartridge : int  = 10
var max_ammo : int = 10
@onready var ammo : int = max_ammo
var ammo_damage : int = 1
var reload_time : float = 1.5
var shoot_time : float = 0.5

func change_stats(objects, type, percentage : float) -> void:
	pass
