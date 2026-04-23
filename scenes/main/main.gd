extends Node2D

@onready var spawner: Spawner = $Spawner
@onready var player: Player = $Player
@onready var game_ui: GameUI = $GameUI

var score: int

func _on_player_on_game_started() -> void:
	spawner.timer.start()
	game_ui.start_menu.hide()

func _on_spawner_on_obstacle_crash():
	player.stop_movement()
	spawner.stop_opstacles()

func _on_ground_on_player_crash():
	spawner.stop_opstacles()
	game_ui.game_over()

func _on_spawner_on_player_score():
	score += 1
	game_ui.update_score(score)
