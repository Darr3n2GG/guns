extends Node2D

var projectile : PackedScene = preload("res://Characters/Player/Water Droplet/water_droplet.tscn")

func _physics_process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	if $ShootCooldownTimer.is_stopped() and Input.is_action_pressed("shoot"):
		shoot()
		
func shoot() -> void:
	var new_projectile = projectile.instantiate() as Sprite2D
	owner.add_child(new_projectile)
	new_projectile.set_as_top_level(true)
	new_projectile.transform = global_transform
	new_projectile.direction = global_position.direction_to(get_global_mouse_position())
	$ShootCooldownTimer.start()
