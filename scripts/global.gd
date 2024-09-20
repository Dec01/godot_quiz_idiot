extends Node


var motion = Vector2()
var up = Vector2(0, -1)
var speed = 10
var grav = 30
var grav_item = 0.04
var grav_item_yes = 0.03
var grav_item_heal = 0.03
var grav_item_speed
var jump = 750
var g_point = 0
var lvl_point = 0
var heal = 5
var lvl_items = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
