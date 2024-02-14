extends CharacterBody2D


@export var max_speed = 400.0
@export var acceleration = 10000.0
@export var friction = 800.0
@export var knockback_resistance = 1.0
var knockback = Vector2.ZERO
var projectile : PackedScene = preload("res://Characters/Player/Water Droplet/water_droplet.tscn")


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
	velocity += knockback * delta
		
	var shoot_input = get_input("shoot_left", "shoot_right", "shoot_up", "shoot_down")
	if $Timer.is_stopped() and shoot_input != Vector2.ZERO:
		shoot(shoot_input)
	
	
	move_and_slide()
	
func shoot(shoot_direction : Vector2) -> void:
	var new_projectile = projectile.instantiate() as Sprite2D
	add_child(new_projectile)
	new_projectile.set_as_top_level(true)
	new_projectile.global_position = global_position
	new_projectile.direction = shoot_direction
	$Timer.start()
