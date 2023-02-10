extends VehicleBody3D

@export var SteeringWheel: Node3D;

var steer_target = 0
var driving = false;

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		if event.pressed:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED; # todo: use event.relative to get movement in this mode
			driving = true;
		else:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE;
			driving = false;
	elif event is InputEventMouseMotion:
		if (driving):
			steer_target -= event.relative.x / 10;
			steer_target = clampf(steer_target, -45, 45);
			self.steering = deg_to_rad(steer_target);
			SteeringWheel.basis = Basis(Vector3(0, 0, 1), deg_to_rad(-steer_target));
	if (driving):
		engine_force = -1000;
		brake = 0;
	else:
		engine_force = 0;
		brake = 50;
