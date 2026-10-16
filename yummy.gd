extends Area2D

@export var score_value: int = 100

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		ScoreManager.add_score(score_value)
		queue_free()
