extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


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


func _on_CheckButton_toggled(button_pressed):
	#var gyro_and_grav = BluePen.get_node("Control/ViewportContainer").get("gyro_and_grav")
	#var gyrorotation = BluePen.get_node("Control/ViewportContainer").get("giro")
	
	
	
	if button_pressed == true:
		
		#gyrorotation = gyro_and_grav.transform.basis
		print ("true")
	else:
		#gyrorotation = 0
		print ("false")
