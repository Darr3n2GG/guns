extends Sprite2D

var speed = 550.0
var direction : Vector2


func _physics_process(delta: float) -> void:
	if $Timer.is_stopped() == false:
		global_position += speed * direction * delta
		rotation = direction.angle()
	if $Hurtbox_Component.area_entered:
		queue_free()

func _on_timer_timeout() -> void:
	queue_free()

