extends Sprite2D

@export var speed = 500.0
var direction : Vector2


func _physics_process(delta: float) -> void:
	if $Timer.is_stopped() == false:
		global_position += speed * direction * delta
		rotation = direction.angle()

func _on_timer_timeout() -> void:
	queue_free()
