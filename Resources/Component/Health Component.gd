extends Node
class_name Health

@export var MaxHealth: float = 10
var health : float

func _ready():
	Set_Health()
	
func Set_Health():
	health = MaxHealth

func damage(attack : Attack) -> void: 
	health -= attack.Attack_Damage
	
	get_parent().knockback = attack.Attack_Knockback

	if health <= 0:
		get_parent().die()
