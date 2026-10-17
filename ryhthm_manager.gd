extends Node

@export var bar_width := 400.0
@export var cursor_speed := 300.0
@export var target_position := 200.0
@export var target_width := 40.0
@export var points := 100

var cursor_position := 0.0
var direction := 1.0

#EVERYTHING HERE IS SHIT IN A KETTLE — hardcoded poop cuz im lazy but then
#it made me do more work -> gotta make it auto scale
func _ready() -> void:
	var screen_size := get_viewport().get_visible_rect().size
	
	$RhythmBar.position = Vector2(
		(screen_size.x - bar_width) / 2,
		(screen_size.y - 30) / 2
	)

	$RhythmBar.size = Vector2(bar_width, 30)

	$RhythmBar/Bar.position = Vector2(0, 0)
	$RhythmBar/Bar.size = Vector2(bar_width, 30)

	$RhythmBar/Target.position = Vector2(
		target_position - target_width / 2,
		0
	)
	$RhythmBar/Target.size = Vector2(target_width, 30)

	$RhythmBar/Cursor.position = Vector2(0, -5)
	$RhythmBar/Cursor.size = Vector2(5, 40)
	$RhythmBar/Bar.position = Vector2(-bar_width/2, 0)
	$RhythmBar/Bar.size = Vector2(bar_width, 30)

	$RhythmBar/Target.position = Vector2(
		target_position - bar_width/2 - target_width / 2,0)
	$RhythmBar/Target.size = Vector2(target_width, 30)

	$RhythmBar/Cursor.position = Vector2(-bar_width/2, -5)
	$RhythmBar/Cursor.size = Vector2(5, 40)


func _process(delta: float) -> void:
	cursor_position += cursor_speed * direction * delta

	if cursor_position >= bar_width/2:
		cursor_position = bar_width/2
		direction = -1.0
	elif cursor_position <= -bar_width/2:
		cursor_position = -bar_width/2
		direction = 1.0

	$RhythmBar/Cursor.position.x = cursor_position

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("up"):
		check_tap()


func check_tap() -> void:
	if cursor_position >= 0 - target_width / 2 \
	and cursor_position <= 0 + target_width / 2:
		ScoreManager.add_score(points)

	else:
		ScoreManager.minus_score(50)
