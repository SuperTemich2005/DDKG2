extends Node2D
var Dialogue
var BoxColor
var Roles
var correct
var va
func _ready():
	correct = "5 aff res://scenes/case_easter/trial_3.tscn 3"
	va = ""
	BoxColor = Color(0.5,1,0.5,1)
	Roles = [
		"character_egorich pro",
		"character_lentoln jud",
		#"character_temich hld",
		"character_sonya pro",
		"character_wit wit",
		"character_temich def",
	]
	Dialogue = [ # диалоги. оффсет 20
		"Светланфёдрна: Допрашивай.|W|character_swetlan default",
		"--- Как я вёл себя ---|R|character_egorich default|STOP all|REACT intro_woosh",
		"Егорыч: Светлана Фёдоровна отняла у нас перемену и отправила в библиотеку|G2|character_egorich thinks|START2 examination-moderato|---|7",
		"Егорыч: В это время, я разговаривал с Тьохой и Жекой|G2|character_egorich thinks|---|---|18",
		"Егорыч: Когда мы зашли в библиотеку, увлеченный разговором, я не смог вставить своего слова, чтобы поздороваться с библиотекаршей|G2|character_egorich thinks|---|---|29",
		"Егорыч: Но я кивнул ей головой. Она не посмотрела в мою сторону.|G2|character_egorich thinks|---|---|33",
		"EJUMP 45",
		"Тёмыч: Как ты думаешь, почему это произошло?|W|character_temich suspects",
		"Егорыч: Наверное потому, что Светлана Фёдоровна хотела показать нам новую библиотеку...|W|character_egorich thinks",
		"Хотя это очевидно.|W|character_egorich yee",
		"Я, кстати, днём раньше взял оттуда свой любимый журнал про морскую военную технику.|W|character_egorich yee|---|---|show aff",
		"Тебе может понравиться. Правда, последняя рубрика в нем какая-то недоречная.|W|character_egorich thinks",
		"Тёмыч: Я одолжу это у тебя.|W|character_temich kekk|---|---|show aff",
		"~~~ Журнал Егорыча добавлен в записи суда.|B|character_temich kekk|---|REACT fanfare_newev|121613224|aff;Журнал Егорыча;Про военную технику. Последняя рубрика не вписывается в тематику.;Последняя рубрика описывает правила этикета. Оказывается, кивок головой равносилен слову 'Здравствуйте';3",
		"Тёмыч: (Это мне очень пригодиться.)|B|character_temich wonder",
		"(Ой, тьфу бл*ть, пригодится!)|B|character_temich damn",
		"(Если бы не дай бог Светланфёдрна-то умела читать мысли, то мне было бы плохо...)",
		"JUMP 2",
		"Тёмыч: О чем вы разговаривали?|W|character_temich kekk",
		"Светланфёдрна: А почему ты о себе в третьем лице спрашиваешь?|W|character_swetlan hmm|---|REACT surprise",
		"Такой же тебе вопрос: о чем вы говорили?",
		"Тёмыч: Хмф! Мы говорили о том, как важно будет поздороваться с библиотекаршей и как важен этикет в современном мире.|W|character_temich yee",
		"Светланфёдрна: И тем не менее, поздоровалось только трое... Так может это вы были-то?|W|character_swetlan wtf",
		"Тёмыч: ...|W|character_temich default",
		"Тёмыч: ...|W|character_temich default",
		"Тёмыч: ...|W|character_temich default",
		"(Блинбл*тьсукаааааааааааАААААААААА)|B|character_temich damn",
		"(Вопрос из разряда 'На какой сам сядешь, на какой мать посадишь')",
		"JUMP 3",
		"Тёмыч: Часто ли бывало такое, что с тобой кто-то не здоровается?|W|character_temich kekk",
		"Егорыч: Да постоянно. Проще спросить, часто ли со мной здороваются.|W|character_egorich suspects",
		"Тёмыч: Ну и ну...|W|character_temich wonder",
		"JUMP 4",
		"Тёмыч: Ты думаешь, этого достаточно?|W|character_temich yee|---|REACT surprise",
		"Егорыч: Вполне. Я где-то читал, что так можно. Но не помню, где...|W|character_egorich thinks",
		"Светланфёдрна: В любом суде доказательство - превыше всего. Поэтому вот этот твой аргумент, оннннн, не сработает.|W|character_swetlan yee",
		"Тёмыч: Кстати, а вы разве доказали, что никто из нас не поздоровался с бедной безымянной библиотекаршей?|W|character_temich wonder|---|REACT surprise",
		"Светланфёдрна: У меня есть несколько свидетелей. Ну и разве я могу обманывать? Мне ж это незачем...|W|character_swetlan default|---|REACT frustration",
		"Тёмыч: (Светланфёдрне действительно незачем кого-то обманывать)|B|character_temich kekk",
		"(Она просто хочет нас воспитать, а не нагрузить домашкой)",
		"(Но проблема в том, что наказывать нас незачем, а её воспитательная мера - убийствена.)",
		"(Главное не забыть об этом: моя цель - доказать, что мы - невиновны, а не раскрыть ложь Светланфёдрны.)",
		"(А вот если бы у неё не было маразма, либо если бы она не оставалась на своей работе учителя...)",
		"(...всё было бы хорошо.)",
		"JUMP 5",
		"Тёмыч: (Надо доказать что-то... Но что конкретно?)|B|character_temich wonder",
		"(То, что подавляющая часть нашего класса поздоровалась?)",
		"(Хмм, каждый из нас здоровается кивком головой. Может, надо доказать легитимность такого приветствия?)",
		"(Ух, дело будет непростым.)",
		"(Вот, до чего маразм доводит...)|W|character_temich kekk",
		"JUMP 2",
	]
