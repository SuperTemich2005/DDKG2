extends Node2D
var Anims
var Dialogue
var Ev
var Music
var loc_file = ConfigFile.new()
var Cast
func _ready():
	Anims = [
		"",
		"character_lentoln sigh Е. Анатольевна: Достаточно R POS jud",
		"В принципе, у меня уже сложилось представление о вердикте W",
		"Суд выслушал обе стороны и решил, что подсудимая Мария Фильмонова",
		"character_lentoln rage Виновна! SUPER",
		"На этом все, судебное заседание объявляется закрытым. LESSER",
		"OUT res://scenes/main_menu.tscn",
		"",
	]
	Music = [
		"",
		"START trial Е. Анатольевна: Достаточно R",
		"В принципе, у меня уже сложилось представление о вердикте W",
		"Суд выслушал обе стороны и решил, что подсудимая Мария Фильмонова",
		"REACT intro_woosh Виновна! SUPER",
		"На этом все, судебное заседание объявляется закрытым. LESSER",
		"OUT res://scenes/main_menu.tscn",
		"",
	]
	Dialogue = [
		"",
		"Е. Анатольевна: Достаточно R",
		"В принципе, у меня уже сложилось представление о вердикте W",
		"Суд выслушал обе стороны и решил, что подсудимая Мария Фильмонова",
		"Виновна! SUPER",
		"На этом все, судебное заседание объявляется закрытым. LESSER",
		"OUT res://scenes/main_menu.tscn",
		"",
	]
