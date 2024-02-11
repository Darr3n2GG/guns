extends Area2D
class_name Hitbox

@export var hc : Health

func damage(attack : Attack, creature : Object) -> void: 
	if hc:
		hc.damage(attack, creature)
