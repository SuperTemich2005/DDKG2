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
		"29 апреля. 13-14:00. Столовая",
		"Тёмыч: (...Тут нечего делать... пока что.)|B",
		"MAIN",
		"29 апреля. 14:00. Столовая.|G",
		"Егорыч: Что, будем искать свидетелей?|W|character_egorich default|START egor_theme",
		"Тёмыч: Да. Из допроса Эквинокс Прайм, я понял, что мы ищем одного из двух свидетелей-девочек.",
		"Егорыч: Хмм?|W|character_egorich thinks",
		"Тёмыч: А, тебя не было, пока я шантажировал Лену, точно.",
		"Стоп, а ты же должен быть в 320-м, разговаривать с Радомиром!|W|character_egorich all_of_sudden",
		"Егорыч: Ну, его там не оказалось.",
		"Тёмыч: Понимаю.",
		"Вкратце: Лера говорит, что Ира Жаренная жарилась с тобой на вписке, где помимо Леры, 'тебя' и сгоревшей-- ой, то есть, потерпевшей, было еще две девочки.",
		"Егорыч: Ясно.",
		"Тёмыч: ...Кстати, надо же записать это в записи суда, наверное!",
		"~~~ Показания Эквинокс Прайм записаны в записи суда|B|character_egorich yee|---|REACT fanfare_newev|123|report;Показания Леры;Описание вписки;'Егорыч' занимался незащищенным коитусом с Ирой Жаровой, за этим наблюдала Лера <Указать фамилию> и две свидетель'ницы'. Это произошло месяц назад. <Указать время и место действия>;1",
		"Надо будет вернуться и спросить подробностей.|W",
		"Егорыч: А вот спросим у неё.|W|character_egorich suspects|STOP all|REACT surprise",
		"???: Э?|W|character_odo huh",
		"Тёмыч: Прошу прощения, мы можем поговорить?",
		"???: Эм, нет, извините, я с парнями в школе не знакомлюсь.|W|character_odo ignore",
		"Тёмыч: Нет, я просто хочу обсудить одного очкастого ботана, который надругался над Ирой Жаровой.",
		"???: А, да?|W|character_odo thinks",
		"Ада: Ладно. Я - Ада Кирова.|W|character_odo default",
		"И, на самом деле, я хочу скорее забыть эти все вписки.",
		"Тёмыч: ('Рене Оуберженуа в роли Одо...')|B",
		"А что так? Не прижился разгульный образ жизни?|W",
		"Ада: М-да, можно и так сказать...|W|character_odo thinks",
	]
	Moves = [
		"Методкабинет;res://scenes/case_4/invest_4/ametod_day1.tscn",
		"Аппендикс;res://scenes/case_4/invest_4/aappendix_day1.tscn",
		"",
		"",
	]
	read_chats = [false,false,false,false]
	check_for_read_chats = false
	goto_when_read = 0
	loc_file.load("C:/Games/ddkg2.save")
	if loc_file.get_value("Special","Got_Magatama","") == "1":
		goto_when_was = 3
		Chats = [
			"",
			"",
			"",
			"",
		]
	else:
		goto_when_was = 1
		Chats = [
			"",
			"",
			"",
			"",
		]
