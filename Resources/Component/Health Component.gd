extends Node
class_name Health

@export var MaxHealth: float = 10
var health : float
var can_damaged: bool = true

func _ready():
	Set_Health()
	
func Set_Health():
	health = MaxHealth

func damage(attack : Attack, creature : Object) -> void: 
	var parent = get_parent()
	if parent.get_groups() == ["enemy"]:
		print("enemy spotted")
	
	health -= attack.Attack_Damage
	
	#if parent is player:
		#parent.knockback += attack.knockback
	#elif parent is Barrel or parent is BarrelE:
		#parent.apply_central_impulse(attack.knockback * 100) #knockback func
	#elif parent.get_groups() == ["enemy"]:
		#parent.velocity += attack.knockback

	if health <= 0:
		get_parent().die()
