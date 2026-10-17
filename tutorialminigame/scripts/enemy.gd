extends Area2D

var speed = 300
var is_dead = false
var death_speed = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Global.game_state != 0:
		queue_free()
		return

	if is_dead:
		scale -= Vector2.ONE * death_speed * delta
		if scale.distance_squared_to(Vector2.ZERO) <= 0.01:
			queue_free()
		return

	position -= transform.x * speed * delta

	if (position.x <= -Global.screen_bounds_x * 3/2):
		Global.score -= 3
		if Global.score < 0:
			Global.score = 0
		Global.on_end()
		queue_free()

func on_death():
	is_dead = true
