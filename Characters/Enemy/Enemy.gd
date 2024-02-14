extends Sprite2D

@export var speed = 100
var direction = Vector2.ZERO

func _physics_process(delta: float) -> void:
	
	global_position = global_position.move_toward(Global.player_pos , delta * speed)
	
	direction = global_position.move_toward(Global.player_pos , delta)
