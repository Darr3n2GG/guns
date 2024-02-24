extends CharacterBody2D

@export var speed = 100
@export var knockback_resistance = 1.0
var direction : Vector2
var knockback : Vector2

func _physics_process(delta: float) -> void:
	direction = global_position.direction_to(Global.player_pos)
	
	velocity = direction * speed
	
	knockback = knockback.move_toward(Vector2.ZERO, knockback_resistance)
	velocity += knockback * 10 * delta
	
	move_and_slide()
	
func die() -> void:
	queue_free()
