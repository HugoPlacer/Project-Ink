extends Node2D


var time = OS.get_datetime()
var dict1 = {"day": time["day"], "month": time["month"], "year": time["year"]}
var dict2 = {"day": time["day"], "month": time["month"], "year": time["year"]}
var dict1_value = dict1["day"] / dict1["month"] / dict1["year"]

# Called when the node enters the scene tree for the first time.
func _ready():
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
