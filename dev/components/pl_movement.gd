class_name PlayerMovement extends Components
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@export var speed = 5
@export var jump_speed = 5
@export var root: CharacterBody3D

func _physics_process(delta):
	root.velocity.y += -gravity * delta
	var input = Input.get_vector("left", "right", "forward", "back")
	var movement_dir = root.transform.basis * Vector3(input.x, 0, input.y)
	root.velocity.x = movement_dir.x * speed
	root.velocity.z = movement_dir.z * speed

	root.move_and_slide()
	if root.is_on_floor() and Input.is_action_just_pressed("jump"):
		root.velocity.y = jump_speed
