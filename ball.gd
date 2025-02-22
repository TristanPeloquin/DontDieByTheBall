extends RigidBody2D

func _ready():
	var random_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	apply_impulse(random_direction * 200)  # Initial force
