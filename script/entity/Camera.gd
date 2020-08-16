extends Camera2D

export (Vector2) var field_size

func _ready():
	var vp = get_viewport()
	var z = max(field_size.x / vp.size.x, field_size.y / vp.size.y)
	zoom = Vector2(z, z)
