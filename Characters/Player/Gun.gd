extends Node2D

var projectile : PackedScene = preload("res://Characters/Player/Water Droplet/water_droplet.tscn")

func _ready() -> void:
	setup()
	
func setup() -> void:
	$ReloadTimer.wait_time = Global.reload_time

func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	if Global.cartridge > 0:
		if Global.ammo > 0:
			if $ShootCooldownTimer.is_stopped() and Input.is_action_pressed("shoot"):
				shoot()
		elif $ReloadTimer.is_stopped():
			$ReloadTimer.start()
			await $ReloadTimer.timeout
			Global.cartridge -= 1
			Global.ammo = Global.max_ammo

		
func shoot() -> void:
	var new_projectile = projectile.instantiate() as Sprite2D
	owner.add_child(new_projectile)
	new_projectile.set_as_top_level(true)
	new_projectile.global_position = $Muzzle.global_position
	new_projectile.transform = global_transform
	new_projectile.get_child(1).damage = Global.ammo_damage
	Global.ammo -= 1
	$ShootCooldownTimer.start()
