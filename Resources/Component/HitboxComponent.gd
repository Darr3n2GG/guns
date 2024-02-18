extends Area2D
class_name Hitbox

@export var hc : Health
var invulnerable = false

func damage(attack : Attack) -> void: 
	if hc and not invulnerable:
		hc.damage(attack)
		if get_parent() is Player:
			get_parent().get_node("InvulnerableTimer").start()
			invulnerable = true


func _on_invulnerable_timer_timeout() -> void:
	invulnerable = false
