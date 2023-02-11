extends Node3D
@export var NodeToFollow:Node3D;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_transform.basis = NodeToFollow.global_transform.basis;
	global_transform.origin = NodeToFollow.global_transform.origin;
