extends Node2D
var Dialogue
var BoxColor
var Roles
var correct
var va
func _ready():
	#correct = "6 aff res://scenes/case_3/trial_1/trial_7.tscn 49"
	correct = "123 asd asd 42"
	va = "egor"
	BoxColor = Color(0.5,1,0.5,1)
	Roles = [
		"character_egorich def",
		"character_lentoln jud",
		#"character_temich hld",
		"character_sonya pro",
		"character_tuvok wit",
		"character_temich wit",
		"character_msis wit",
	]
	Dialogue = [ # диалоги. оффсет 20
		"Е. Анатольевна: Приступайте.",
		"--- Как меня обокрали ---|R|character_msis default|STOP all|REACT intro_woosh",
		"Жека: Я была с парнем в поезде. Он - трейсер, но тогда он был сонным, по этому сидел смирно.|G2|character_msis default|START2 examination-allegro|---|7",
		"Жека: В панской хате мы просто кушали, картошку всякую...|G2|character_msis default|---|---|11",
		"Жека: Пропажа была обнаружена в Ашане, мне нехватило 100 гривень.|G2|character_msis hmm|---|---|23",
		"Жека: Наши деньги нашлись у Зинца!|G2|character_msis what|---|---|0",
		"EJUMP 49",
		"Егорыч: А что так?|W|character_egorich thinks",
		"Жека: Какая разница? Просто сонный.|W|character_sonya default",
		"Егорыч: (Ну, тут не к чему придраться.)|B|character_egorich suspects",
		"JUMP 2",
		"Егорыч: Правда?|W|character_egorich suspects",
		"Жека: А что?|W|character_msis what",
		"Егорыч: На тот оммент, в панской хате не было картошки.|W|character_egorich paper",
		"Жека: Правда?|W|character_msis ugh",
		"Егорыч: Да. Ладно, не суть. Расскажи лучше, как именно ты провела это время.|W|character_egorich suspects",
		"Жека: ...Ладно?|W|character_msis hmm", # Заменить 3 элемент
		"JUMP 3",
		"Егорыч: Меня ваше меню смущает. Вы ели, эффективно, воздух.|W|character_egorich suspects", # Для нового 3-го элемента
		"Жека: Что значит 'эффективно ели'?|W|character_msis hmm",
		"Егорыч: ...Забей.|W|character_egorich suspects",
		"(Она заменила свою реплику другой. Это ли не знак?)|B",
		"JUMP 3",
		"Егорыч: Что вы хотели купить?|W|character_egorich thinks",
		"Жека: Тебя это не касается|W|character_msis rage",
		"Да и вообще, зачем нам тебе отвечать на вопросы? Ты заодно с преступником!|W|---|STOP all",
		"Егорыч: Пытаешься меня дискредитировать?|W|character_egorich suspects|START omen",
		"Жека: Ни разу!|W|character_msis rage",
		"Просто ты защищаешь этого вора! Это напрягает!",
		"Егорыч: Тьоха защищал твою сестру от обвинений в покушении на убийство! По твоей логике, когда он защищал Машу от ложных обвинений, он был с ней заодно?|W|character_egorich slam|---|REACT slam",
		"Е. Анатольевна: Прекратите эту перепалку!|W|character_lentoln rage|STOP all",
		"Соня: Про меня вообще забыли.|Y|character_sonya death|START2 examination-allegro",
		"Егорыч: (Про тебя не забыть...)|B|character_egorich suspects",
		"JUMP 4",
		"Егорыч: Ему их подкинули.|W|character_egorich yee",
		"Жека: Нет.|W|character_msis default",
		"Егорыч: Откуда ты знаешь?|W|character_egorich yee",
		"Жека: ...|W|character_msis ugh",
		"OBJECTION obj",
		"Соня: Эта дешевая манипуляция не сработает даже на Дашкерине.|Y|character_sonya death",
		"Егорыч: ...|W|character_egorich damn",
		"JUMP 5",
		"Егорыч: Елена Анатольевна, показания Фильмоновой ложны!|W|character_egorich objection|---|REACT intro_woosh",
		"Соня: Не стану скрывать, доверия к свидетелю у меня нет и отношения с ней так себе.|Y|character_sonya death",
		"Но это? Противоречит этому?",
		"Егорыч: ...|W|character_egorich thinks",
		"Е. Анатольевна: Хе-хе.|W|character_lentoln kek",
		"Егорыч: ...|W|character_egorich damage|---|REACT damage",
		"JUMP 2",
		"Егорыч: (В этих показаниях есть противоречие, но я не знаю, где)|B|character_egorich thinks",
		"(Логично просто каждую её реплику разобрать)",
		"(Главное не запутаться в событиях и хронологии)",
		"(Может, взять листок и записывать странные события и реплики людей?)",
		"(Ведь не стану же я всё подряд записывать в записи?)|B|character_egorich default",
		"JUMP 2",
	]
	

func _on_investigation_screen_next():
	if $investigation_screen.Cur == 16:
		Dialogue[3] = "Жека: Мы просто кушали, ничего необычного не происходило. Никаких странностей, никого подозрительного.|G2|character_msis hmm|---|---|18"
		correct = "3 hijab res://scenes/case_3/trial_1/trial_9.tscn 42"
