extends Node2D
var Dialogue
var BoxColor
var Roles
func _ready():
	BoxColor = Color(0.5,0.5,1,1)
	Roles = [
		"character_egorich pro",
		"character_swetlan jud",
		#"character_temich hld",
		"character_sonya pro",
		"character_lentoln wit",
		"character_temich def",
	]
	Dialogue = [ # диалоги. 
		"",
		"Егорыч: ",
	]
	$investigation_screen._on_Next_pressed()
