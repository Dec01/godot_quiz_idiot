extends KinematicBody2D

var motion = Vector2()
var up = Vector2(0, -1)
var add = 0
var item = ""

func set_item(item_name):
	$Sprite.texture = load("res://img/items/%s.png" % item_name)
	item = item_name

func _ready():
	pass 
	
func _physics_process(delta):	
	motion.y += Global.grav_item
	position.x = clamp(position.x, 185, 1000)
	
	var col = move_and_collide(motion)


func _on_Area2D_body_entered(body):
	if body.name == "monstr":
		queue_free()
		Global.heal -= 1
		
	if body.name == "pol":
		queue_free()
