extends VehicleBody3D

const STEER_SPEED = 1.5
const STEER_LIMIT = 0.4

@export var engine_force_value = 40

var steer_target = 0


func _physics_process(delta):

	steer_target = Input.get_action_strength("turn_left") - Input.get_action_strength("turn_right")
	steer_target *= STEER_LIMIT

	if Input.is_action_pressed("reverse"):
		# Increase engine force at low speeds to make the initial acceleration faster.
		var speed = linear_velocity.length()
		if speed < 5 and speed != 0:
			engine_force = -clamp(engine_force_value * 5 / speed, 0, 100)
		else:
			engine_force = -engine_force_value
	else:
		brake = 0.0

	steering = move_toward(steering, steer_target, STEER_SPEED * delta)
