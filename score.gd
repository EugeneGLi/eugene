extends Label

func _ready() -> void:
	ScoreManager.score_changed.connect(_on_score_changed)
	
	
	# Set the initial text
	update_display()


func update_display() -> void:
	text = "Score: %d" % [
		ScoreManager.score
	]

func _on_score_changed(_new_score: int) -> void:
	update_display()
