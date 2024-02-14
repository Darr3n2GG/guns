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
	var knockback = get_parent().direction * knockback_multiplier
	attack_instance.Attack_Knockback = knockback
	hitbox.damage(attack_instance)



