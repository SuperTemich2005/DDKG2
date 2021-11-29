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
		"6 октября, 13:30. Музей-усадьба имени Пирогова.",
		"Экскурсовод: Здравствуйте, дети!|W|character_exkurs default",
		"Все: ...|R",
		"Экскурсовод: Сегодня, я расскажу вам историю известнейшего медика 19-го века,",
		"Николая Ивановича Пирогово, всемирно известного и любимого врача, который первым применил анестезию для операции.|W|character_exkurs insp",
		"Он так же...",
		"Егорыч: (Всё это, конечно, очень интересно...)|B",
		"(Но Радомир что-то хотел мне тайком сказать...)|B",
		"(Его нет поблизости, может, он уже куда-то ушел...?)",
		"Радомир: Эй!|R",
		"Егорыч: А?|W",
		"",
	]
	#$investigation_screen.Cur = 119
	Chats = [
		
	]
	Moves = [
		
	]
	Shows = [
		
	]
	NoShow = 141-17
	check_for_read_chats = false
	read_chats = [false,false,false,false]
