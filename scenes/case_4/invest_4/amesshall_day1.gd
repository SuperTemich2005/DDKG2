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
		"Ада: Ладно. Я - Ада Кирова.|W|character_odo default|START investigation_op",
		"И, на самом деле, я хочу скорее забыть эти все вписки.",
		"Тёмыч: ('Рене Оуберженуа в роли Одо...')|B",
		"А что так? Не прижился разгульный образ жизни?|W",
		"Ада: М-да, можно и так сказать...|W|character_odo thinks|---|REACT frustration",
		"MAIN",
		"Тёмыч: Что ж, Одо...|W|character_odo default",
		"Ада: 'Одо'?|W|---|---|REACT surprise",
		"Егорыч: Не обращай внимания, он всем дает клички.|W|character_egorich laughs",
		"Ада: Ну, хотя бы не обидное что-то.|W|character_odo thinks",
		"Тёмыч: Откуда ты? И что ты?",
		"Ада: Я из 10-А. Занимаюсь танцами.|W|character_odo default",
		"Тёмыч: Информативно.",
		"(Надо спросить у неё по поводу той вписки и по поводу Егорыча.)|B",
		"MAIN",
		"Ада: То была моя первая и последняя 'вписка'|W|character_odo thinks", # huh thinks ignore default nervous
		"Месяц назад, у Жаровой дома.",
		"Мы там здорово напились, хотя лично я выпила немного",
		"И бухущие в хлам Жарова и какой-то пацан разделись и... В общем, щас она беременна.",
		"Тёмыч: Ты того пацана не знаешь?",
		"Ада: Нет, я его впервые увидела тогда и больше не видела.|W|character_odo default",
		"Тёмыч: Это случайно не этот ох какой неприятный тип?|W|character_egorich suspects|---|REACT frustration",
		"Ада: ... ... ...|W|character_odo thinks",
		"Да, это он!|W|character_odo huh",
		"Тёмыч: Ты на 100% уверена, что это именно Степаныч?",
		"Егорыч: ...?|W|character_egorich suspects|---|REACT surprise",
		"Ада: Д-Да, он!|W|character_odo huh",
		"Только он не 'Степаныч'|W|character_odo thinks",
		"Его зовут 'Егор', не?",
		"Тёмыч: Что ж, ты прошла проверку на внимательность.",
		"...Хмм.",
		"(Мне кажется, что её кто-то подговорил, чтобы она наговаривала на Егорыча. Хмм...!)|B",
		"(Может, напрямую спросить, кто её подговорил? Авось, чертила прогнётся)",
		"Скажи-ка, Одо, тебя кто-то заставил на Егогорыча наговаривать?|W",
		"Ада: Ч-Что? Нет!|W|character_odo huh",
		"С чего вы в-взяли?",
		"Я просто говорю, что видела.|W|character_odo nervous",
		"MAGATAMA R 72",
		"Тёмыч: (ЧТОООООООООООООООООООООООООООООООООООООООООООООООООООООООООООООООООООООООООООО)|B|---|---|REACT damage",
		"(Что это такое?!)",
		"(Это... психозамки из Ace Attorney?)",
		"(Я слишком много кваса выпил. Слишком.)",
		"(Шиза активирована.)",
		"(...Или нет?)",
		"(Может, эта штука Захара Прохорова не такая уж и простая?)|B|---|---|REACT surprise|show magatama",
		"HIDEMAGA",
		"Егорыч: Что-то не так?|W|character_egorich thinks",
		"Тёмыч: ...Всё не так.",
		"~~~ Показания Эквинокс Прайм обновлены|B|---|---|REACT fanfare_newev|1|report;Показания Леры;Описание вписки;'Егорыч' занимался незащищенным коитусом с Ирой Жаровой, за этим наблюдала Лера <Указать фамилию>, Ада Кирова и кто-то еще. Это произошло месяц назад у Жаровой в доме, все были в зюзю.;3",
		"MAIN",
		"MAGATAMA R crossexam",
		"--- Вписка ---|R|character_odo default|---|---",
		"Приехали.|W",
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
		if loc_file.get_value("Special","Visited_Mess_With_Odo","") == "1":
			$investigation_screen/AudioStreamPlayer.set_stream(load("res://sounds/investigation_op.ogg"))
			$investigation_screen/AudioStreamPlayer.play()
			$characters_all/character_odo.show()
			$characters_all/character_egorich.hide()
			goto_when_was = 27
		else:
			loc_file.set_value("Special","Visited_Mess_With_Odo","1")
			loc_file.save("C:/Games/ddkg2.save")
			goto_when_was = 3
		Chats = [
			"Ада Одо;28",
			"Вписка;37",
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
