extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal activated

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().set_quit_on_go_back(false)




func _on_Back_pressed():
	get_tree().change_scene("res://MainMenu.tscn")


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_Back_pressed()
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		_on_Back_pressed()


