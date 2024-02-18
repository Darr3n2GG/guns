extends Area2D
class_name Hurtbox

@export var damage : float = 1.0
@export var knockback_multiplier : float = 1.0

func _on_area_entered(area: Area2D) -> void:
	if area is Hitbox:
		damage_area(area)

func damage_area(hitbox : Hitbox) -> void:
	var attack_instance = Attack.new()
	attack_instance.Attack_Damage = damage
	var knockback = get_parent().direction.normalized() * knockback_multiplier
	attack_instance.Attack_Knockback = knockback
	hitbox.damage(attack_instance)
	if get_parent().name != "WaterDroplet":
		set_deferred("monitoring",false)
		$Cooldown.start()
	
func _on_cooldown_timeout() -> void:
	set_deferred("monitoring",true)
