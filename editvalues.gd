extends Panel

onready var controlnode = get_parent()

onready var medicion = $VBoxContainer/HBoxContainer3/LineEdit

onready var blur = $"../Blur"


# Called when the node enters the scene tree for the first time.
func _ready():
	medicion.text = str(controlnode.ink_used)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Editvalues_pressed():
	blur.show()
	show()


func _on_hide_pressed():
	blur.hide()
	hide()


func _on_enviar_pressed():
	controlnode.ink_used = float(medicion.text)


