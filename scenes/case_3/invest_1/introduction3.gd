extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var save_file
func _ready():
	$AudioStreamPlayer.play()
	save_file = ConfigFile.new()
	save_file.load("C:/Games/ddkg2.save")
	save_file.erase_section("Locations")
	save_file.erase_section("Evidence")
	save_file.set_value("Evidence","1","badge;Бейдж дежурного;Мой бейдж дежурного.;noexp;1")
	save_file.set_value("Locations","Last",filename)
	save_file.save("C:/Games/ddkg2.save")


func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/case_3/invest_1/briefing.tscn")
