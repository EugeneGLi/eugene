extends Button

var history_opened := false
# Called when the node enters the scene tree for the first time.
func _pressed() -> void:
	if !history_opened:
		Dialogic.History.open_history()
		history_opened = true
	else:
		Dialogic.History.close_history()
		history_opened = false
