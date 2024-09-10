extends PlayerState

func on_enter() -> void:
	player.velocity.y = -player.jump_force
	player.animation_player.play("jump")
	
	player.state_text.text = name

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	if input_direction_x > 0 :
		player.animation_player.flip_h = true
	elif input_direction_x < 0 :
		player.animation_player.flip_h = false
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.base_gravity * delta
	player.move_and_slide()

	if player.velocity.y >= 0:
		change_state.emit(FALLING)
