extends Panel

onready var controlnode = get_parent()

onready var diastotales = $VBoxContainer/HBoxContainer/DiasTotales
onready var tintatotal = $"VBoxContainer/HBoxContainer2/Tinta Total2"
onready var medicion = $"VBoxContainer/HBoxContainer3/Medicion tinta"

onready var edit_popup = $"Editar valores"

onready var blur = $"../Blur"

var index


# Called when the node enters the scene tree for the first time.
func _ready():
	diastotales.text = str(controlnode.days_used)
	tintatotal.text = str(controlnode.ink_total)
	medicion.text = str(controlnode.ink_used)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Editvalues_pressed():
	#blur.get_material().set_shader_param("blur_amount", )
	blur.show()
	show()


func _on_hide_pressed():
	blur.get_material().set_shader_param("blur_amount", 0)
	#blur.hide()
	hide()


func _on_enviar_pressed():
	pass
	#controlnode.ink_used = float(medicion.text)


func _on_DiasTotales_focus_entered():
	index = 0
	edit_popup.popup_centered()


func _on_Tinta_Total2_focus_entered():
	index = 1
	edit_popup.popup_centered()


func _on_Medicion_tinta_focus_entered():
	index = 2
	edit_popup.popup_centered()


func _on_Cancel_pressed():
	if edit_popup.is_visible():
		edit_popup.hide()


func _on_Accept_pressed():
	
	var text = float($"Editar valores/VBoxContainer/LineEdit".text)
	
	if index == 0:
		controlnode.days_used = text
		diastotales.text = str(text)
	
	elif index == 1:
		controlnode.ink_total = text
		tintatotal.text = str(text)
	
		
	elif index == 2:
		controlnode.ink_used = text
		medicion.text = str(text)
	
	edit_popup.hide()
	



