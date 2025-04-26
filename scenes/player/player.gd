extends CharacterBody2D

signal on_game_started
@export var gravity: float = 1000.0
@export var jump_force: float = 400.0
@export var max_speed: float = 400.0
@export var rotation_speed: float = 2.0
var is_started: bool = false
var should_process_input: bool = true

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	velocity.y = min(velocity.y, max_speed)
	if Input.is_action_just_pressed("jump") && should_process_input:
		if is_started == false:
			is_started = true
			on_game_started.emit()
		jump()
		
	if is_started == false:
		return
	move_and_slide()
	rotate_player()

func jump() -> void:
	velocity.y = -jump_force
	rotation = deg_to_rad(-45)

func rotate_player() -> void:
	if velocity.y > 0 and rad_to_deg(rotation) <= 60:
		rotation += rotation_speed * deg_to_rad(1)
