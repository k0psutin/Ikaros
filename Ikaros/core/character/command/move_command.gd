class_name IkarosCharacterMoveCommand
extends IkarosCharacterBaseCommand


class Params:
	var direction: Vector3


func execute(character: IkarosCharacter, params: Object = null) -> void:
	if params is Params:
		params = params as Params
		character.move(params.direction)
