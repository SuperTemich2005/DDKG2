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
	save_file.load(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
	save_file.erase_section("Locations")
	save_file.erase_section("Evidence")
	save_file.erase_section("Special")
	save_file.erase_section("Secrets")
	save_file.set_value("General","Case","4")
	save_file.set_value("Locations","Last",filename)
	save_file.set_value("Evidence","1","badge;Бейдж дежурного;Мой бейдж дежурного. Более для адвокатуры не используется.;Эти черти до сих пор считают меня вором. Пускай теперь сами выкручиваются, когда на них будут тыкать пальцем и обзывать ворами-насильниками-убийцами!;1")
	save_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")


func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/case_4/invest_4/afizmat_day1.tscn")
