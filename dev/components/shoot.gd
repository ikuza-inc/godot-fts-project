class_name Shoot extends Components
var RayCast: RayCast3D
var StartPosition: Node3D
func shoot():
	var space = RayCast.get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(StartPosition.global_position, StartPosition.global_position - StartPosition.global_transform.basis.z*100)
	var collision = space.intersect_ray(query)
	if collision: return(collision.collider.name)
	else: return("")
