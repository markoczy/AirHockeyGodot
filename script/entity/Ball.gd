extends RigidBody2D

export var max_velocity = 1000
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if linear_velocity.length() > max_velocity:
		linear_velocity = max_velocity * linear_velocity.normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
