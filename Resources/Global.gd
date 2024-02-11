extends Node

var player_pos : Vector2

func _process(_delta: float) -> void:
	player_pos = get_parent().get_child(1).get_node("Player").global_position
