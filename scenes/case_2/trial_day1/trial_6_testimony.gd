extends Node2D
var Anims
var Dialogue
var Ev
var Music
var loc_file = ConfigFile.new()
var Cast
func _ready():
	Dialogue = [ # диалоги. 
		"",
		"--- Как я пыталась её убить --- R",
		"Маша: Я забила ей стрелу в сквере. W",
		"Она пришла, ну я её и отметелила.",
		"Та я не сильно ее толком приложила то, вроде...",
		"Попинала сначала, потом камнем не сильно",
		"Так ей и надо, заразе...",
		"Тёмыч: Ну и ну.",
		"(Пока все просто) B",
		"(И ее версия, и версии Палтоса, просто смешные)",
		"(И они не в состоянии их подкрепить фактами, да и еще не могут правильно построить показания)",
		"(Чтобы особо докапывающийся Тьоха не докопался)",
		"(Но рано или поздно мы дойдем до вопроса, а с чего весь этот цирк начался)",
		"(Почему совершала преступление не Маха)",
		"(Ну и, на всякий-провсякий, кто, собственно, это сделал)",
		"(А это будет уже всяко сложнее...)",
		"(Надо разобраться с баянистыми задачами поскорее, ибо я не хочу, чтобы на главные проблемы не хватило времени...)",
		"OUT res://scenes/case_2/trial_day1/trial_7_crossexam.tscn",
		"",
	]
	Music = [
		"",
		"--- Как я пыталась её убить --- R",
		"START examination-moderato Маша: Я забила ей стрелу в сквере. W",
		"Она пришла, ну я её и отметелила.",
		"Та я не сильно ее толком приложила то, вроде...",
		"Попинала сначала, потом камнем не сильно",
		"Так ей и надо, заразе...",
		"STOP examination-moderato Тёмыч: Ну и ну.",
		"(Пока все просто) B",
		"(И ее версия, и версии Палтоса, просто смешные)",
		"(И они не в состоянии их подкрепить фактами, да и еще не могут правильно построить показания)",
		"(Чтобы особо докапывающийся Тьоха не докопался)",
		"(Но рано или поздно мы дойдем до вопроса, а с чего весь этот цирк начался)",
		"(Почему совершала преступление не Маха)",
		"(Ну и, на всякий-провсякий, кто, собственно, это сделал)",
		"(Ну и, на всякий-провсякий, кто, собственно, это сделал)",
		"(Надо разобраться с баянистыми задачами поскорее, ибо я не хочу, чтобы на главные проблемы не хватило времени...)",
		"OUT ",
		"",
	]
	Anims = [ # массив, в котором 1 слово это перс, а 2 - его анимка
		"",
		"character_masha default --- Как я пыталась её убить --- R POS wit",
		"character_masha hey Маша: Я забила ей стрелу в сквере. W POS wit",
		"character_masha sigh Она пришла, ну я её и отметелила.",
		"character_masha hey Та я не сильно ее толком приложила то, вроде...",
		"character_masha brr Попинала сначала, потом камнем не сильно",
		"character_masha sigh Так ей и надо, заразе...",
		"character_temich wonder Тёмыч: Ну и ну. POS def",
		"(Пока все просто) B",
		"(И ее версия, и версии Палтоса, просто смешные)",
		"character_temich kekk (И они не в состоянии их подкрепить фактами, да и еще не могут правильно построить показания)",
		"(Чтобы особо докапывающийся Тьоха не докопался)",
		"(Но рано или поздно мы дойдем до вопроса, а с чего весь этот цирк начался)",
		"(Почему совершала преступление не Маха)",
		"(Ну и, на всякий-провсякий, кто, собственно, это сделал)",
		"character_temich comeon (Ну и, на всякий-провсякий, кто, собственно, это сделал)",
		"(Надо разобраться с баянистыми задачами поскорее, ибо я не хочу, чтобы на главные проблемы не хватило времени...)",
		"OUT res://scenes/case_2/trial_day1/trial_7_crossexam.tscn",
		"",
	]
	Ev = [
		"",
		"--- Как я пыталась её убить --- R",
		"Маша: Я забила ей стрелу в сквере. W",
		"Она пришла, ну я её и отметелила.",
		"Та я не сильно ее толком приложила то, вроде...",
		"Попинала сначала, потом камнем не сильно",
		"Так ей и надо, заразе...",
		"Тёмыч: Ну и ну.",
		"(Пока все просто) B",
		"(И ее версия, и версии Палтоса, просто смешные)",
		"(И они не в состоянии их подкрепить фактами, да и еще не могут правильно построить показания)",
		"(Чтобы особо докапывающийся Тьоха не докопался)",
		"(Но рано или поздно мы дойдем до вопроса, а с чего весь этот цирк начался)",
		"(Почему совершала преступление не Маха)",
		"(Ну и, на всякий-провсякий, кто, собственно, это сделал)",
		"(Надо разобраться с баянистыми задачами поскорее, ибо я не хочу, чтобы на главные проблемы не хватило времени...)",
		"OUT ",
		"",
	]
	loc_file.load(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
	loc_file.set_value("Locations","Last",filename)
	loc_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")


