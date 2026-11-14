extends Button

func _ready() -> void:
	Dialogic.Inputs.auto_skip.toggled.connect(toggle_press)
# Called when the node enters the scene tree for the first time.
func _pressed() -> void:
	Dialogic.Inputs.auto_skip._set_enabled(!Dialogic.Inputs.auto_skip.enabled);

func toggle_press(is_enabled: bool) -> void:
	set_pressed_no_signal(is_enabled)
