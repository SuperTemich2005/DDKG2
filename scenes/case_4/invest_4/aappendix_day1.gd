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
		"Лена: Странно, я таких не знаю...|W|character_liena idk",
		"Тёмыч: А это - мой хороший друг, Лёха. Лёха Шустрый.",
		"Егорыч: ...|W|character_egorich suspects|---|REACT frustration",
		"Лена: Ммм, красивый...|W|character_liena default",
		"'Жека Целый': Ты там по 'мобиле' с 'подружанькой' болтала, а?|W|character_liena default",
		"Лена: Угу, эта дура залетела от какого-то ботана...|W|character_liena idk",
		"'Лёха Шустрый': А шо за ботан?|W|character_egorich thinks",
		"Лена: Та видела я этого ботана... Такой урод, ха-ха!|W|character_liena thinks",
		"Как там его... Егор? Еще и имя такое дурацкое...",
		"Не то что 'Лёша'...",
		"'Лёха Шустрый': М, а как насчет кафешки сегодня вечером?|W|character_egorich yee",
		"Лена: Замётано!|W|character_liena default",
		"Егорыч: GOTTEM!|W|character_egorich objection|START egorich_objection|REACT objection",
		"Тёмыч: GOT 'EM!",
		"Лена: Ч-Что? В смысле?|W|character_liena wtf",
		"Тёмыч: Наша сказка хороша, начинай сначала.",
		"Меня зовут Тьоха Тьохович, я из 9-В класса.|W|---|---|---|show badge",
		"Егорыч: Я - Егор Ботанович. Так что, еще идем в кафешку?|W|character_egorich yee",
		"Лена: В-Вы... Вы... Вы...|W|character_liena wtf",
		"Конченые просто!|R|character_liena rage",
		"Тёмыч: Такова наша служба.|W|character_liena ignore",
		"Лена: ...|W|character_liena ignore|START investigation_op",
		"MAIN",
		"Тёмыч: Предлагаю обсудить--|W|character_liena rage",
		"Лена: Своего друга-насильника обсуди!|W|---|---|REACT damage",
		"Тёмыч: 'Насильника'?",
		"Лена: Ой, всё...",
		"Егорыч: Информативная у тебя беседа, Тьоха.|W|character_egorich sigh",
		"Тёмыч: У нас☭.",
		"Егорыч: А у нас в квартире газ.|W|character_egorich laugh|---|REACT frustration",
		"Тёмыч: (Как бы то ни было, на конструктивную беседу можно не рассчитывать.)|B",
		"(Мы слишком сильно её обидели нашим каминг-аутом, кххх)",
		"MAIN",
	]
	Chats = [
		"Лена;56",
		"Ира Жарова;56",
		"Егор Ищенко;56",
		"Внешний вид;56",
	]
	Moves = [
		"Методкабинет;res://scenes/case_4/invest_4/ametod_day1.tscn",
		"",
		"",
		"",
	]
	Shows = [
		"a 0",
	]
	NoShow = 56
	loc_file.load("C:/Games/ddkg2.save")
	if loc_file.get_value("Special","Metod_reached_stage_2","") == "1":
		if loc_file.get_value("Special","Met_Liena","") == "1":
			goto_when_was = 54
		else:
			goto_when_was = 6
			loc_file.set_value("Special","Met_Liena","1")
			loc_file.save("C:/Games/ddkg2.save")
	else:
		goto_when_was = 5
	check_for_read_chats = false
	read_chats = [false,false,false,false]
	print($investigation_screen/ArcBG/Label.text[-1])
	if $investigation_screen/ArcBG/Label.text[-1] == "B":
		pass
