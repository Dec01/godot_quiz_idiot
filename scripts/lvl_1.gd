extends Node2D

onready var item = preload("res://scenes/item.tscn")
onready var item_yes = preload("res://scenes/item_yes.tscn")
onready var item_heal = preload("res://scenes/item_heal.tscn")

func _ready():
	pass

var timer
var timer2
var timer3
var lvl_item_no = 0.3
var lvl_yes = 5
var lvl_heal = 15
var lvl_yes_rnd = 15
var lvl_heal_rnd = 25

func _init():
	timer = Timer.new()
	timer2 = Timer.new()
	timer3 = Timer.new()
	add_child(timer)
	add_child(timer2)
	add_child(timer3)
	timer.autostart = true
	timer.wait_time = lvl_item_no
	timer2.autostart = true
	timer2.wait_time = lvl_yes
	timer3.autostart = true
	timer3.wait_time = lvl_heal
	timer.connect("timeout", self, "_timeout")
	timer2.connect("timeout", self, "_timeout2")
	timer3.connect("timeout", self, "_timeout3")


func _timeout():
	go_item_no()

func _timeout2():
	go_item_yes()

func _timeout3():
	go_item_heal()
	
func go_item_no():
	var items = ["molotok", "pila"]
	for i in range(1):
		randomize()
		var a = int(rand_range(0,2))
		var new_item = item.instance()
		$workspase/back_lvl/items.add_child(new_item)
		new_item.set_item(items[a])
		new_item.position = Vector2(int(rand_range(200,1025)), int(rand_range(-145,-145)))
	Global.lvl_items += 1
	print(Global.lvl_items)

func go_item_yes():
	var new_time = random_time_yes()
	yield(get_tree().create_timer(new_time), "timeout")
	var items2 = ["kirpich"]
	for i in range(1):
		randomize()
		var a = int(rand_range(0,1))
		var new_item = item_yes.instance()
		$workspase/back_lvl/items.add_child(new_item)
		new_item.set_item(items2[a])
		new_item.position = Vector2(int(rand_range(200,1025)), int(rand_range(-145,-145)))
	Global.lvl_items += 1
	print(Global.lvl_items)

func go_item_heal():
	var new_time = random_time_heal()
	yield(get_tree().create_timer(new_time), "timeout")
	var items3 = ["kniga"]
	for i in range(1):
		randomize()
		var a = int(rand_range(0,1))
		var new_item = item_heal.instance()
		$workspase/back_lvl/items.add_child(new_item)
		new_item.set_item(items3[a])
		new_item.position = Vector2(int(rand_range(200,1025)), int(rand_range(-145,-145)))
	Global.lvl_items += 1
	print(Global.lvl_items)


func random_time_yes():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var int_num = rng.randi_range(1, lvl_yes_rnd)
	return int_num

func random_time_heal():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var int_num = rng.randi_range(1, lvl_heal_rnd)
	return int_num

func _process(delta):
	get_node("%left_blok/%coins").text = str(Global.lvl_point)
	get_node("%right_blok/%heal").text = str(Global.heal)
	if Global.heal == 0: 
		print("ТЫ УМЕР")
	if Global.lvl_items == 30:
		lvl_item_no = 0.8
		lvl_heal = 12
		lvl_yes = 4
		lvl_yes_rnd = 12
		lvl_heal_rnd = 20
		Global.grav_item = 0.06
		Global.grav_item_heal = 0.04
		Global.grav_item_yes = 0.04
	if Global.lvl_items == 60:
		lvl_item_no = 0.5
		lvl_heal = 10
		lvl_yes = 3
		lvl_yes_rnd = 10
		lvl_heal_rnd = 17
		Global.grav_item = 0.08
		Global.grav_item_heal = 0.06
		Global.grav_item_yes = 0.06
	if Global.lvl_items == 90:
		lvl_item_no = 0.3
		lvl_heal = 8
		lvl_yes = 2
		lvl_yes_rnd = 7
		lvl_heal_rnd = 13
		Global.grav_item = 0.1
		Global.grav_item_heal = 0.08
		Global.grav_item_yes = 0.08
