extends Control



func _on_start_pressed() -> void:
	ScoreManager.next_timeline_name = "introScene"
	ScoreManager.demo_music = "res://music/spaceship_interior.ogg"
	get_tree().change_scene_to_file("res://scenes/demo.tscn")


func _on_load_pressed() -> void:
	#open load file scene
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	#quit game
	get_tree().quit()


func _on_settings_pressed() -> void:
	#open settings scene
	pass # Replace with function body.
