extends TextureRect

@export var textures: Array[Texture2D]

func _process(delta: float) -> void:
	if Global.game_state != 0:
		return

	var raw_t_index = floori(Global.timer * len(textures) / Global.MAX_TIME)
	var t_index = clampi(raw_t_index, 0, len(textures) - 1)
	texture = textures[t_index]
