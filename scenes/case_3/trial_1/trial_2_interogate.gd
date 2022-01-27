extends Node2D
var Dialogue
var BoxColor
var Roles
var correct
var va
func _ready():
	correct = "4 aff res://scenes/case_3/trial_1/trial_3.tscn 92"
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
		"Егорыч: Светлана Фёдоровна отняла у нас перемену и отправила в библиотеку|G2|character_egorich thinks|START2 examination-moderato|---|0",
		"Егорыч: В это время, я разговаривал с Тьохой и Жекой|G2|character_egorich thinks|---|---|0",
		"Егорыч: Когда мы зашли в библиотеку, увлеченный разговором, я не смог вставить своего слова, чтобы поздороваться с библиотекаршей|G2|character_egorich thinks|---|---|0",
		"Егорыч: Но я кивнул ей головой. Она не посмотрела в мою сторону.|G2|character_egorich thinks|---|---|0",
		"EJUMP 0",
		"Тёмыч: Как ты думаешь, почему это произошло?|W|character_temich suspects",
		"Егорыч: Наверное потому, что Светлана Фёдоровна хотела показать нам новую библиотеку...|W|character_egorich thinks",
		"Хотя это очевидно.|W|character_egorich yee",
		"Я, кстати, днём раньше взял оттуда свой любимый журнал про морскую военную технику.|W|character_egorich yee|---|---|show aff",
		"Тебе может понравиться. Правда, последняя рубрика в нем какая-то недоречная.|W|character_egorich thinks",
		"Тёмыч: Я одолжу это у тебя.|W|character_temich kekk|---|---|show aff",
		"~~~ Журнал ",
	]
