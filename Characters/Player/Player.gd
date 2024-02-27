extends CharacterBody2D
class_name Player


@export var max_speed = 400.0
@export var acceleration = 10000.0
@export var friction = 800.0
@export var knockback_resistance = 1.0
var knockback = Vector2.ZERO
var moving : bool


func get_input(left, right, up, down):
	var input_direction = Input.get_vector(left, right, up, down).normalized()
	return input_direction

func _physics_process(delta):
	var input = get_input("move_left", "move_right", "move_up", "move_down")
	if input == Vector2.ZERO:
		if velocity.length() > friction * delta:
			velocity -= velocity.normalized() * friction * delta
		else:
			velocity = Vector2.ZERO
	else:
		velocity += input * acceleration * delta
		velocity = velocity.limit_length(max_speed)
	
	knockback = knockback.move_toward(Vector2.ZERO, knockback_resistance)
	velocity += knockback * 10 * delta
	
	Global.player_pos = global_position
	
	move_and_slide()
	
func die() -> void:
	print("you died")
