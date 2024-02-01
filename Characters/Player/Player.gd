extends CharacterBody2D


@export var SPEED = 400.0
@export var FRICTION = 500.0
#@export var MAX_SPEED = 400.0

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	return input_direction

func _physics_process(delta):
	var input = get_input()
	if input == Vector2.ZERO:
		if velocity.length() > FRICTION * delta:
			velocity -= velocity.normalized() * FRICTION * delta
		else:
			velocity = Vector2.ZERO
	else:
		velocity = input * SPEED
	
	
	move_and_slide()
