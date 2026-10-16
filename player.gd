extends CharacterBody2D

@export var speed = 400
@export var grav = 400
#@export var jump = 400

@export var max_jump_distance = 400
@export var jump_time = 0.8

var dir

@onready var trajectory: Line2D = $Trajectory

func _ready() -> void:
	trajectory.clear_points()

func _physics_process(delta: float) -> void:
	
	
	
	if not is_on_floor():
		velocity.y += grav*delta
	else:
		
		dir = Input.get_axis("left","right");
		velocity.x = dir * speed
		velocity.y = 0;
		update_trajectory()
		if(Input.is_action_pressed("up")):
			launch()
		
	move_and_slide()

func launch() -> void:
	var target := get_global_mouse_position()
	var displacement := target - global_position

	# Don't allow jumps beyond the maximum horizontal range.
	if abs(displacement.x) > max_jump_distance:
		return

	var vx = displacement.x / jump_time # need to change x movement cuz idk what im cooking
	var vy = (displacement.y - 0.5 * grav * jump_time * jump_time) / jump_time

	velocity = Vector2(vx, vy)
	trajectory.clear_points()


func update_trajectory() -> void: #draws the trajectory of player to mouse
	var target := get_global_mouse_position()
	var displacement := target - global_position

	if abs(displacement.x) > max_jump_distance:
		trajectory.clear_points()
		return

	var vx = displacement.x / jump_time

	var vy = (
		displacement.y
		- 0.5 * grav * jump_time * jump_time
	) / jump_time

	var initial_velocity := Vector2(vx, vy)

	var points := PackedVector2Array()
	var step := 0.04
	var simulation_time := 0.0

	while simulation_time <= jump_time:
		var point := (
			global_position
			+ initial_velocity * simulation_time
			+ Vector2(0.0,0.5 * grav * simulation_time * simulation_time)
		)

		points.append(to_local(point))
		simulation_time += step

	trajectory.points = points
	
