extends RigidBody2D

@onready var ray = $RayCast2D  # Reference to the RayCast2D node


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
		
func _physics_process(_delta):
	if linear_velocity.length() > 0:  # the ball is moving
		# Scale the ray length proportional to speed of ball
		ray.target_position = linear_velocity.normalized() * 150  
		ray.force_raycast_update()  # Update immediately
		
	if ray.is_colliding():
		var collider = ray.get_collider()  # Get the object it hit
		print("Hit:", collider.name)
