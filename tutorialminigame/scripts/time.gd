extends Label

var timer = 0

func _ready():
	text = str(Global.timer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.game_state != 0:
		return

	timer += delta

	if timer >= 1:
		timer -= 1
		Global.timer -= 1
		Global.on_end()
		text = str(Global.timer)
