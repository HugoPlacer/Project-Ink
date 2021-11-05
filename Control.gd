extends Control


var time = OS.get_datetime()
var date = {"day": time["day"], "month": time["month"], "year": time["year"]}
var date_value = date["day"] + (date["month"] * 30) + (date["year"] * 365)
var first_day #primer dia usado
var days_used #cantidad de dias usado
var save_path = "user://bluedata.dat"

var ink_total = 4.9 #cm de tinta total
var ink_used = 4.6 #cm de tinta usada
var percent_used = 0 #porcentaje de tinta usado
var percent_used_per_day = 0 #procentage usado al dia
var ink_lifetime = 250 #total de dias de tinta
var inktime = ink_lifetime #dias restantes de tinta

onready var fps_label = get_node("Fps")

var savedata = {
		"date" : date,
		"first_day" : first_day,
		"days_used" : days_used,
		"ink_lifetime" : ink_lifetime,
		"percent_used_per_day" : percent_used_per_day,
		"inktime" : inktime,
		"ink_total" : ink_total,
		"ink_used" : ink_used,
	}


func _ready():
	get_tree().set_quit_on_go_back(false)
	load_day()
	welcome_window()
	print(savedata)
	#date.hash = 15893849432522
	
	if date.hash() != savedata["date"].hash():
		print ("dia diferente")
		savedata["date"] = date
		first_day = savedata["first_day"]
		var first_day_value = first_day["day"] + (first_day["month"] * 30) + (first_day["year"] * 365)
		days_used = date_value - first_day_value
		savedata["days_used"] = days_used
		ink_used = savedata["ink_used"] - (percent_used_per_day * ink_total / 100)
		percent_used = 100 - ink_used * 100 / ink_total
		
		if days_used == 0:
			percent_used_per_day = percent_used / (days_used + 1)
		else:
			percent_used_per_day = percent_used / days_used
		
		savedata["percent_used_per_day"] = percent_used_per_day
		ink_lifetime = 100 / percent_used_per_day
		savedata["ink_lifetime"] = ink_lifetime
		ink_used = ink_used - (percent_used_per_day * ink_total / 100)
		savedata
		inktime = ink_lifetime - days_used
		savedata["inktime"] = inktime
		save_day()
		print (savedata)
	else:
		#cargar tota la info guardada en las variables
		first_day = savedata["first_day"]
		days_used = savedata["days_used"]
		ink_lifetime = savedata["ink_lifetime"]
		inktime = savedata["inktime"]
		ink_total = savedata["ink_total"]
		ink_used = savedata["ink_used"]
		percent_used = 100 - ink_used * 100 / ink_total
	


func _process(delta):
	fps_label.set_text(str(Engine.get_frames_per_second()))
	
	if ink_total != savedata["ink_total"]:
		#ink_total = float(ink_total)
		savedata["ink_total"] = ink_total
		percent_used = 100 - ink_used * 100 / ink_total
		save_day()
	
	if ink_used != savedata["ink_used"]:
		savedata["ink_used"] = ink_used
		percent_used = 100 - ink_used * 100/ink_total
		save_day()
	
	if ink_lifetime != savedata["ink_lifetime"]:
		savedata["ink_lifetime"] = ink_lifetime
		inktime = ink_lifetime - savedata["days_used"]
		savedata["inktime"] = inktime
		save_day()
		
	$Control/VBoxContainer2/DiasRestantes2.max_value = (ink_lifetime)
	$Control/VBoxContainer2/DiasRestantes2.value = (inktime)
	$Control/VBoxContainer2/DiasRestantes2/Dias.text = str(int(inktime), " dias")
	
	$Control/VBoxContainer2/TintaUsada.value = (percent_used)
	
	$Control/VBoxContainer2/HBoxContainer/DiasTotales.text = str(int(ink_lifetime), " dias")
	
	


func save_day():
	var file = File.new()
	file.open(save_path, File.WRITE)
	file.store_var(savedata)
	file.close()


func load_day():
	var file = File.new()
	if file.file_exists(save_path):
		file.open(save_path, File.READ)
		savedata = file.get_var()
		file.close()
	else:
		file.open(save_path, File.WRITE)
		savedata["first_day"] = date
		file.store_var(savedata)
		file.close()
		file.open(save_path, File.READ)
		savedata = file.get_var()
		#file.store_var(savedata) #wtf que es esto no seria get?
		file.close()
		welcome_window()
		
func welcome_window():
	#get_tree().paused = true
	var welcome_window = $WelcomeDialog
	welcome_window.popup_centered()


func _on_Back_pressed():
	get_tree().change_scene("res://MainMenu.tscn")


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_Back_pressed()
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		_on_Back_pressed()


func _on_used_camp_text_entered(new_text):
	ink_used = float(new_text)
	print (ink_used)


func _on_total_camp_text_entered(new_text):
	ink_total = float(new_text)
	print (ink_total)
