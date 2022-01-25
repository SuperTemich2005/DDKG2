extends Node2D
var Anims
var Dialogue: PoolStringArray
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
	Dialogue = [ # диалоги. 
		"29 апреля. 12:55. Ларёк 'Физмат' рядом с Лицеем 99.|G",
		"Тёмыч: ДА БЛИНААААА|W|character_egorich suspects|START peaceful_spring|REACT damage",
		"Егорыч: Что-то не так?",
		"Тёмыч: Щас вроде не то, что очень тепло,",
		"Но это грёбаное солнце шпалит мне в хлебальник, как Ярыло Даждьбогу в рыло!",
		"Егорыч: Ты никогда не тратил навыков в рифмовании и прочем.|W|character_egorich yee",
		"Тёмыч: Я скорее сдам пост адвоката, чем сдам красноречие, ирод окаянный!",
		"Егорыч: Кстати, чела из шестого класса обвиняют в краже журнала.|W|character_egorich thinks",
		"Тёмыч: В шестом классе можно успешно доказать, что журнал крал не ты.",
		"И не говори МНЕ, что это невозможно!",
		"Егорыч: Ну, действительно.|W|character_egorich suspects|---|REACT surprise",
		"Ну, ладно. Я просто думал, что ты не будешь против.|W|character_egorich default",
		"В конце, близкая к душе и телу ситуация",
		"Тёмыч: То, как меня кинули *два года* назад мне ближе.|W|---|---|REACT surprise",
		"Да и тем более, почему ты сам не займешься этим делом? Этим кто угодно может заниматься.",
		"Егорыч: Ну, я не смогу. За то мне известно, что у нас на горизонте возникает новый человек.",
		"Тёмыч: Да, Лентольна однажды сказала, что если я вернусь в суд, то поставит мне законного консула.|W|character_egorich thinks",
		"Типа ты слишком нелегальный, Егорыч.|W|character_egorich suspects|---|REACT surprise",
		"Егорыч: Как так получилось...",
		"Тёмыч: Она сказала, что сейчас в историко-правовом классе отбывает срок Захар Прохоров.",
		"Кроме имени я ничего не знаю.",
		"Егорыч: Странно, мне она назвала другое имя.|W|character_egorich thinks|---|REACT surprise",
		"Девочку.",
		"Тёмыч: Ну, мне-то вообще всё равно.|W|character_egorich default|---|REACT frustration",
		"Егорыч: Соня без дела сидит, как ты ушел.",
		"Тёмыч: Мне ли не знать",
		"Егорыч: Неужели ты вообще не хочешь--",
		"Тёмыч: Давай лучше по домам и в майн? В майне мне есть, чем заняться.",
		"Егорыч: Я планировал вообще-то тебя позвать в морской док.|W|character_egorich thinks",
		"Тёмыч: А что? У нас появились эти триклятые пропеллеры?",
		"Егорыч: Моторы.|W|character_egorich suspects|---|REACT frustration",
		"Тёмыч: А, ну извините, капитан Егорыч.",
		"Егорыч: Короб нам отлично помогает с лодкой.|W|character_egorich thinks|---|REACT surprise",
		"Его инженерные навыки достаточно продвинутые, но с запчастями и моторами он помогает лучше всего.",
		"Тёмыч: Еще продвинутее его способ заработка.",
		"Егорыч: Как ты думаешь, куда мы прежде всего поплывём?",
		"Тёмыч: Это решение уже за Коробом, он же больше всех скинулся.",
		"Эм, нет, кстати, сегодня я не смогу в док съездить.",
		"Но в гитхабе есть новая версия прошивки. Связь должна работать. Приедешь - скачай.",
		"Егорыч: Хорошо, проверю.|W|character_egorich yee|---|REACT surprise",
		"Тёмыч: (В конце прошлого года, ученые научились синтезировать новый материал)|B",
		"(Дешевый в производстве, за то прочный и плотный, как закалённая сталь)",
		"(Его начали использовать для массового производства подводных лодок и кораблей, он называется 'кракенит')",
		"(С ним даже мы, школьники, смогли построить свою подлодку!)",
		"(Хотя в нашем бюджете была всего лишь тысяча долларов. Настолько кракенит крутой - с ним можно делать настоящие подлодки и не тратить триллионов долларов.)",
		"(Короб бан Эскиз, это наш брат по интересам, разделяющий наше желание исследовать мир)",
		"(То есть, делать то, что я хочу делать после этой всей адвокатуры.)",
		"(Он перевелся в нашу школу на нашей параллели и занимается переводом на разные языки и программированием.)",
		"(Фриланся, он скинулся на подводную лодку больше всех)",
		"(Егорыч занимается инженерией, я и Эскиз - программированием)",
		"(За это время, Меридиан вновь подаёт признаки жизни, однако я особо не волнуюсь... пока что.)",
		"Егорыч: Тёмыч?|W|character_egorich suspects|START peaceful_spring",
		"Тёмыч: М?",
		"MAIN",
		"Тёмыч: Эй, Егорыч, слышал про Жаркую?|W|character_egorich default",
		"Егорыч: Про Жарову? Да, кстати, она вроде от кого-то залетела|W|character_egorich thinks",
		"Тёмыч: Удивил. Учитывая, какая она затасканная и отшпёханная,",
		"удивительно, что только сейчас.|W|character_egorich laugh",
		"Егорыч: Как ты думаешь, кто герой-осеменитель?|W|character_egorich thinks",
		"Тёмыч: Из нас двух может быть только один, и то не я.|W|character_egorich suspects",
		"Егорыч: Очень смешно.",
		"Тёмыч: А как может быть не смешно, ирод окаянный?|W|character_egorich thinks",
		"Егорыч: Ну вот как ты только что пошутил, вот так и может.|W|character_egorich objection|---|REACT intro_woosh",
		"Тёмыч: Ух чертила!|W|character_egorich laugh",
		"MAIN",
		"Егорыч: Я думаю, что в последний звонок мы сможем уплыть!|W|character_egorich yee",
		"Тёмыч: Капец, иметь собственную подлодную лодку...|W|character_egorich default",
		"Егорыч: Нам осталось сделать двигательную систему, перепроверить корпус на герметичность и гравировку сделать",
		"Тёмыч: 'Мореплаватель NX-1', много ли подлодок с таким названием?",
		"Егорыч: Не знаю.|W|character_egorich thinks",
		"А, еще ведь нужно сделать интерфейс и наладить прочую механику, а то мотор один раз чуть мне в жбан не заехал. Клапан хлипкий попался.|W|character_egorich all_of_sudden",
		"Тёмыч: (Егорыч - главный инженер подлодки. Ему ли не дать качественных клапанов, чтобы угрозы для жизни меньше было?)|B|character_egorich yee",
		"До чего дошел прогресс. Интересно, а с таким можно строить дешманские ракеты?|W|character_egorich thinks",
		"Егорыч: Хочешь полететь в космос?",
		"Тёмыч: А что?",
		"Егорыч: Ну... Подумаем.|W|character_egorich suspects",
		"Тёмыч: Обязательно подумаем!|W|character_egorich yee",
		"MAIN",
		"Тёмыч: На подходе потенциально новый адвокат, чел из историко-правового класса.|W|character_egorich thinks",
		"Лентольна говорила, что поставит его мне консулом, если что. Захар Прохоров.",
		"Егорыч: Мне Лентольна говорила про девочку.",
		"Тёмыч: Вот пускай их друг для друга консулом ставит, чтобы потом появился какой-нибудь Вася Пупкин и нагнул их обоих.|W|character_egorich all_of_sudden",
		"Егорыч: Тьоха, ну че ты так категорично?|W|character_egorich thinks|---|REACT surprise",
		"Тёмыч: В смысле?",
		"Егорыч: Ну, ты бросил всю школу на произвол судьбы своим уходом.",
		"И всё из-за одного человека.|---|REACT frustration",
		"Тёмыч: Ааа, ты об этом?",
		"Ну, понимаешь, где есть одна шваль, готовая тебя пырнуть с-под тишка",
		"Там есть и вторая",
		"За ней идёт третья",
		"Четвёртая, пятая, десятая, двухсотая.|W|character_egorich suspects|---|REACT surprise",
		"Каждая из них вредит твоей репутации.",
		"Даже сейчас есть люди, которые думают, что я тогда два года назад украл три тыщи с чем-то грывень.",
		"Благо, моя ситуация не настолько плачевная, насколько могла бы быть.",
		"Егорыч: Но всё же, за всё то время, что ты адвокатил, это единственный случай, не так ли?|W|character_egorich suspects",
		"Тёмыч: Допустим, и? Даже если и так, то только за мной выбор - защищать людей в суде или позволить им попасться в ложные обвинения",
		"Егорыч: Но как же Соня? Вера Юрьевна сказала, что она готовилась стать прокурором и встать против тебя.|W|character_egorich thinks|---|REACT surprise",
		"Тёмыч: Она просто сказала, что Соня станет прокурором в школьном суде. Не более.|---|REACT frustration",
		"(Ну и даже если и так, то мы всё равно часто проводим время вместе. Своей компанией я её не обделяю, хоть мы и не видимся на этих школьных заседаниях.)|B",
		"Егорыч: Как знаешь.",
		"MAIN",
		"Егорыч: Тебя признали невиновным два года назад, но у тебя до сих пор бывают проблемы с остальными?|W|character_egorich thinks",
		"Тёмыч: Ну, благоразумных людей достаточно, чтобы спокойно жить|W|---|---|REACT frustration",
		"Хотя в столовку мне путь закрыт, как и на ярмарку.",
		"Егорыч: Мне жаль, что я не смог самолично довести дело до конца.|W|character_egorich damage",
		"Тёмыч: Я думаю, что даже я бы не смог.",
		"Самое главное, что мои друзья от меня не отвернулись и что я смог не стать изгоем.",
		"(Да, определенные последствия я испытываю на своей затасканной шкуре)|B",
		"(Но чертям позорным будет недостаточно лишь этого, чтобы выжить меня.)",
		"MAIN",
		"Тёмыч: Зырь, Егорыч, ремещокьна моем значке теперь круче!|W|charqcter_egotich suspects",
		"Егорыч: На мне этот трюк не работает.",
		"Тёмыч: (Чертила...)|B|character_egorich laugh",
		"Егорыч: Оказывается, это не обозначение статуса школьного адвоката.|W|character_egorich thinks",
		"Тёмыч: Кто бы мог подумать... Но я думаю, что за свою карьеру я успел придать этой картонке больше смысла всё-равно.",
		"MAIN",
		"Тёмыч: Это солнце меня бесит!|---|REACT damage", # солнце, 116
		"Егорыч: Понимаю...|W|character_egorich damage",
		"Тёмыч: Что ты понимаешь? Ты стоишь к нему спиной, черт позорный!|W|character_egorich all_of_sudden",
		"Егорыч: Это не мешает мне 'понимать'|W|character_egorich objection|START egorich_objection|REACT intro_woosh",
		"Тёмыч: (Тьоха использует PSI Блютуз Глушитель Ψ!)|B|character_egorich default|START peaceful_spring",
		"MAIN",
		"Егорыч: Я слышал, оттуда сбросилась девочка из нашей школы!|W|character_egorich all_of_sudden|---|REACT damage",
		"Тёмыч: (Одна из жертв 'Тайного дела', произошедшего где-то 3 года назад.)|B",
		"(Кто-то изнасиловал четырех школьниц в одном из кабинетов школы. Этот и пара других кабинетов сейчас замурованы.)",
		"(Каждая из жертв потерпела серьезные последствия в виде психических расстройств. Одна из них потеряла память, другая попыталась самоубиться...)",
		"Я слышал, её завалила Титанаванна.|W|character_egorich all_of_sudden|---|REACT surprise",
		"Егорыч: Матан опасен для здоровья...|W|character_egorich thinks|---|REACT frustration",
		"Тёмыч: Как бы то ни было, наших и людей из других школ регулярно сбивают рядом с местным АТБ и кольцевой развязкой.",
		"Меня это не удивляет",
		"Егорыч: И это - самое страшное.",
		"MAIN",
		"Тёмыч: Дурка.|W|character_egorich default",
		"Егорыч: Разве?|W|character_egorich suspects|---|REACT surprise",
		"Тёмыч: А что тогда?",
		"Егорыч: Обычный жилой дом.",
		"Тёмыч: Дурка.",
		"Егорыч: ...???",
		"MAIN",
		"Егорыч: Минимаркет 'Физмат'.|W|character_egorich thinks",
		"Сюда бегают наши на большой перемене, так как в АТБ ошиваются завучки.",
		"Тёмыч: Вот прикольно будет, если туда зайдёт условная Мариванна.|W|character_egorich laugh",
		"MAIN",
		"Тёмыч: За этими деревьями ничего не видно. Странно.|W|character_egorich thinks",
		"Егорыч: Действительно, за этими деревьями не видно абсолютно ничего. Самая плотная растительная стена, которую я когда-либо видел.",
		"Тёмыч: Нет, я к тому, что сегодня утром тут не было абсолютно ничего. Эта стена появилась из ниоткуда!|W|character_egorich all_of_sudden|---|REACT surprise",
		"MAIN",
		"29 апреля. 13:07. Ларёк 'Физмат' рядом с Лицеем 99.|G",
		"Егорыч: Спустя столько времени, ты таки нашел выход из школы!|W|character_egorich yee|START egor_theme",
		"Тёмыч: Теперь можно и по домам. Мы итак в школе задержались, как будто бы никакой сокращенки у нас не было...",
		"Егорыч: Угу. Ну, ладно, я найду автобус и поеду в цимет.",
		"Тёмыч: Удачи.",
		"???: СТОЯТЬ!|R|character_egorich all_of_sudden|STOP all|REACT surprise",
		"???: Старший следователь по существенным делам школьного коммитета защиты прав и дипломатии, Владислав Иванович|W|character_paltos whatever|START paltos_theme",
		"Тёмыч: Ну ё-маё, ну ё-маё...",
		"Тебя тут не хватало, Ирод Окаянный!",
		"Аполлонов: Мне тоже не очень приятно видеть тебя, Зина.",
		"Но тем не менее.",
		"Тёмыч: И че ты тут забыл, черт позорный?",
		"Аполлонов: Новых обзывачек ты так и не выучил...|W|character_paltos kek|---|REACT surprise",
		"Тёмыч: Взаимно.|W|character_paltos suspects",
		"Аполлонов: Я вообще не за тобой пришел, можешь уходить.",
		"Тёмыч: Чего еще прикажешь, о великий Палтос?",
		"(Управляющий, как обычно. Ему и до 'самого' старшего следователя недалеко, и до старосты)|B",
		"(Но выполнять чьи-то приказы лично я не стану)",
		"(Тем более, если это Палтос.)",
		"Аполлонов: Ну, если хочешь видеть, как я вяжу твоего друга, то пожалуйста, наблюдай.|W|character_paltos kek|STOP all|REACT surprise",
		"Егорыч: Чего?|W|character_egorich all_of_sudden",
		"Тёмыч: (Палтос - каратист. Егорыч, конечно, свергнул террористов вместе со мной и другими в Днепре,)|B|character_egorich thinks|START suspense",
		"(но Палтосу ничего не помешает кинуть с прогиба бедного Егогорыча. Надо что-то делать!)",
		"Что это значит, мой старый-добрый-злобный 'друг'?|W|character_paltos suspects|---|REACT surprise",
		"Аполлонов: Я не должен перед тобой отчитываться.",
		"Могу сказать только, что Ищенко Егор обвиняется в совершении преступления.",
		"Преступление небольшое, школьного масштаба, так что мы сами справимся даже без полиций.",
		"Тёмыч: Какое преступление?",
		"Аполлонов: Ну...|W|character_paltos default",
		"Ты ж не адвокат, Зина-Корзина.|R|character_paltos kek|---|REACT surprise",
		"Тёмыч: (Ух!)|B",
		"(Палтос прав, я отказался от судебных дел два года назад...)",
		"(Но право на адвокатскую деятельность в школьном суде имеет любой!)",
		"(Я верю Егорычу и В Егорыча! Он никогда не сделает со мной того, что сделали бы другие.)",
		"(И никто не может угрожать страйкбольщику Красного Глаза - контр-террористической группировки Днепропетровска из Запорожья!)",
		"Тёмыч: Охрана, отмена!|W|character_egorich all_of_sudden|STOP all|REACT intro_woosh",
		"Аполлонов: В смысле?|W|character_paltos suspects",
		"Тёмыч: Ты расскажешь мне, в чем обвиняется мой поручитель!|W|character_egorich yee|---|REACT surprise",
		"Аполлонов: Это прикол какой-то? В смысле 'поручитель', ты же не адвокат.|W|character_paltos kek",
		"Тёмыч: Серьезно?",
		"ПРОТЕСТУЮ!|W|character_paltos suspects|START objection_theme|REACT obj_rus",
		"Я не знаю, что ты там себе выдумал, но прав ты только на 99%.",
		"Я действительно не защищаю никого, но это не значит, что я не буду защищать своего лучшего друга и помощника!",
		"Мы прошли через многое, так что каким бы не было это преступление, ты расскажешь!",
		"Аполлонов: Переобулся, а?|W|character_paltos suspects",
		"Тёмыч: Ты не знаешь, в каких я башмаках ходил эти два года и как я в них попал.",
		"Так что твоё обвинение в лицемерии я со спокойной душёй *отклоняю.*",
		"Аполлонов: Хмф.",
		"Это дело будет невозможным для тебя, лошара.|W|character_paltos kek",
		"Тёмыч: Мне не привыкать. Рассказывай давай.",
		"Аполлонов: Ира Жарова, ученица 9-А класса, написала на Ищенко жалобу.|W|character_paltos default|START logic",
		"Тёмыч: Что? Серьезно?|W|---|---|REACT surprise",
		"Егорыч: Нет, этого не может быть.|W|character_egorich thinks",
		"Аполлонов: Чего?|W|character_paltos default",
		"Сейчас, Ира Жарова беременна на первом месяце.",
		"Она утверждает, что отец - Егор Ищенко.",
		"Тёмыч: ...|W|character_egorich all_of_sudden|STOP all",
		"Егорыч: ...",
		"Тёмыч: ...",
		"Егорыч: ...",
		"Тёмыч: ...",
		"Егорыч: ...",
		"Тёмыч: Кх",
		"Кхх... кхх...",
		"...",
		"ХААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААА|W|charqacter_egorich laugh|---|REACT sith_slam",
		"ЕГОРЫЧ?|W|character_paltos suspects",
		"С НЕЙ?!",
		"Какая-то ОНА с ЕГОГОРЫЧЕМ?",
		"ХА ХА ХА ХА ХА ХА ХА ХА ХААААААААААААААИИИИИИИИИИИИИИИИАААААААААААААААААААА",
		"Не, Палтос, это не смешно.",
		"Я бы понял, если бы Егорыч кастанул онгаку",
		"Или шмальнул бы по Титанаванне с настоящего глока",
		"Или взорвал бы школу",
		"Но спасть с драными тряпками вроде Жаровой?",
		"Егорыч: Она не в моём вкусе даже...|W|character_egorich rage",
		"Волосы, лицо, не то всё!",
		"К тому же, у меня есть кое-кто на примете",
		"А, знаешь ли, заниматься сексом с кем-то, кто не твой краш, тяжеловато...",
		"Тёмыч: Ну и объективено, для кого-то вроде Жаренной кто-то вроде Егорыча|W|character_paltos suspects",
		"Кто-то умный и воистинну сильный - телом и духом...",
		"Ей нравятся смазливые дрыщи с ипхоном",
		"И чтобы по ночам в клубах её развлекал.",
		"А Егорыч максимум нашей лодкой развлечь может",
		"Аполлонов: Мне пофиг, что у вас там за катера, у меня задание доставить подозреваемого в учительскую.|W|character_paltos whatever",
		"И пока только одного. Тебя потом позовут.",
		"Тёмыч (Внегласное правило школы - адвоката выбирают во время следствия.)|B",
		"Хорошо, так тому и быть. Егорыч, встретимся позже.|W|character_egorich damage|---|REACT damage",
		"Егорыч: Я позвоню.",
		"...|W|character_egorich HIDE|STOP all",
		"Тёмыч: (Адвокат Тьоха Тьохич: приступаю к работе!)|B|---|START investigation_op",
		"MAIN",
	]
	if loc_file.get_value("Locations","res://scenes/case_4/invest_4/aappendix_day1.tscn","") == "1" and loc_file.get_value("Locations","res://scenes/case_4/invest_4/ametod_day1.tscn","") == "1":
		if loc_file.get_value("Special","Fizmat_reached_stage_2","") == "1":
			goto_when_was = 237
		else:
			goto_when_was = 147
		print("Stage 2 of this scene")
		loc_file.set_value("Special","Fizmat_reached_stage_2","1")
		loc_file.save("C:/Games/ddkg2.save")
		$POIs.free()
		Chats = [
			"",
			"",
			"",
			"",
		]
	else:
		goto_when_was = 51
		print("Stage 1 of this scene")
		print("Chats")
	Moves = [
		"Методкабинет;res://scenes/case_4/invest_4/ametod_day1.tscn",
		"",
		"",
		"",
	]
	Chats = [
		"Ира Жарова;54",
		"Мореплаватель;65",
		"Адвокатство;78",
		"",
	]
	if $investigation_screen/ArcBG/Label.text[-1] == "B":
		Dialogue[93] = "И даже тот суд не всех переубедил."
		Dialogue[99] = "(Единственная, кто всерьез воспринимает мою невиновность в той краже.)|B"
		print("Swapping dialogue line for arc B")
		Chats[3] = "3-й кейс;101"
	Shows = [
		"badge 110",
	]
	check_for_read_chats = false
	read_chats = [false,false,false,false]
	print($investigation_screen/ArcBG/Label.text[-1])
	
