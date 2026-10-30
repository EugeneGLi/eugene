extends Button


# Called when the node enters the scene tree for the first time.
func _pressed() -> void:
	Dialogic.Inputs.auto_skip.enabled = !Dialogic.Inputs.auto_skip.enabled
