extends Sprite2D

var speed = 550.0
var direction : Vector2


func _physics_process(delta: float) -> void:
	if $Timer.is_stopped() == false:
		global_position += transform.x * speed * delta
		

func _on_timer_timeout() -> void:
	queue_free()

func _on_hurtbox_component_area_entered(area: Area2D) -> void:
	if area is Hitbox:
		queue_free()
