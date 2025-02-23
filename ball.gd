extends RigidBody2D

func _ready():
	var random_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	apply_impulse(random_direction * 200)  # Initial push

	# Ensure contact monitoring is enabled
	contact_monitor = true
	max_contacts_reported = 1

func _integrate_forces(state):
	if state.get_contact_count() > 0:  # If the ball collides with something
		var velocity = state.get_linear_velocity()

		# Add randomness to the bounce angle
		var random_factor = randf_range(-.2, .2)
		var new_direction = velocity.rotated(random_factor).normalized()

		# Maintain the same speed after bouncing
		state.set_linear_velocity(new_direction * velocity.length())

		print("Ball bounced! New direction: ", new_direction)
