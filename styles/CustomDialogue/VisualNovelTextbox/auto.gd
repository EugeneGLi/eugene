extends Button


func _pressed() -> void:
	Dialogic.Inputs.auto_advance.enabled_until_user_input \
	= !Dialogic.Inputs.auto_advance.enabled_until_user_input

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if button_pressed:
			set_pressed_no_signal(false)
