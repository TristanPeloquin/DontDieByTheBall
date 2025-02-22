extends Node2D

func _ready():
	var screen_size = get_viewport_rect().size
	
	create_wall(Vector2(screen_size.x / 2, 0), Vector2(screen_size.x, 10)) # Top wall
	create_wall(Vector2(screen_size.x / 2, screen_size.y), Vector2(screen_size.x, 10)) # Bottom wall
	create_wall(Vector2(0, screen_size.y / 2), Vector2(10, screen_size.y)) # Left wall
	create_wall(Vector2(screen_size.x, screen_size.y / 2), Vector2(10, screen_size.y)) # Right wall

func create_wall(position, size):
	var wall = StaticBody2D.new()
	var shape = CollisionShape2D.new()
	var rect_shape = RectangleShape2D.new()
	
	rect_shape.size = size
	shape.shape = rect_shape
	wall.position = position
	
	add_child(wall)
	wall.add_child(shape)
