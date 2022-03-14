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
	loc_file.load("C:/Games/ddkg2.save")
	if loc_file.get_value("Special","Fizmat_reached_stage_2","") == "1":
		Dialogue = [ # диалоги. 
			"29 апреля. 13:20. Методкабинет|G",
			"Аполлонов: Мы уже это обсуждали. Признавай отцовство.|W|character_paltos kek|START suspense",
			"Егорыч: Я в очередной раз запрашиваю доказательства и отсрочки до рождения.|W|character_egorich rage",
			"Жарова: Да у меня море свидетелей, которые свечку держали!|W|character_eera rage",
			"Все говорят, что я права и ты - отец!",
			"Аполлонов: Ну и прочие доказательства...|W|character_paltos kek",
			"Егорыч: И где эти свидетели? И где ваши доказательства?|W|character_egorich rage",
			"И чего вы добиваетесь, так вот давя на меня без Лентольны и Веръюрны?",
			"И меня должен допрашивать ТОЛЬКО следователь, либо ТОЛЬКО прокурор, либо ТОЛЬКО адвокат!|W|character_egorich suspects",
			"Аполлонов: Всё есть, все будут. А пока подпиши.|W|character_paltos kek|---|REACT surprise|show aff",
			"Егорыч: Что это? Копирбумага!|W|character_egorich rage",
			"Аполлонов: Положи планшет на место.|W|character_paltos suspects",
			"Я тебя щас положу!",
			"Тёмыч: Бум-бум, спокойной ночи!|W|character_paltos whatever",
			"Егорыч: Тьоха, хорошо, что ты пришел.|W|character_egorich yee",
			"Они просто нагло вешают на меня обвинения!",
			"Аполлонов: Сейчас просто нет прокурора и судьи, по этому официально мы просто ждём.|W|character_paltos kek",
			"Тёмыч: С копирбумагой, под которой признание вины, на которой... что это вообще такое?|W|character_paltos default|---|REACT surprise|show aff",
			"Это какой-то абсолютно рандомный документ про признание второго пришествия Иисус Христа каким-то Торгунаковым!",
			"Так ли вершится правосудие в моё отсутствие?",
			"Что я наделал! Сколько на моей памяти провели судов: каждый из них прошел вот так вот?",
			"Мне это разгребать до конца учебы!",
			"Аполлонов: У нас отлично налаженное судопроизводство.|W|character_paltos suspects",
			"Тёмыч: Я вижу.",
			"Чертила!|W|character_eera huh",
			"Ты серьезно спала с ботаном?",
			"Жарова: Как ты меня назвал?!",
			"И да, я спала с ботаном! И что?|W|character_eera hmpf",
			"Тёмыч: А об этом кто-то знает?",
			"Жарова: Гх...|W|character_eera damage",
			"Да, знает. Четверо свидетелей!|W|character_eera heh",
			"Тёмыч: С-Сколько?!",
			"Аполлонов: Так что не вовремя ты заявился! Даже тебе не выиграть это дело...|W|character_paltos kek",
			"...тем более тебе.",
			"Тёмыч: Пф.",
			"И как я могу поговорить со свидетелями?",
			"Жарова: На суде разберемся! Никто из наших не будет говорить с отбросом вроде тебя!|W|character_eera rage",
			"Тёмыч: Как скажешь. Но в таком случае, Егорыч идёт со мной и будет со-консулом на суде.",
			"Аполлонов: Ну, как скажешь...|W|character_paltos suspects",
			"Пойдём отсюда, Жарова. Для следственного коммитета есть отдельный кабинет, там мы сможем поговорить со свидетелями без этих двух.",
			"Жарова: С радостью!|W|character_eera hmpf", # hmpf rage huh heh default
			"...|W|character_egorich thinks|STOP all",
			"Егорыч: Они ушли... Наконец-то!|W|character_egorich yee",
			"Тёмыч: Я тоже не в восторге от них всех...",
			"Ладно, Егорыч, пока на тебя подавать в суд будут, поработаем.|W|character_egorich default",
			"Егорыч: ...'Копець', как говорится у нас в Запижорье.",
			"Тёмыч: Ну что же...|W|character_egorich default|START egor_theme",
			"MAIN",
			"Тёмыч: (Цветок Геннадий.)|B", # цветок
			"(Семечко с этим цветком было взято из того же пакетика)",
			"(В котором было семечко цветка Кондратия, стоящего на учительском столе в зале суда 10 лет назад)",
			"(Когда цветок Кондратий завял, кто-то сделал его копию из бумаги)",
			"(Которую фанатка андертейла разукрасила)",
			"(Цветок Геннадий же живет-поживает, его регулярно заливает Соня.)",
			"Егорыч: Что касается Геннадия...|W|character_egorich thinks|---|REACT surprise",
			"Ты его сегодня поливал?",
			"Тёмыч: Нет, а ты?",
			"Егорыч: Нет, а Соня?",
			"Тёмыч: Не знаю, а Лентольна?",
			"Егорыч: А сюда кто-то кроме нас троих заходит?",
			"Тёмыч: Нет, а ты?",
			"Егорыч: Да, а ты?",
			"Тёмыч: Я тоже, а Сонич?",
			"Егорыч: Наверное, а Лентольна?",
			"Тёмыч: Нет, а сюда кто-то кроме нас троих заходит?",
			"*3000 лет спустя*",
			"Егорыч: А танк?|W|character_egorich suspects|---|REACT surprise",
			"Тёмыч: ...Это зашло слишком далеко.|W|character_egorich laugh",
			"MAIN",
			"Тёмыч: Что в сейфе?|W|character_egorich thinks", # сейф
			"Егорыч: Мне кажется, что его механизм трижды заржавел.|W|character_egorich suspects",
			"Если там что-то и есть, то мы никогда не узнаем этого...",
			"Тёмыч: А что, если там находятся инкриминирующие улики против Дашкерина?|R|character_egorich all_of_sudden|---|REACT surprise",
			"Откуда этот сейф вообще взялся?",
			"Егорыч: ...|W|character_egorich thinks",
			"...|W|character_egorich suspects|---|REACT frustration",
			"MAIN",
			"Тёмыч: На этих полках столько разных папок...|W|character_egorich suspects|---|REACT surprise", # полка
			"Секретные документы совка, спецификации 'Эльбруса'",
			"Бухгалтерия всех депутатов Рідної Країни.",
			"Учет расходов Ольгасильны...",
			"MAIN",
			"Тёмыч: Зырь, Егорыч, эта штука такая острая, что ей можно кого-то зарезать!|W|character_egorich all_of_sudden|---|REACT surprise",
			"Егорыч: Хмм...|W|character_egorich thinks",
			"ЗАЩИЩАЙСЯ!|W|character_egorich objection|---|REACT intro_woosh|show badge",
			"Тёмыч: Ха! Я отразил твою атаку своим бейджиком!",
			"КОНТР-АТАКА!",
			"Егорыч: Не так быстро!|W|character_egorich rage|---|REACT intro_woosh",
			"На-на!",
			"Тёмыч: *уворот*",
			"	*грохот*|R|character_egorich all_of_sudden|STOP all|REACT sith_slam",
			"Тёмыч: Бл*ть...|W",
			"Увернулся...|W|---|START egor_theme",
			"MAIN",
			"Тёмыч: Если так подумать, то Жаренная сильно плоская|W|character_egorich thinks", # идеи
			"Егорыч: В смысле плоская?|W|character_egorich suspects|---|REACT surprise",
			"Тёмыч: Ну не похожа она на беременяшку.|W|character_egorich thinks",
			"Может, она всё это выдумала, а щас тебя хочет подставить зачем-то!",
			"Егорыч: А я думал, ты про грудь.|W|character_egorich suspects",
			"Тёмыч: Да и там она скорее Кирилл, чем Ира, кххххх|W|---|---|REACT frustration",
			"Егорыч: Хах, точно...|W|character_egorich laugh|---|REACT damage",
			"MAIN",
			"Егорыч: Надо провести расследование.|W|character_egorich thinks",
			"Тёмыч: Где начнем?",
			"Егорыч: Ну, походим по разным местам. В столовке щас много людей может быть...|W|character_egorich yee",
			"Тёмыч: Ну, щас восьмой урок будет, так что да, так оно и есть.",
			"Егорыч: Еще в аппендиксе на 2-м этаже 3 кабинета, там-то точно найдётся кто-нибудь!",
			"Тёмыч: И он к нам ближе, так что думаю будет целесообразным пойти сначала туда.",
			"Егорыч: Согласен.|W|character_egorich thinks",
			"MAIN",
			"Тёмыч: Зырь, Егорыч, это амулет.|W|character_egorich default|---|REACT surprise",
			"Егорыч: Выглядит интересно.|W|character_egorich thinks",
			"Это похоже на... магатаму из Ace Attorney.",
			"Тёмыч: Хмм, раз уж ты сказал... Действительно.|W|---|---|REACT surprise",
			"Только с зубчиками, как будто это ключ.",
			"Егорыч: Ключ-магатама?|W|character_egorich yee",
			"...Хм!|W|character_egorich thinks|---|REACT surprise",
			"Проба - 385. Это очень дешевый золотой амулет.|W|character_egorich suspects",
			"Чей он?",
			"Тёмыч: Захара Прохорова. Так сказала Лена... Или Лера. Как её там.",
			"Жора, короче.|W|character_egorich all_of_sudden|---|REACT frustration",
			"Егорыч: Агафон.|W|character_egorich laughs",
			"MAIN",
			"29 апреля. 14:15. Методкабинет|G",
			"Тёмыч: Одо что-то точно скрывает.|W|character_egorich thinks|START logic",
			"Я видел своими глазами один, красный псих-замок.",
			"Егорыч: Тьоха, без обид, но ты же понимаешь, что у человека без белки психи-замки в воздухе не летают?|W|---|---|REACT frustration",
			"Тёмыч: Не сомневаюсь. Но я явно под эффектом от этой шняги.|W|character_egorich suspects|---|---|show magatama",
			"Егорыч: Будем надеяться, что она действительно работает и работает исправно.",
			"SKIP_THIS|W|character_egorich default|START egor_theme",
			"MAIN",
		]
		Chats = [
			"Идеи?;94",
			"Что делать?;102",
			"",
			"",
		]
		Moves = [
			"Магазин;res://scenes/case_4/invest_4/afizmat_day1.tscn",
			"Аппендикс;res://scenes/case_4/invest_4/aappendix_day1.tscn",
			"Столовая;res://scenes/case_4/invest_4/amesshall_day1.tscn",
			"",
		]
		Shows = [
			"badge 82",
			"magatama 111",
		]
		$POIs/poi_1.text = "77"
		$POIs/poi_2.text = "48"
		$POIs/poi_3.text = "69"
		if loc_file.get_value("Special","Metod_reached_stage_2","0") == "1":
			print("MetodReachedStage2 == 1")
			if loc_file.get_value("Secrets","res://scenes/case_4/invest_4/amesshall_day1.tscn","1") == "84":
				print("Odo has secrets, "+loc_file.get_value("Secrets","res://scenes/case_4/invest_4/amesshall_day1.tscn","1")+" == 1")
				if loc_file.get_value("Special","Discussed_Odo_Psychelocks","0") == "1":
					goto_when_was = 46
					print("DiscussedOdoPSychelocks")
				else:
					loc_file.set_value("Special","Discussed_Odo_Psychelocks","1")
					loc_file.save("C:/Games/ddkg2.save")
					goto_when_was = 124
			else:
				goto_when_was = 46
		else:
			loc_file.set_value("Special","Metod_reached_stage_2","1")
			loc_file.save("C:/Games/ddkg2.save")
			goto_when_was = 0
	else:
		Dialogue = [ # диалоги. 
			"29 апреля. 13:00. Методкабинет|G", # строка 0
			"Тёмыч: Егорыч, че мы сюда припёрлись?|W",
			"Егорыч: Я просто забыл тут кое-что...|W|character_egorich thinks",
			"...",
			"Ага, вот!|W|character_egorich yee|---|REACT surprise|show aff",
			"Тёмыч: Что это?",
			"Егорыч: Да так, макулатура. Реферат.|W|character_egorich thinks",
			"Тёмыч: *пинг*|G|---|---|REACT surprise",
			"После того, что год назад было, я пингов от Лентольны боюсь, как огня.|W|character_egorich thinks",
			"'НЕ БРАТЬ (Лентольна)' *пинг в классной группе*: Дети, напоминаю, что завтра - День труда.|G|character_egorich default",
			"Прийти в соответствующей форме, завтра только первые три урока.",
			"*пинг добавления в новую группу*",
			"Группа 'ПОДГОТОВКА К ДНЮ ТРУДА', Е. Анатольевна: Артём, нужно подготовить на гитаре выступление. С Женей скооперируетесь.",
			"Милена, надо нарисовать плакат. Скооперируйтесь с Дашей и Саней",
			"Саня, нужно подготовить танец",
			"Саня, нужно прочесть стих",
			"Тёмыч: Бедный Саня...",
			"Е. Анатольевна: Я имею ввиду разных Сань",
			"Тёмыч: Все равно Саню жалко.",
			"Е. Анатольевна: Пожалуйста, без шуток в этой группе",
			"А то удалю.",
			"Тёмыч: ",
			"Егорыч: Ого, как ты в вайбер пустое сообщение послал?|W|character_egorich all_of_sudden|---|REACT surprise",
			"Тёмыч: Я сверг террористическую группировку в Днепре, мне ли не послать пустое сообщение в вайбер?",
			"Егорыч: Справедливо...|W|character_egorich thinks",
			"Эй, но я же там тоже был! Почему я не могу писать пустые сообщения?|W|character_egorich suspects",
			"Тёмыч: Ну...",
			"Блин, это теперь надо гитару достать...|W|character_egorich default|---|REACT frustration",
			"Егорыч: Но у тебя разве нет гитары?|W|character_egorich suspects|---|REACT surprise",
			"Тёмыч: Та есть, просто её надо в руки взять",
			"Репетировать",
			"ААААААААААА",
			"*звонок*|G|character_egorich all_of_sudden|---|REACT surprise",
			"Егорыч: Хмм, у людей закончился 7-й урок. А нам круто, у нас сегодня было только 4!|W|character_egorich yee",
			"Тёмыч: Бедные люди.|W|character_egorich default|START egor_theme",
			"MAIN",
			"Егорыч: Ситуация с Ирой Жаровой беспрецендентна.|W|character_egorich thinks",
			"Тёмыч: Та прям. В соседней школе прям эпидемия.|W|character_egorich all_of_sudden",
			"Знаешь, как ковид же передаётся?",
			"Только там у них передаются малыши.",
			"Егорыч: Капец.|W|character_egorich thinks",
			"Только я имел ввиду, что в той школе таки нашли 'работящую пчёлку'",
			"Одну на всех, причем",
			"А тут личность преступника остается загадкой...",
			"Она же может теперь обвинить кого угодно и все её 8,102 подружек будут за неё горой стоять!",
			"Тёмыч: Прикинь, если она скажет, что ты - батя её мелкого|W|character_egorich laugh",
			"Серьезно, ей понадобится сказать, что вместо 'самого популярного парня в школе' она шпёхнулась с кем-то нормальным",
			"Её сразу всё её окружение сожрёт",
			"Егорыч: Кхх",
			"Хотя мало ли...",
			"MAIN",
			"Егорыч: Предлагаю разойтись по домам. Ну, кто куда, разойтись.|W|character_egorich yee",
			"Тёмыч: Учитывая, как ты там выделываешься с этим мотором, сухой док для тебя - настоящий док",
			"Тьфу блин, доМ!",
			"Егорыч: Учитывая, как ты путаешь буквы и запинаешься",
			"То для тебя логопед - настоящим дом.|W|character_egorich objection|---|REACT intro_woosh",
			"Тёмыч: Ух чертила...!|W|character_egorich laugh|---|REACT frustration",
			"MAIN",
			"Тёмыч: (Цветок Геннадий.)|B", # цветок
			"(Семечко с этим цветком было взято из того же пакетика)",
			"(В котором было семечко цветка Кондратия, стоящего на учительском столе в зале суда 10 лет назад)",
			"(Когда цветок Кондратий завял, кто-то сделал его копию из бумаги)",
			"(Которую фанатка андертейла разукрасила)",
			"(Цветок Геннадий же живет-поживает, его регулярно заливает Соня.)",
			"Егорыч: Что касается Геннадия...|W|character_egorich thinks|---|REACT surprise",
			"Ты его сегодня поливал?",
			"Тёмыч: Нет, а ты?",
			"Егорыч: Нет, а Соня?",
			"Тёмыч: Не знаю, а Лентольна?",
			"Егорыч: А сюда кто-то кроме нас троих заходит?",
			"Тёмыч: Нет, а ты?",
			"Егорыч: Да, а ты?",
			"Тёмыч: Я тоже, а Сонич?",
			"Егорыч: Наверное, а Лентольна?",
			"Тёмыч: Нет, а сюда кто-то кроме нас троих заходит?",
			"*3000 лет спустя*",
			"Егорыч: А танк?|W|character_egorich suspects|---|REACT surprise",
			"Тёмыч: ...Это зашло слишком далеко.|W|character_egorich laugh",
			"MAIN",
			"Тёмыч: Что в сейфе?|W|character_egorich thinks", # сейф
			"Егорыч: Мне кажется, что его механизм трижды заржавел.|W|character_egorich suspects",
			"Если там что-то и есть, то мы никогда не узнаем этого...",
			"Тёмыч: А что, если там находятся инкриминирующие улики против Дашкерина?|R|character_egorich all_of_sudden|---|REACT surprise",
			"Откуда этот сейф вообще взялся?",
			"Егорыч: ...|W|character_egorich thinks",
			"...|W|character_egorich suspects|---|REACT frustration",
			"MAIN",
			"Тёмыч: На этих полках столько разных папок...|W|character_egorich suspects|---|REACT surprise", # полка
			"Секретные документы совка, спецификации 'Эльбруса'",
			"Бухгалтерия всех депутатов Рідної Країни.",
			"Учет расходов Ольгасильны...",
			"MAIN",
			"Тёмыч: Зырь, Егорыч, эта штука такая острая, что ей можно кого-то зарезать!|W|character_egorich all_of_sudden|---|REACT surprise",
			"Егорыч: Хмм...|W|character_egorich thinks",
			"ЗАЩИЩАЙСЯ!|W|character_egorich objection|---|REACT intro_woosh|show badge",
			"Тёмыч: Ха! Я отразил твою атаку своим бейджиком!",
			"КОНТР-АТАКА!",
			"Егорыч: Не так быстро!|W|character_egorich rage|---|REACT intro_woosh",
			"На-на!",
			"Тёмыч: *уворот*",
			"*грохот*|R|character_egorich all_of_sudden|STOP all|REACT sith_slam",
			"Тёмыч: Бл*ть...|W",
			"Увернулся...|W|---|START egor_theme",
			"MAIN",
			
		]
		Chats = [
			"Идеи?;36",
			"Что делать?;51",
			"",
			"",
		]
		Moves = [
			"Магазин;res://scenes/case_4/invest_4/afizmat_day1.tscn",
			"Аппендикс;res://scenes/case_4/invest_4/aappendix_day1.tscn",
			"",
			"",
		]
		Shows = [
			"badge 92",
		]
		goto_when_was = 34
	check_for_read_chats = false
	read_chats = [false,false,false,false]
	print($investigation_screen/ArcBG/Label.text[-1])
	if $investigation_screen/ArcBG/Label.text[-1] == "B":
		pass
