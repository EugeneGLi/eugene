extends Node
signal score_changed(new_score)

var score: int = 0

func add_score(amount: int) -> void:
	score += amount
	score_changed.emit(score)

func minus_score(amount: int) -> void:
	score -= amount
	score_changed.emit(score)

func reset_score() -> void:
	score = 0
	score_changed.emit(score)


func get_score() -> int:
	return score
