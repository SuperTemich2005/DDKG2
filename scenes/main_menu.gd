extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var save_file
# Called when the node enters the scene tree for the first time.
func _ready():
	print(str(149*25))
	save_file = File.new()
	save_file.open("C:/Games/ddkg2.save", File.READ)
	if save_file.file_exists("C:/Games/ddkg2.save"):
		$save_info.text = save_file.get_as_text().split("-")[0]+" дело."
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_new_game_pressed():
	save_file.open("C:/Games/ddkg2.save", File.WRITE)
	save_file.store_string("2-badge")
	get_tree().change_scene("res://scenes/case_2/introduction.tscn")
