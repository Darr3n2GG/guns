extends Node2D

var projectile : PackedScene = preload("res://Characters/Player/Bullet/Bullet.tscn")

func _ready() -> void:
	setup()
	
func setup() -> void:
	$ReloadTimer.wait_time = Global.reload_time

func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	if global_position > get_global_mouse_position():
		$GunSprite.flip_v = true
	else:
		$GunSprite.flip_v = false
	
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
	new_projectile.transform = $Muzzle.global_transform
	new_projectile.get_child(1).damage = Global.ammo_damage
	Global.ammo -= 1
	new_projectile.direction = global_position.direction_to(get_global_mouse_position())
	$ShootCooldownTimer.start()
