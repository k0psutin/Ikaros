extends IkarosCharacterState

var _start_y: float


func enter(_previous_state_path: String, _data: Dictionary = {}) -> void:
	_start_y = character.position.y
	character.velocity.y = character.jump_velocity
	character.jump_count += 1


func physics_update(delta: float) -> void:
	if Ikaros.player_settings.can_move_in_air and character == Ikaros.player:
		character.apply_direction_to_velocity(delta)
	var collided: bool = character.move_and_slide()

	# BUG: This will trigger for _any_ collision, not just collisions overhead
	if collided:
		character.should_jump = false
	elif character.position.y - _start_y >= character.jump_max_height:
		character.should_jump = false

	if not character.should_jump:
		finished.emit(FALLING)
