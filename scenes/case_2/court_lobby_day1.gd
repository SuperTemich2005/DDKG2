extends Node2D
var Anims
var Dialogue
var Ev
var Music
var loc_file = ConfigFile.new()
func _ready():
	Dialogue = [ # диалоги. 
		"",
		"5 октября. Около 18:00. Подвал G",
		"Тёмыч: (Всё произошло так спонтанно...) B",
		"(Расследование, предъявленное обвинение, Соня...)",	
		"",
	]
	Music = [
		"",
		"",
	]
	Anims = [ # массив, в котором 1 слово это перс, а 2 - его анимка
		"",
		"",
	]
	loc_file.load("C:/Games/ddkg2.save")
	loc_file.set_value("Locations","Last",filename)
	loc_file.save("C:/Games/ddkg2.save")
	
