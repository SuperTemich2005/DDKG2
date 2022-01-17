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
var goto_when_was
#var BoxColor
func _ready():
#	BoxColor = Color(0.5,1,0.5,1)
	Dialogue = [ # диалоги. 
		"29 апреля. 13:01. Методкабинет|G", # строка 0
		"Егорыч: Что мы тут забыли?|W|character_egorich suspects",
		"Тёмыч: Эмм, ну...",
		"Меня сюда по инерции занесло.",
		"Егорыч: Капец ты инертный...|W|character_egorich laugh|---|REACT surprise",
		"MAIN",
	]
	Chats = [
		"",
		"",
		"",
		"",
	]
	Moves = [
		"Методкабинет;res://scenes/case_4/invest_4/ametod_day1.tscn",
		"",
		"",
		"",
	]
	Shows = [
		"badge 92",
	]
	goto_when_was = 5
	check_for_read_chats = false
	read_chats = [false,false,false,false]
	print($investigation_screen/ArcBG/Label.text[-1])
	if $investigation_screen/ArcBG/Label.text[-1] == "B":
		pass
