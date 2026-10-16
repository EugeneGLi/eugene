extends CanvasLayer

@export var main_hud : CanvasLayer

@onready var end_score = $EndScore
@onready var win_lose = $WinLose

func _process(delta: float) -> void:
	if Global.game_state != 0:
		main_hud.visible = false
		visible = true
		
		var display_score = min(Global.score, 999999)
		end_score.text = "Score: " + str(display_score).pad_zeros(6)
		
		if Global.game_state == 1:
			win_lose.text = "You Win!"
		else:
			win_lose.text = "You Suck!"
	else:
		main_hud.visible = true
		visible = false
