extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var save_file
var loc_file
# Called when the node enters the scene tree for the first time.
func _ready():
	print(str(149*25))
	save_file = ConfigFile.new()
	save_file.load("C:/Games/ddkg2.save")
	if save_file.load("C:/Games/ddkg2.save") == OK:
		$save_info.text = str(save_file.get_value("General","Case"))+" дело."
	else:
		$load_game.disabled = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_new_game_pressed():
	save_file.save("C:/Games/ddkg2.save")
	save_file.set_value("General","Case","2")
	save_file.set_value("Evidence","1","badge:Значок дежурного, у каждого свой номер. Мой - 12. Док-во моей должности защитника")
	save_file.erase_section("Locations")
	save_file.save("C:/Games/ddkg2.save")
	get_tree().change_scene("res://scenes/case_2/introduction.tscn")


func _on_load_game_pressed():
	get_tree().change_scene(save_file.get_value("Locations","Last"))
