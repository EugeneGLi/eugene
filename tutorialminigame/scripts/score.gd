extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.game_state != 0:
		return
	
	var display_score = min(Global.score, 999999)
	text = "Score: " + str(display_score).pad_zeros(6)
