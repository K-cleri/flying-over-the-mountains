extends CanvasLayer
class_name GameUI

@onready var score_label: Label = %ScoreLabel
@onready var start_menu: Control = %StartMenu
@onready var game_over_menu: VBoxContainer = %GameOverMenu

func _ready() -> void:
	score_label.text = "0"

func update_score(value: int) -> void:
	score_label.text = str(value)

func game_over() -> void:
	game_over_menu.show()
	score_label.hide()


func _on_play_button_pressed():
	get_tree().reload_current_scene()
