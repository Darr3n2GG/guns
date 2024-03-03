extends CharacterBody2D
class_name Player

@onready var Body_anim = $Body
@export var max_speed = 325.0
@export var friction = 5000.0
const acceleration = 10000.0
const knockback_resistance = 25.0
var knockback = Vector2.ZERO
var moving : bool

func get_input() -> Vector2:
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	return input_direction

func _physics_process(delta):
	var input = get_input()
	play_animation(input)
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
	
func play_animation(input : Vector2) -> void:
	if input.x == -1 or input.round() == Vector2(-1,1).normalized().round() or input.round() == Vector2(-1,-1).normalized().round():
		Body_anim.play("Body LR")
		Body_anim.flip_h = true
		Body_anim.offset.y = 0.5
	elif input.x == 1 or input.round() == Vector2(1,1).normalized().round() or input.round() == Vector2(1,-1).normalized().round():
		Body_anim.play("Body LR")
		Body_anim.flip_h = false
		Body_anim.offset.y = 0.5
	elif input.y == -1:
		Body_anim.play("Body UD")
		Body_anim.offset.y = 4
	elif input.y == 1:
		Body_anim.play_backwards("Body UD")
		Body_anim.offset.y = 4
	else:
		Body_anim.play("Body")
		Body_anim.offset.y = 0
	
func die() -> void:
	print("you died")
