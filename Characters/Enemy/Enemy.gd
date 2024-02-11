extends Sprite2D

@export var SPEED = 100

func _physics_process(delta: float) -> void:
	global_position = global_position.move_toward(Global.player_pos , delta * SPEED)
