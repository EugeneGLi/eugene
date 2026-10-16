extends Area2D 
@export var Bullet : PackedScene

var speed = 500
var cooldown = 0.2
var timer = 0
var can_shoot = true

var padding = 100;

func _ready() -> void:
	position = Vector2(padding, padding)

func _process(delta: float) -> void:
	if Global.game_state != 0:
		return
	
	var direction = 0

	if Input.is_action_pressed("move_up"):
		direction -= 1
	if Input.is_action_pressed("move_down"):
		direction += 1
	
	if direction != 0:
		position += Vector2(0, direction * speed * delta)
		position = position.clamp(Vector2(0, padding), Vector2(Global.screen_bounds_x,Global.screen_bounds_y - padding));
	
	if not can_shoot:
		timer += delta
		
		if timer >= cooldown:
			timer = 0
			can_shoot = true
	
	if Input.is_action_just_pressed("shoot") and can_shoot:
		can_shoot = false
		var bullet = Bullet.instantiate();
		owner.add_child(bullet)
		bullet.transform = $Gun.global_transform;
		
func _on_area_entered(area : Area2D):
	if area.is_in_group("enemy"):
		area.queue_free()
		Global.score -= 1000
		Global.on_end()
