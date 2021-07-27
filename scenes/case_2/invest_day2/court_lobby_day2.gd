extends Node2D
var Anims
var Dialogue
var Ev
var Music
var loc_file = ConfigFile.new()
func _ready():
	Dialogue = [ # диалоги. 
		"",
		"5 октября. 23:30. Подвал G",
		"Тёмыч: Нет, ну а на самом деле W",
		"Учитывая, в каком положении мы оказались",
		"Хорошо, что мы добились как минимум отложения",
		"Потому что, объективно, нам грозил именно гилти",
		"Егорыч: Угу...",
		"Это было опасно.",
		"Тёмыч: ...СТОЯЯЯЯЯЯЯЯЯЯЯЯЯТЬ",
		"Егорыч: А, в смысле?",
		"Маша: Ой...",
		"Тёмыч: Гоп-стоп!",
		"Ты много на себя взялааа~",
		"Расскажешь, почему?",
		"Маша: Ну, просто...",
		"Тём, прости.",
		"Тёмыч: Мне твои извенения - до самісінької...",
		"...Не хочу тебя расстраивать, но я добьюсь оправдательного приговора",
		"Хочешь ли ты того, или нет",
		"Я не адвокат, на меня адвокатская этика не распространяется",
		"У меня принцип - если я считаю клиента невиновным, то он - невиновен.",
		"Так что, ты обратилась не к тому... 'защитнику'",
		"Маша: ...Понятно.",
		"Но я все равно виновная. Будет тебе проигрыш этой мелкой немой сучке, все с тебя ржать будут",
		"Тёмыч: Будешь ты в тюрьме сидеть, если так оно всё выйдет",
		"Вот тебе по жизни повезет...",
		"Маша: Ах! ...",
		"...Я пошла",
		"Тёмыч: ...Ладно, Егогорыч, я еще сделаю крюк в столовку",
		"Егорыч: Тю ты, Тьоха, она же закрыта уже сколько!",
		"Тёмыч: Ну что же,",
		"Приступаем к Tactical Espionage Action",
		"Егорыч: Да, коробку там не забудь.",
		"Тёмыч: (А по факту, я просто хочу кое-что проверить.) B",
		"(В частности, форму этого здания)",
		"(Уж больно это мне напоминает нашу школу...)",
		"6 октября. 00:00. Парк G",
		"Тёмыч: ... W",
		"...",
		"...",
		"Эх, рельсы-поезда, как я попал сюда?",
		"Ну да, я просто хотел погулять по зданию.",
		"И где я оказался?",
		"Из всех мест в этом отеле - именно здесь?",
		"И из всех постояльцев этого отеля",
		"Здесь оказался именно я.",
		"Соня: Не только. Y",
		"Тёмыч: А, привет... W",
		"Что ты здесь делаешь?",
		"Соня: На месте преступления осталась еще одна улика. Y",
		"...Точнее, я думала, что там осталась еще одна улика.",
		"Ну... там её не оказалось...",
		"Ну в общем...",
		"...",
		"Тёмыч: Ясно. W",
		"Ладно, я пошел искать свой номер. Он в шестом блоке где-то",
		"Соня: У меня в пятом. Я с тобой. Y",
		"Тёмыч: ...Мне все рассказывали, что ты закрытая, скованная, загадошная и вся такая. W",
		"(Стоп, слово 'загадошная' прозвучало как-то неправильно) B",
		"(...Но никто этого не заметил, так что я упущу этот небольшой факт.)",
		"Но ты, вроде как, нормальная W",
		"Соня: Не знаю... Y",
		"Тёмыч: Ты всегда была такой? W",
		"Соня: ...Нет. Y",
		"Тёмыч: А что случилось? W",
		"...Если не секрет, конечно...",
		"Соня: ...",
		"Тёмыч: А чем я тебя к себе расположил?",
		"Со мной ты разговариваешь активнее всего",
		"Соня: ...",
		"Тёмыч: ...Ну да, конечно.",
		"6 октября. 0:10. Четвертый блок",
		"Соня: Мне налево. Y",
		"Планировка этого здания очень странная.",
		"Тёмыч: Лично мне кажется, что планировка у этого здания W",
		"КОООООООООООООООООНЧЕНАЯ ПРОООООООООООООСТО",
		"Соня: ...",
		"У нашей школы такая же, не заметил? Y",
		"Тёмыч: Я думал, что мне кажется. W",
		"Соня: ...",
		"Странно. Y",
		"Разве мы не должны быть отдаленными?",
		"Тёмыч: В смысле? W",
		"Соня: ...",
		"Ты - защищаешь людей, которых я - обвиняю. Y",
		"Тёмыч: Действительно. W",
		"Двенадцать шагов назад.",
		"Соня: ...",
		"Тёмыч: Шучу.",
		"Соня: Ты - говоришь, я - нет. Y",
		"Тёмыч: Ты, кстати, так и не сказала, почему ты молчишь. W",
		"Технически, если ты представляешь, как ты говоришь, у себя в голове",
		"То ты когда-то разговаривала?",
		"Что это? Травма? Надоело?",
		"Соня: ...",
		"Ты располагаешь к себе людей. Я - отталкиваю их. Y",
		"Тёмыч: Отнюдь, ты меня к себе расположила достаточно, чтобы сказать 'шучу' после просьбы сделать 12 шагов назад. W",
		"Так что...",
		"Не, ты всё-таки утрируешь. Не такие мы и разные, чтобы быть 'отдаленными'",
		"Соня: ...",
		"Тёмыч: ...Шучу, 12 шагов назад, сичаш-же!",
		"Соня: ...",
		"Не нужно так часто использовать слово 'шучу' Y",
		"Если я молчу,",
		"То ты своими словами... путаешь людей",
		"Тёмыч: Действительно... W",
		"Ладно, я пойду, всё-таки.",
		"Соня: ...",
		"6 октября. 0:50. Пятый блок. G",
		"Тёмыч: (Мы там простояли почти полчаса?) B",
		"(Та нет, даже больше!)",
		"(Надо поторопиться)",
		"???: СУКА!",
		"??? 2: Не ори, лишние уши нам не нужны...",
		"Тёмыч: (Извините пожалуйста, какого хрена?) B",
		"(Стоп, это ведь... Так, а сичас Тьоха будет играть в журналистов)",
		"(Де там мой диктофон?)",
		"Дашкерин: Я же вчера ходил по всем знакомым W",
		"Спрашивал, кто знает про этих баб ёб*ных",
		"ДЕ ТЫ БЫЛ?!?!",
		"Радомир: Если бы ты реально хотел заткнуть всех свидетелей, то ты бы меня нашел",
		"Мы сегодня, кхм, тоесть вчера, виделись кучу раз",
		"Или ты не заметил?",
		"Дашкерин: Завали еб*ло, бл*ть.",
		"Короче.",
		"Твои показания мне сильно навредили",
		"Я хочу чтобы этого х*я в плаще принимали за дебила",
		"Он там что-то п*здел про то, что я где-то был...",
		"А ты скажешь, что ты видел меня среди моих братанов",
		"Которые шли по парку в то время",
		"Среди которых ты меня типа не заметил",
		"Радомир: Но я ведь уже сказал, что тебя там не было",
		"Дашкерин: ПОХ*Й АБСОЛЮЮЮЮЮЮЮЮТНО!",
		"Тёмыч: (...Это кофта, Ирод Окаянный) B",
		"Дашкерин: Три косаря. Больше не дам W",
		"Радомир: Сколько??? Три?!",
		"Откуда у тебя три тысячи гривень? Ё-маё, мужик...",
		"Ладно, хорошо.",
		"Надеюсь, что не спалят.",
		"Тёмыч: (Не спалят, обіцяю.) B",
		"Радомир: Ладно, завтра прийду в суд... W",
		"Тёмыч: (А сичас, мне надо свааааааааааливать) B",
		"Дашкерин: А, и да, пацан,",
		"Сейчас, ты пойдешь к себе",
		"И скажешь, что был в толкане.",
		"Или что-то такое скажешь",
		"Но меня ты не видел и не слышал...",
		"Тёмыч: (Снято...) B",
		"(Кто куда, а я - по съе...)",
		"(...пам парарам парарам парарам рам рам)",
		"(Цензурю мысли, как могу.)",
		"6 октября. 0:10. Номер 222с G",
		"Егорыч: (Где этого черта носит?) B",
		"Телефон: Абонент зараз розмовляє або відхилив ваш дзвінок G",
		"Егорыч: ...Ну и, видимо, дозвониться до него все еще не выходит",
		"",
	]
	loc_file.load("C:/Games/ddkg2.save")
	loc_file.set_value("Locations","Last",filename)
	loc_file.save("C:/Games/ddkg2.save")
	