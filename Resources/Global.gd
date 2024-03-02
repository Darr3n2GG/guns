extends Node

#player
var player_pos : Vector2

#gun
var cartridge : int  = 10
var max_ammo : int = 10
@onready var ammo : int = max_ammo
var ammo_damage : int = 1
var ammo_damage_multiplier : float = 1
var reload_time : float = 1.5
