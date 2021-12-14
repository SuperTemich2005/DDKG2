extends Node2D
var Anims
var Dialogue
var Chats
var Shows
var Moves
var Ev
var Music
var EvCount
var loc_file = ConfigFile.new()
var read_chats
var check_for_read_chats
var goto_when_read
var NoShow
var BoxColor
func _ready():
	BoxColor = Color(0.5,1,0.5,1)
	Dialogue = [ # диалоги. 
		"Егорыч: Отлично",
		"Погнали!|W|character_temich default|START investigation_op",
		"MAIN",
	]
	#$investigation_screen.Cur = 119
	Chats = [
		"",
		"",
		"",
		"",
	]
	Moves = [
		"",
		"",
		"",
		"",
	]
	Shows = [
		"",
		"",
		"",
		"",
	]
	NoShow = 141-17
	check_for_read_chats = false
	read_chats = [false,false,false,false]
