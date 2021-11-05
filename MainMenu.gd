extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().set_quit_on_go_back(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_pressed():
	get_tree().change_scene("res://BluePen.tscn")



func _on_Button2_pressed():
	get_tree().change_scene("res://Debug.tscn")
