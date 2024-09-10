extends PlayerState

func on_enter() -> void:
	player.velocity.x = 0.0
	player.animation_player.play("idle")
	
	player.state_text.text = name

func physics_update(_delta: float) -> void:
	player.velocity.y += player.base_gravity * _delta
	player.move_and_slide()

	if not player.is_on_floor():
		change_state.emit(FALLING)
	elif Input.is_action_just_pressed("jump"):
		change_state.emit(JUMPING)
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		change_state.emit(RUNNING)
