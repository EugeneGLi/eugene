extends Button

signal back_requested
func _pressed() -> void:
	back_requested.emit()
