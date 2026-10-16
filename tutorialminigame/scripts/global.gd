extends Node

const MAX_TIME: int = 30
const MAX_SCORE: int = 20

var score = 0
var timer = MAX_TIME

var screen_bounds_y = 648
var screen_bounds_x = 1152

var game_state = 0 # -1 = loss and 1 = win

func reset_game():
	score = 0
	timer = 30
	game_state = 0
	get_tree().reload_current_scene()

func return_to_cutscene():
	ScoreManager.next_timeline_name = "tutorial_passed" if Global.game_state == 1 else "tutorial_failed"
	ScoreManager.jump_to_cutscene()

func on_end():
	if game_state != 0:
		return

	if (timer <= 0 and score < MAX_SCORE):
		print("YOU SUCK ASS")
		game_state = -1
		return

	if score >= MAX_SCORE and timer <= 0:
		print("WINNER WINNER CHICKEN DINNER")
		game_state = 1
