extends KinematicBody2D


func _ready():
	pass 
	
func _physics_process(delta):
	if Input.is_action_pressed("left"):
		Global.motion.x -= Global.speed
	elif Input.is_action_pressed("right"):
		Global.motion.x += Global.speed
	else: Global.motion.x = 0
	if Input.is_action_pressed("up") and is_on_floor():
		Global.motion.y = -Global.jump
	
	Global.motion.y += Global.grav
	Global.motion = move_and_slide(Global.motion, Global.up)
	
	position.x = clamp(position.x, 185, 1000)
	
