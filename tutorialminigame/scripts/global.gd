extends Node

var score = 0
var timer = 30

var screen_bounds_y = 648
var screen_bounds_x = 1152

var game_state = 0 # -1 = loss and 1 = win

func reset_game():
	score = 0
	timer = 30
	game_state = 0
	get_tree().reload_current_scene()

func on_end():
	if game_state != 0:
		return

	if (timer <= 0 and score < 5000):
		print("YOU SUCK ASS")
		game_state = -1
		return

	if score >= 5000 and timer <= 0:
		print("WINNER WINNER CHICKEN DINNER")
		game_state = 1
