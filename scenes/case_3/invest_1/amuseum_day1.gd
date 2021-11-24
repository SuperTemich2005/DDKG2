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
func _ready():
	Dialogue = [ # диалоги. 
		
	]
	#$investigation_screen.Cur = 119
	Chats = [
		
	]
	Moves = [
		
	]
	Shows = [
		
	]
	NoShow = 141-17
	check_for_read_chats = true
	goto_when_read = 134-17
	read_chats = [false,false,false,true]
