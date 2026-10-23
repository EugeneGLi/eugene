extends Button


# Called when the node enters the scene tree for the first time.
func _pressed() -> void:
	Dialogic.Inputs.auto_skip.enabled = !Dialogic.Inputs.auto_skip.enabled


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if button_pressed:
			set_pressed_no_signal(false)

func _ready() -> void:
	button_pressed = Dialogic.Inputs.auto_skip.enabled
