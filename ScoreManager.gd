extends Node
signal score_changed(new_score)

var score: int = 0
var next_timeline_name: String
var demo_music: String

func add_score(amount: int) -> void:
	score += amount
	score_changed.emit(score)

func minus_score(amount: int) -> void:
	score -= amount
	score_changed.emit(score)

func reset_score() -> void:
	score = 0
	score_changed.emit(score)

func jump_to_tutorial_minigame() -> void:
	get_tree().change_scene_to_file("res://tutorialminigame/the_galager.tscn")

func jump_to_cutscene() -> void:
	get_tree().change_scene_to_file("res://scenes/demo.tscn")

func get_score() -> int:
	return score

func set_demo_music(name: String) -> void:
	demo_music = name

func reset_swing_downtown() -> void:
	get_tree().change_scene_to_file("res://scenes/start_screen.tscn")
