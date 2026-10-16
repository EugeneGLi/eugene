extends Control



func _on_start_pressed() -> void:
	ScoreManager.next_timeline_name = "introScene"
	get_tree().change_scene_to_file("res://scenes/demo.tscn")
