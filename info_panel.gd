extends Panel

onready var rtl = $RichTextLabel
onready var controlnode = get_parent()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func add_line(key, value):
	rtl.append_bbcode("[b]{key}:[/b] {value}\n".format({
		key = key,
		value = value if str(value) != "" else "[color=#8fff](empty)[/color]",
	}))

# Called when the node enters the scene tree for the first time.
func _ready():
	add_line("date: ", controlnode.date)
	add_line("date_value: ", controlnode.date_value)
	add_line("first_day: ", controlnode.first_day)
	add_line("days_used: ", controlnode.days_used)
	add_line("ink_total: ", controlnode.ink_total)
	add_line("ink_used: ", controlnode.ink_used)
	add_line("percent_used: ", controlnode.percent_used)
	add_line("percent_used_per_day: ", controlnode.percent_used_per_day)
	add_line("ink_lifetime: ", controlnode.ink_lifetime)
	add_line("inktime: ", controlnode.inktime)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
