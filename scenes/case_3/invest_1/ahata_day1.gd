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
		"6 октября. 12:50. 'Пузатий пан' 1-й этаж.|G",
		"Жека: Я подсяду?|W|character_zheka default|START panhata_bgm|---",
		"Тёмыч: Триста лет, триста зим, Жека.|W|character_temich default|---|---",
		"Егорыч: Вы видитесь каждый день, так что твоё это 'триста лет' неуместно.|W|---|---|---",
		"Тёмыч: Как скажешь.|W|character_temich comeon|---|REACT frustration",
		"Жека: Быстро доехали, но на завтрак времени вообще не дали.|W|character_zheka bombit|---|---",
		"Тёмыч: Лично я в поезде успел захавать пачку чипсов, но это не то...|W|character_temich wonder|---|---",
		"Егорыч: (А еще конфеток, литр кваса, полкабана и лютефиск)|B",
		"???: Пацаны, я к вам.|W|character_temich HIDE|---|---",
		"Тёмыч: Ты ба, кто пришел - Тувок!|W|character_temich kekk|---|REACT surprise",
		"Радомир: 'Тувок'?|W|character_tuvok default|---|---",
		"Жека: А кто это?|W|character_zheka default|---|---",
		"Егорыч: Это свид--|W",
		"Тёмыч: Шпион Башима.|W|character_temich yee|---|REACT frustration",
		"Радомир: Я же сказал, что у меня не было выбора...|W|character_tuvok rage|---|---",
		"Тёмыч: И тем не менее, ты же понимаешь, что под нож чуть не попал человек, ни на кого не покушавшийся?|W|character_temich dadada|---|---",
		"Радомир: Не такая Маша Фильмонова добрая-хорошая, как ты думаешь!|W|character_tuvok rage|---|---",
		"Тёмыч: Как бы то ни было, Башим Дашкерин достаточно внушительный персонаж, чтобы его бояться. Я никого не о(б)суждаю здесь.|W|character_temich default|---|---",
		"Егорыч: Давайте мы просто закажем че-нить уже и за столом обсудим дела насущные.|W|character_tuvok default|---|---",
		"Тёмыч: Как скажешь, господин посредник", # 20
		"MAIN", # 21
		"Егорыч: Тьоха, возьми сотку, возьми мне котлетки с пюрешкой и хлеб.|W|character_temich comeon|---|---", # Обед, 22
		"Тёмыч: Беленький?|R|character_temich kekk|---|REACT surprise",
		"Егорыч: Да, можно беленький.|W|---|---|---",
		"Тёмыч: ... .|W|character_temich comeon|---|REACT slam",
		"Жека: Мне пожалуйста...|W|character_zheka default|---|---",
		"Макарошки какие-нибудь, котлету по-киевски еще давай.|W|character_zheka yee|---|---",
		"Радомир: Я дошик съел в поезде, мне лучше че-нить выпить.|W|character_tuvok hmm|---|---",
		"Егорыч: Да, в 'пузатом пане' еще, как мне известно, лимонада литр наливают в графин.|W|---|---|---",
		"Давайте вместе на литр лимонада скинемся по десятке|W|---|---|---",
		"Тёмыч: Скидывайтесь мне.|W|character_temich kekk|---|REACT surprise",
		"Егорыч: ('Скидывайтесь мне' значит, что сдача пойдет ему в карман. Эта же фраза также значит, что я не имею права раскрывать его план, иначе он призовёт Боцыка.)|B",
		"(Не дай бог он снова призовёт Боцыка...)|B|character_temich dadada|---|REACT frustration",
		"Тёмыч: Я пiшов.|W|character_temich default|---|---",
		"Егорыч: Эй, Тувок.|W|character_tuvok default|---|---",
		"Ой, то есть, Радомир|W|---|REACT damage",
		"Радомир: М?|W|character_tuvok hmm|---|REACT surprise",
		"Егорыч: А что ты знаешь про деле о школьницах?|W",
		"Радомир: Я не тот человек, с которым можно обсуждать школьниц.|W|character_tuvok surprise|---|---",
		"Да и можно ли вообще с кем-то обсуждать школьниц?|W",
		"Егорыч: Ты знаешь, о чём я говорю.|W",
		"Радомир: Нет, не знаю.|W",
		"Егорыч: Нет, знаешь.|W",
		"Радомир: ...|W|character_tuvok bored|STOP ALL|---",
		"...|W",
		"...|W",
		"И ты не будешь знать, если будешь прилюдно это обсуждать.|W|character_tuvok rage|---|REACT frustration",
		"Я не знаю, кто ты такой, что не знаешь Башима Дашкерина, но если он узнает, что ты знаешь, что мы знаем|W",
		"Никто больше ничего не будет знать.|W",
		"Можем встретиться позже за подробностями, у нас будет экскурсия в музее.|W",
		"Там я и расскажу, что знаю.|W",
		"Жека: ...О чем вы говорите?|W|character_zheka bombit|---|REACT surprise",
		"Тёмыч: Я хз, о чём вы говорите, но держите вашу жратву и жрите. Картошки не было, жри макароны.|W|character_temich default|---|---",
		"Егорыч: О, смотрите, это араб?|W|character_tuvok surprise|---|---",
		"???: ...|W|character_halal default|---|REACT frustration",
		"Тёмыч: Мигрантов во Львове больше, чем украинцев|W|character_temich wonder|---|---",
		"???: ...Чи вам смакуе?|R|character_halal default|---|---",
		"Егорыч: Эээ, да, вроде...|W|---|---|---",
		"???: ...|W",
		"???: ...|W|character_halal HIDE|---|---",
		"Тёмыч: ...Кто это был?|W|character_temich comeon|---|REACT surprise",
		"Радомир: Арабы на украинском с таким акцентом не разговаривают.|W|character_tuvok default|---|---",
		"Жека: Хиджаб - не признак национальности, а признак религии.|W|character_zheka idea|---|---",
		"Тёмыч: Да, кстати, может это просто кто-то из наших прикалывается и простыню с поезда на себя накинул.|W|character_temich kekk|---|REACT frustration",
		"Радомир: ...Странно. У меня какое-то странное ощущение появилось.|W|character_tuvok hmm|---|REACT surprise",
		"Егорыч: Неудобство?|W",
		"Тёмыч: То же самое.|W|character_temich wonder|---|---",
		"Жека: ...Меня как будто трогали|W|character_zheka bombit|---|---",
		"Егорыч: А, ну только что дверь открыта была, вот и ветер подул.|W|character_zheka default|---|---",
		"Тёмыч: Разве что.",
		"MAIN",
		"Жека: Сегодня я играл на гитаре в соседнем вагоне.|W|character_zheka iii|---|---", # 72, Поездка
		"Однако один из пацанов, которого я постоянно вырубал, потому что один из аккордов попадал в его резонанс, остался целым.|W|character_zheka bombit|---|---",
		"Тёмыч: Лёныч тоже жалуется, что онгаку перестало работать.|W|character_temich kekk|---|---",
		"И у меня тоже.|W|character_temich wonder|---|---",
		"Егорыч: Онгаку больше не работает?|W|character_zheka sad|---|---",
		"Радомир: 'Онгаку'?|W|character_tuvok surprise|---|REACT surprise",
		"Тёмыч: Онгаку само по себе является видом магии, Жека.|W|character_temich default|---|---",
		"Вероятно, в мире появилось что-то, что нарушает баланс в магии: поглощает её, или рассеивает.|W|character_temich wonder|---|---",
		"Егорыч: Либо у вас на всю жизнь был фиксированный запас маны и вы её исчерпали.|W",
		"Тёмыч: Но у нас это пропало одновременно, хотя ты с Жекой присоединились к нам посреди нашего пути к базе Меридиана|W|character_temich kekk|---|---",
		"Если у меня с Лёнычем исчерпалась мана, то у Жеки должно еще остаться что-то.|W",
		"Радомир: 'Магия'? 'Меридиан'?|W|character_tuvok surprise|---|REACT surprise",
		"Тёмыч: И это у нас началось еще когда Меридиан хитростью занёс нас в Киев.|W|character_temich default|---|---",
		"Прикинь, каково в Киеве отбиваться от гопарей, когда у тебя нет онгаку. Аккорды работали из последних сил, последний наш день мы просто избегали подворотни.|W|character_temich comeon|---|---",
		"Жека: Что, если Меридиан создал что-то, что мешает нам применять магию?|W|character_zheka idea|---|REACT surprise",
		"Радомир: Что вы, черт побери, такое несёте?|W|character_tuvok bored|---|REACT frustration",
		"MAIN",
		"Егорыч: Радомир, расскажи нам о Фильмоновых?|W|character_tuvok default|---|---", # 89, Маша и Женя
		"Тёмыч: А что ты можешь рассказать, лучше, скажи.|W|character_temich wonder|---|---",
		"Вчера на суде ты произвел впечатление человека совершенно незнающего подсудимую.|W|character_temich kekk|---|---",
		"Радомир: Просто, если Мария Фильмонова, это подозреваемая|B|character_temich HIDE|---|---",
		"И вот эта тёмненькая девочка|B|---|---|---",
		"Тёмыч: И вообще достаточно ты подобных цитаток накидал...|W|character_temich kekk|---|---",
		"Радомир: Ну... Про них вообще-то слухи ходят.|W|character_tuvok bored|---|---",
		"Егорыч: (Почему все школьные слухи проходят мимо нас...?)|B",
		"Радомир: Вы же знаете, что у неё семья бедная и абьюзивная?|W|character_tuvok default|---|---",
		"Тёмыч: Наслышаны.|W|character_temich wonder|---|---",
		"Радомир: Только сегодня в поезде всплыл один... эпизод из её жизни.|W|character_tuvok bored|---|---",
		"В шестом классе, она обвинила одного мальчика в изнасиловании подруги.|W|character_tuvok surprise|---|REACT damage",
		"Тёмыч: Только сегодня с Егорычем обсуждали подобное... правонарушение.|W|character_temich default|---|---",
		"Радомир: После этого, у неё появился четвертый айфон, а тогда же он был вроде как очень популярным, или крутым.|W|character_tuvok rage|---|---",
		"А еще в прошлом году я слышал, как она однажды подставила одноклассника.|W|character_tuvok surprise|---|---",
		"Она обокрала пару человек и подкинула награбленное своей жертве.|W|character_tuvok rage|---|---",
		"Человек кое-как оправдался, но её в этом обвинить никто не смог, потому что не было док-в.|W|character_tuvok default|---|---",
		"Но я подробностей вообще не знаю, да и в тот момент я её в лицо ж не знал.|W|character_tuvok hmm|---|---",
		"Но ты, Зинец, точно не на ту сторону встал.|W|character_tuvok rage|---|REACT surprise",
		"Может, она и была тогда виновной? Может, это опять таки был какой-то сговор...|W|character_tuvok hmm|---|---",
		"Тёмыч: Сто процентов, так и есть. Но на момент суда, Башим Дашкерин признал свою вину... в своём стиле.|W|character_temich wonder|---|---",
		"Радомир: ...Как скажете, пацаны...|W|character_tuvok hmm|---|---",
		"MAIN",
		"Жека: О, Егорыч, ты тоже сдал адвокатом?|W|character_zheka iii|---|---", # 112, значок
		"Егорыч: Это же обычный значок дежурного...|W|---|---|---",
		"Жека: Э, не, это не просто значок дежурного...|W|character_zheka default|---|---",
		"Не в нашем классе так точно!|W",
		"Егорыч: (Сомневаюсь, что значок дежурного означает что-то существенное в случае с кем-то кроме Тьохи...)|B",
		"MAIN",
		"Егорыч: Значит, если нас четверо, а в графине литр лимонада|W|character_temich default|---|---",
		"Тёмыч: И если мы выпили по стакану и лимонада не осталось",
		"Егорыч: То объём стакана - 250 мл.|W|character_temich kekk|---|---",
		"Радомир: Как всё удобно вышло...|W|character_tuvok yee|---|---",
		"Егорыч: (Непривычно видеть перманентно депрессивного человека улыбающимся.)|B|---|---|---",
		"~~~ Графин добавлен в записи суда.|B|character_tuvok HIDE|---|---|2|grafin;Графин;Вмещает детто литр лимонада, вместе с ним дали 4 стакана по 250 миллилитров.;Лимонад имел отчетливый, кислый вкус лимона. Его пили Я, Тёмыч, Тувок и Жека, каждый по стакану. На дне ничего не осталось.;1", # 123
		"OUT res://scenes/case_3/invest_1/amuseum_day1.tscn",
		"Радомир: Что это?|W|character_tuvok default|---|---",
		"Егорыч: ...Ничего.|W",
		"MAIN",
		"Егорыч: (Люди одеты в вышиванки... зачем-то.)|B|character_temich default|---|---", # Торгаши, 128
		"MAIN",
		"Егорыч: Дизайн ножек этого стола мне нравится.|W|character_temich default|---|---", # стол, 130
		"Тёмыч: Да, это всё клево, но я сижу в углу и мне они впиваются в ноги.|W|character_temich wonder|---|---",
		"Так что они не самые удобные",
		"Егорыч: Но стол же квадратный, а нас четыре. Зачем в углу тесниться, сядь как обычно.",
		"Тёмыч: Мне мешают|W|character_temich kekk|---|---",
		"Егорыч: Кто?",
		"Тёмыч: ...Волей сценариста, ты не получишь ответа на этот вопрос!|W|character_temich dadada|---|---",
		"MAIN",
		"",
	]
	#$investigation_screen.Cur = 119
	Chats = [
		"Обед;21",
		"Поездка;71",
		"Маша и Женя;88",
		"",
	]
	Moves = [
		"",
		"",
		"",
		"",
	]
	Shows = [
		"badge 111",
	]
	NoShow = 141-17
	check_for_read_chats = true
	goto_when_read = 134-17
	read_chats = [false,false,false,true]
