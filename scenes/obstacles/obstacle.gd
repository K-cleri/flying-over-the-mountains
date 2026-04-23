extends Node2D
class_name Obstacle

signal on_player_crashed
signal on_player_scored
@export var move_speed: float = 150.0

func _process(delta: float) -> void:
	position.x -= move_speed *  delta

func _on_area_body_entered(body: Node2D) -> void:
	on_player_crashed.emit()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func set_speed(value: float) -> void:
	move_speed = value


func _on_score_area_body_entered(body):
	on_player_scored.emit()
