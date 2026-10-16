extends Area2D

var speed = 750

var lifespan = 1.2
var timer = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += transform.x * speed * delta
	timer += delta

	if timer >= lifespan or Global.game_state != 0:
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy") and area.is_dead == false:
		area.on_death()
		Global.score += 1
		Global.on_end()
		queue_free()
