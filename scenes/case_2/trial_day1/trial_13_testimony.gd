extends Node2D
var Anims
var Dialogue
var Ev
var Music
var loc_file = ConfigFile.new()
var Cast
func _ready():
	Dialogue = [
		"",
		"--- Мне все равно, посадят ли её --- R",
		"Дашкерин: Слушайте, мне то какое дело до того, посадят ли ее, или оставят в покое? W",
		"Вы так это выставили, как будто бы это я Иру зарезал, а теперь подставляю Машку.",
		"Но я это крикнул, потому что... Не знаю, короче, почему, да... Просто так!",
		"Если вы хотите меня в чем-то обвинить, то предъявите мотив и доказательства.",
		"Тёмыч: А почему ты сразу подумал, что мы тебя в чем-то обвиняем?",
		"Дашкерин: Эмм, ну...",
		"Тёмыч: Мы просто задали наводящий--",
		"Эмм, кхм-кхм, *обычный* вопрос.",
		"(Пожалуйста Лентольна не снимайте этого вопроса пожааааалуйста) B",
		"А ты сразу это принял, как-то, ммм... W",
		"На личный счет, да...",
		"Дашкерин: ...Короче, я могу уже идти?",
		"Тёмыч: Соня, он может уже идти?",
		"Соня: ...",
		"Дашкерин: Эмм, че она на меня так пялится...",
		"Сышь? Че зыришь?",
		"Отвернулась с-щас же.",
		"Тёмыч: Ну, видимо, ты пока уходить не можешь.",
		"Е. Анатольевна: ...Я тут еще что-то решаю?",
		"Тёмыч: Эм, да, конечно, Ваша Честь, это безоговорочно",
		"Тут даже спрашивать особо не надо",
		"Е. Анатольевна: Пенальти обоим...",
		"Тёмыч: (Ё-маё...) B",
		"Соня: ... W",
		"Дашкерин: Всё? Я могу идти?",
		"Е. Анатольевна: Нет, не можешь",
		"Тёмыч: Хотя...",
		"Е. Анатольевна: Ммм?",
		"Тёмыч: ...У нас на сегодня есть еще свидетели?",
		"Соня: ...",
		"Е. Анатольевна: Да, заявлен еще один",
		"Тёмыч: ...Предлагаю этого",
		"'Подозрительного типа'",
		"*Временно* отпустить",
		"Е. Анатольевна: Ну и ну...",
		"Я уж думала, что начнешь этого свидетеля обвинять во всех смертных грехах",
		"А ты... Ну, ладно. Следующего свидетеля, пожалуйста.",
		"Тёмыч: (Если так подумать, то сейчас мне тяжело пресануть кого-то) B",
		"(У меня просто недостаточно улик, чтобы обвинить кого-то конкретно)",
		"(Надо подождать, послушать всех свидетелей)",
		"(Накопить улик и показаний)",
		"(И только потом перейти в наступление)",
		"В. Юрьевна: На месте, Лен! W",
		"Е. Анатольевна: Запускай.",
		"???: Здравствуйте.",
		"Тёмыч: (Я просканировал будующее третим глазом, сейчас Соня скажет 'Анкета') B",
		"Соня: Фамилия, класс. Y",
		"Соня: ... W",
		"Тёмыч: *вдох*",
		"(А!) B",
		"Радомир: Радомир Тувок W",
		"Тёмыч: Живите долго и процветайте.",
		"Радомир: Спасибо.",
		"Тёмыч: (Гы, он не понял, что я ржу с его фамилии.) B",
		"(Какая же я все-таки чертила...)",
		"Е. Анатольевна: Рассказывай, что ты видел, что ты слышал W",
		"Нас интересует драка Маши Фильмоновой и Иры Жаровой из 8-Г",
		"Радомир: А, это? Ну, слушайте, тогда.",
		"OUT res://scenes/case_2/trial_day1/trial_14_testimony.tscn",
		"",
	]
	Anims = [
		"",
		"character_wit default --- Мне все равно, посадят ли её --- R POS wit",
		"character_wit wtf START examination-allegro Дашкерин: Слушайте, мне то какое дело до того, посадят ли ее, или оставят в покое? W",
		"character_wit ignore Вы так это выставили, как будто бы это я Иру зарезал, а теперь подставляю Машку.",
		"character_wit uh Но я это крикнул, потому что... Не знаю, короче, почему, да... Просто так!",
		"character_wit wtf Если вы хотите меня в чем-то обвинить, то предъявите мотив и доказательства.",
		"character_temich thonker STOP Тёмыч: А почему ты сразу подумал, что мы тебя в чем-то обвиняем? POS def",
		"character_wit uh Дашкерин: Эмм, ну... POS wit",
		"character_temich thonker START pursuit_slow Тёмыч: Мы просто задали наводящий-- POS def",
		"character_temich wonder Эмм, кхм-кхм, *обычный* вопрос.",
		"character_temich comeon (Пожалуйста Лентольна не снимайте этого вопроса пожааааалуйста) B",
		"character_temich kekk А ты сразу это принял, как-то, ммм... W",
		"character_temich yee REACT surprise На личный счет, да...",
		"character_wit ignore Дашкерин: ...Короче, я могу уже идти? POS wit",
		"character_temich kekk Тёмыч: Соня, он может уже идти? POS def",
		"character_sonya death REACT slam Соня: ... POS pro",
		"character_wit zomg REACT frustration Дашкерин: Эмм, че она на меня так пялится... POS wit",
		"character_wit uh Сышь? Че зыришь?",
		"character_wit wtf Отвернулась с-щас же.",
		"character_temich paper Тёмыч: Ну, видимо, ты пока уходить не можешь. POS def",
		"character_lentoln sigh REACT surprise Е. Анатольевна: ...Я тут еще что-то решаю? POS jud",
		"character_temich deskslam REACT slam Тёмыч: Эм, да, конечно, Ваша Честь, это безоговорочно POS def",
		"character_temich damn Тут даже спрашивать особо не надо",
		"character_lentoln default Е. Анатольевна: Пенальти обоим... POS jud",
		"character_temich comeon REACT damage Тёмыч: (Ё-маё...) B POS def",
		"character_sonya death REACT damage Соня: ... W POS pro",
		"character_wit uh REACT surprise Дашкерин: Всё? Я могу идти? POS wit",
		"character_lentoln rage REACT frustration Е. Анатольевна: Нет, не можешь POS jud",
		"character_temich comeon Тёмыч: Хотя... POS def",
		"character_lentoln hmm Е. Анатольевна: Ммм? POS jud",
		"character_temich wonder Тёмыч: ...У нас на сегодня есть еще свидетели? POS def",
		"character_sonya phone Соня: ... POS pro",
		"character_lentoln default Е. Анатольевна: Да, заявлен еще один POS jud",
		"character_temich thonker Тёмыч: ...Предлагаю этого POS def",
		"character_temich kekk Тёмыч: ...Предлагаю этого POS def",
		"character_temich thonker Тёмыч: ...Предлагаю этого POS def",
		"character_lentoln hmm Е. Анатольевна: Ну и ну... POS jud",
		"character_lentoln kek Я уж думала, что начнешь этого свидетеля обвинять во всех смертных грехах",
		"character_lentoln sigh REACT frustration А ты... Ну, ладно. Следующего свидетеля, пожалуйста.",
		"character_temich kekk Тёмыч: (Если так подумать, то сейчас мне тяжело пресануть кого-то) B POS def",
		"character_temich paper (У меня просто недостаточно улик, чтобы обвинить кого-то конкретно)",
		"character_temich wonder (Надо подождать, послушать всех свидетелей)",
		"character_temich thonker (Накопить улик и показаний)",
		"character_temich kekk (И только потом перейти в наступление)",
		"character_lentoln hmm В. Юрьевна: На месте, Лен! W POS jud",
		"character_lentoln kek Е. Анатольевна: Запускай.",
		"character_wit2 default ???: Здравствуйте. POS wit",
		"character_temich picard Тёмыч: (Я просканировал будующее третим глазом, сейчас Соня скажет 'Анкета') B POS def",
		"character_sonya order66 Соня: Фамилия, класс. Y POS pro",
		"character_sonya death Соня: ... W",
		"character_temich kekk Тёмыч: *вдох* POS def",
		"character_temich deskslam REACT deskslam (А!) B",
		"character_wit2 default Радомир: Радомир Тувок W POS wit",
		"character_temich wonder Тёмыч: Живите долго и процветайте. POS def",
		"character_wit2 yee1 Радомир: Спасибо. POS wit",
		"character_temich yee Тёмыч: (Гы, он не понял, что я ржу с его фамилии.) B POS def",
		"character_temich thonker (Какая же я все-таки чертила...)",
		"character_lentoln default Е. Анатольевна: Рассказывай, что ты видел, что ты слышал W POS jud",
		"character_lentoln hmm Нас интересует драка Маши Фильмоновой и Иры Жаровой из 8-Г",
		"character_wit2 default Радомир: А, это? Ну, слушайте, тогда. POS wit",
		"OUT ",
		"OUT ",
	]
	Music = [
		"",
		"--- Мне все равно, посадят ли её --- R",
		"START examination-allegro Дашкерин: Слушайте, мне то какое дело до того, посадят ли ее, или оставят в покое? W",
		"Вы так это выставили, как будто бы это я Иру зарезал, а теперь подставляю Машку.",
		"Но я это крикнул, потому что... Не знаю, короче, почему, да... Просто так!",
		"Если вы хотите меня в чем-то обвинить, то предъявите мотив и доказательства.",
		"STOP Тёмыч: А почему ты сразу подумал, что мы тебя в чем-то обвиняем?",
		"Дашкерин: Эмм, ну...",
		"START pursuit_slow Тёмыч: Мы просто задали наводящий--",
		"Эмм, кхм-кхм, *обычный* вопрос.",
		"(Пожалуйста Лентольна не снимайте этого вопроса пожааааалуйста) B",
		"А ты сразу это принял, как-то, ммм... W",
		"REACT surprise На личный счет, да...",
		"Дашкерин: ...Короче, я могу уже идти?",
		"Тёмыч: Соня, он может уже идти?",
		"REACT slam Соня: ...",
		"REACT frustration Дашкерин: Эмм, че она на меня так пялится...",
		"Сышь? Че зыришь?",
		"Отвернулась с-щас же.",
		"Тёмыч: Ну, видимо, ты пока уходить не можешь.",
		"REACT surprise Е. Анатольевна: ...Я тут еще что-то решаю?",
		"REACT slam Тёмыч: Эм, да, конечно, Ваша Честь, это безоговорочно",
		"Тут даже спрашивать особо не надо",
		"Е. Анатольевна: Пенальти обоим...",
		"REACT damage Тёмыч: (Ё-маё...) B",
		"REACT damage Соня: ... W",
		"REACT surprise Дашкерин: Всё? Я могу идти?",
		"REACT frustration Е. Анатольевна: Нет, не можешь",
		"Тёмыч: Хотя...",
		"Е. Анатольевна: Ммм?",
		"Тёмыч: ...У нас на сегодня есть еще свидетели?",
		"Соня: ...",
		"Е. Анатольевна: Да, заявлен еще один",
		"Тёмыч: ...Предлагаю этого",
		"'Подозрительного типа'",
		"*Временно* отпустить",
		"Е. Анатольевна: Ну и ну...",
		"Я уж думала, что начнешь этого свидетеля обвинять во всех смертных грехах",
		"REACT frustration А ты... Ну, ладно. Следующего свидетеля, пожалуйста.",
		"Тёмыч: (Если так подумать, то сейчас мне тяжело пресануть кого-то) B",
		"(У меня просто недостаточно улик, чтобы обвинить кого-то конкретно)",
		"(Надо подождать, послушать всех свидетелей)",
		"(Накопить улик и показаний)",
		"(И только потом перейти в наступление)",
		"STOP В. Юрьевна: На месте, Лен! W",
		"Е. Анатольевна: Запускай.",
		"???: Здравствуйте.",
		"START enterwit Тёмыч: (Я просканировал будующее третим глазом, сейчас Соня скажет 'Анкета') B",
		"Соня: Фамилия, класс. Y",
		"Соня: ... W",
		"Тёмыч: *вдох*",
		"REACT deskslam (А!) B",
		"Радомир: Радомир Тувок W",
		"Тёмыч: Живите долго и процветайте.",
		"Радомир: Спасибо.",
		"Тёмыч: (Гы, он не понял, что я ржу с его фамилии.) B",
		"(Какая же я все-таки чертила...)",
		"Е. Анатольевна: Рассказывай, что ты видел, что ты слышал W",
		"Нас интересует драка Маши Фильмоновой и Иры Жаровой из 8-Г",
		"Радомир: А, это? Ну, слушайте, тогда.",
		"OUT ",
		"OUT ",
	]
	loc_file.load(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
	loc_file.set_value("Locations","Last",filename)
	loc_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")


