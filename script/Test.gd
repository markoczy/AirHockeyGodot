extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var vp = get_viewport()
	
	print("vp:", vp.size)
#	print("Size:", vp.size)
	var zoom = max(504 / vp.size.x, 896 / vp.size.y)
	# $Camera2D.zoom = Vector2(504 / vp.size.x, 896 / vp.size.y)
	$Camera2D.zoom = Vector2(zoom, zoom)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
