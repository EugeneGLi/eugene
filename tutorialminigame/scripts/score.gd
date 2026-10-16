extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.game_state != 0:
		return

	text = "%d/%d" % [Global.score, Global.MAX_SCORE]
