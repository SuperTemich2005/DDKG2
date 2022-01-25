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
		"29 апреля. 13:01. Аппендикс|G", # строка 0
		"Егорыч: Что мы тут забыли?|W|character_egorich suspects",
		"Тёмыч: Эмм, ну...",
		"Меня сюда по инерции занесло.",
		"Егорыч: Капец ты инертный...|W|character_egorich laugh|---|REACT surprise",
		"MAIN",
		"29 апреля. 13:21. Аппендикс|G",
		"Егорыч: Скажи, Тьоха, почему это место называется аппендиксом?|W|character_egorich thinks|START investigation_op",
		"Тёмыч: Ну, это как нарост на коридоре - тупик... Вот отсюда и название",
		"...типа?|W|character_egorich suspects|---|REACT frustration",
		"Как бы то ни было, нам нужно найти свидетеля.",
		"Кто-то должен знать что-то про Жарову или че-то.",
		"Тёмыч: Ох ты ж ё-маё...|W|character_egorich all_of_sudden|STOP all|REACT surprise",
		"???: А я такая говорю - ну зачем с ботаном?|G|character_liena default",
		"Тёмыч: (ЧТО. ЭТО. ТАКОЕ.)|B|character_egorich thinks",
		"???: Вот с В-класса Лёша есть, он крутой, сильный, стройный, при деньгах|G|character_liena default",
		"А она дура такая...",
		"Тёмыч: (Еб*ть)|B",
		"(Бл*ть)",
		"(П*здец...)",
		"(Еб... Еб... Еб... Еб...)",
		"Егорыч: Знаешь, Тьоха, я тут 9 лет учусь|W|character_egorich thinks|START investigation_op",
		"Но такого кадра... я не видел никогда...",
		"Тёмыч: Моё субъективное мнение - п*зда тебе если тебе приходится так краситься",
		"Егорыч: Ну, согласен.",
		"???: Ой, я перезвоню. Тут два красавчика на мене засматриваются.|G",
		"Давай, увидимся...",
		"Тёмыч: *кхм*|W",
		"Я дико извиняюсь, но я тебя задержу.",
		"???: Задерживай, красавчик. Я вся твоя!",
		"Лена: Меня зовут Лена, я из 10-А",
		"Тёмыч: Ммм. А я Жека Целый, я из 10-Г.",
		"Егорыч: ...|W|character_egorich suspects|---|REACT frustration",
		"Лена: Странно, я таких не знаю...",
		"",
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
	loc_file.load("C:/Games/ddkg2.save")
	if loc_file.get_value("Special","Metod_reached_stage_2","") == "1":
		goto_when_was = 6
	else:
		goto_when_was = 5
	check_for_read_chats = false
	read_chats = [false,false,false,false]
	print($investigation_screen/ArcBG/Label.text[-1])
	if $investigation_screen/ArcBG/Label.text[-1] == "B":
		pass
