extends AudioStreamPlayer

var demo_music_name: String

func _process(delta: float) -> void:
	if demo_music_name != ScoreManager.demo_music:
		demo_music_name = ScoreManager.demo_music
		stream = load(demo_music_name)
		play()
