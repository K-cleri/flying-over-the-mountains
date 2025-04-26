extends Node2D

signal on_player_crashed
@export var move_speed: float = 150.0

func _process(delta: float) -> void:
	position.x -= move_speed *  delta

func _on_area_body_entered(body: Node2D) -> void:
	on_player_crashed.emit()
