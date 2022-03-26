extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var save_file
var loc_file
# Called when the node enters the scene tree for the first time.
func _ready():
	save_file = ConfigFile.new()
	var a = save_file.load(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
	print(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
	if a == OK:
		var spec = ""
		match save_file.get_value("General","Case"):
			"2":
				spec = "Подкупное дело."
			"3":
				spec = "Украденное дело."
			"4":
				spec = "Залётное дело."
			"E":
				spec = "Ууу читерюга!"
		$save_info.text = str(save_file.get_value("General","Case"))+" дело: "+spec
		if save_file.get_value("General","Case","") >= str(4):
			$logo.animation = "default2"
	else:
		Directory.new().make_dir(OS.get_system_dir(2)+"/AZIE Games")
		save_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
		$load_game.disabled = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_new_game_pressed():
	save_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
	save_file.set_value("General","Case","2")
	save_file.erase_section_key("General","Arc")
	save_file.erase_section("Locations")
	save_file.erase_section("Special")
	save_file.erase_section("Evidence")
	save_file.set_value("Evidence","1","badge:Значок дежурного, у каждого свой номер. Мой - 12. Док-во моей должности защитника")
	save_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
	get_tree().change_scene("res://scenes/case_2/introduction.tscn")


func _on_load_game_pressed():
	get_tree().change_scene(save_file.get_value("Locations","Last"))
