class_name PlayerCamera extends Components
@export var mouse_sensitivity = 0.002
@export var root: Camera3D
@export var body: CharacterBody3D

func _input(event):
	if Input.is_key_pressed(KEY_F5):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED: Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else: Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		body.rotate_y(-event.relative.x * mouse_sensitivity)
		root.rotate_x(-event.relative.y * mouse_sensitivity)
		root.rotation.x = clampf(root.rotation.x, -deg_to_rad(70), deg_to_rad(70))
