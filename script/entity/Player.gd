extends RigidBody2D

export var speed = 3000
export var acceleration_factor = 10
export var move_threshold = 10
export (NodePath) var cam_node
export (Vector2) var field_size

var screen_size: Vector2
var target = Vector2()
var pressed = false
var cam: Camera2D
var cam_center: Vector2
var cam_zoom: Vector2

var cur_speed = 0

func aspec_ratio(sz: Vector2):
	return sz.x / sz.y

func _input(event):
	var set_target = false
	if event is InputEventScreenTouch:
		if event.is_pressed():
			set_target = true
			pressed = true
		else:
			pressed = false
	elif event is InputEventScreenDrag and pressed:
		set_target = true
		
	if set_target:
		var vp_eff = get_viewport().size * cam.zoom
		target = event.position * cam.zoom - vp_eff / 2


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	target = position
	# init cam
	cam = get_node(cam_node)
	cam_center = cam.position
	cam_zoom = cam.zoom
	print("cam center:", cam_center)
	print("cam zoom:", cam_zoom)
	
func _physics_process(delta):
#	print("Distance:", position.distance_to(target))
	var distance = position.distance_to(target)
	var ddmax = distance/delta if delta != 0 else 0 
	# print("delta: ", delta, ", distance: ", distance, ", ddmax: ", ddmax)
	if distance < move_threshold:
		linear_velocity = Vector2()
		cur_speed = 0
#		applied_force = Vector2()
		return
#	if distance < move_threshold * 5:
		# TODO hack..
#		cur_speed = cur_speed - speed * delta * acceleration_factor
	# if cur_speed < speed:
#		cur_speed = min(cur_speed + speed * delta * acceleration_factor, speed)
	cur_speed = min(ddmax, min(cur_speed + speed * delta * acceleration_factor, speed))
		
	# print("cur_speed: ",cur_speed)
	var f = (target - position).normalized()
	linear_velocity = f*cur_speed
	
#	applied_force = f*1000000
#	applied_force = f*100000
#	applied_force = (target - position)*speed
#	var l = applied_force.length()
#	if l > speed:
#		applied_force *= speed / l
		
#	if dt.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func __process(delta):
	# var velocity = Vector2()
	# if position.distance_to(target) > 10:
	# 	velocity = (target - position).normalized() * speed
	# else:
	# 	velocity = Vector2()
	
	# if velocity.length() > 0:
	# 	velocity = velocity.normalized() * speed
		
	# # Set Pos
	# position += velocity * delta
	# Clamp to screen bounds
	# position.x = clamp(position.x, 0, screen_size.x)
	# position.y = clamp(position.y, 0, screen_size.y)
