extends Marker2D
@export var Enemy : PackedScene

var spawn_time = 1;
var timer = 0;

func _process(delta):
	if Global.game_state != 0:
		return

	timer += delta

	if timer >= spawn_time * (0.75 if Global.timer <= 15 else 1):
		timer = 0

		var enemy = Enemy.instantiate()
		owner.add_child(enemy)
		enemy.position = Vector2(Global.screen_bounds_x + 200, randi_range(100, Global.screen_bounds_y - 100))
