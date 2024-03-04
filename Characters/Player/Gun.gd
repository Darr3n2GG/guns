extends Sprite2D

@onready var ReloadTimer = $ReloadTimer
@onready var ShootTimer = $ShootCooldownTimer
var projectile : PackedScene = preload("res://Characters/Player/Bullet/Bullet.tscn")

func _ready() -> void:
	setup()
	
func setup() -> void:
	ReloadTimer.wait_time = Global.reload_time
	ShootTimer.wait_time = Global.shoot_time

func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	if owner.global_position > get_global_mouse_position():
		flip_v = true
		position.x = -48
	else:
		flip_v = false
		position.x = 48
	
	if Global.cartridge > 0:
		if Global.ammo > 0:
			if ShootTimer.is_stopped() and Input.is_action_pressed("shoot"):
				shoot()
		elif ReloadTimer.is_stopped():
			ReloadTimer.start()
			await ReloadTimer.timeout
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
	ShootTimer.start()
