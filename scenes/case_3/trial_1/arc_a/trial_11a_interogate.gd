extends Node2D
var Dialogue
var BoxColor
var Roles
var correct
var va
func _ready():
	#correct = "6 aff res://scenes/case_3/trial_1/trial_7.tscn 49"
	correct = "123 asd asd 52"
	va = "egor"
	BoxColor = Color(0.5,1,0.5,1)
	Roles = [
		"character_egorich def",
		"character_lentoln jud",
		"character_sonya pro",
		"character_tuvok wit",
		"character_temich wit",
		"character_msis wit",
		"character_sewa wit",
	]
	Dialogue = [ # диалоги. оффсет 20
		"Е. Анатольевна: Приступайте.",
		"--- Я ничего не крал! ---|R|character_sewa default|STOP all|REACT intro_woosh",
		"Беркут: Допустим, что у меня был хиджаб.|G2|character_sewa default|START2 examination-allegro|---|8",
		"Беркут: Но я мог бы сам пройтись и сам же украсть деньги. Что мне мешало это сделать?|G2|character_sewa default|---|---|13",
		"Беркут: Впутывать Жеку - приобщить к делу лишнего свидетеля. Я же не долбо*б!|G2|character_sewa default|---|---|24",
		"Беркут: И куда бы я потратил эти деньги? 3,250 гривень - мало, чтобы выкупить кого-либо!|G2|character_sewa default|---|---|35",
		"Беркут: На них нельзя даже никого нанять, чтобы её вызволить.|G2|character_sewa default|---|---|38",
		"EJUMP 47",
		"Егорыч: А у тебя его не было?|W|character_egorich suspects",
		"Беркут: А ты можешь доказать, что был?|W|character_sewa rage",
		"Егорыч: Пока нет.|W|character_egorich damage",
		"Беркут: Ну во. Сиди, пасть прикрой, губу закатай, бл*ть.|W|character_sewa default",
		"JUMP 2",
		"Егорыч: Я бы посмотрел, как чел в чёрном плаще будет пытаться карманничать.|W|character_egorich suspects",
		"Тебе мешало то, что это было слишком палевно!",
		"Соня: Он мог с таким же успехом и не надевать хиджаб.|Y|character_sonya death",
		"В твоей схеме, хиджаб - лишний элемент.",
		"Егорыч: В том то и дело: человек в хиджабе среди не-мусульман весьма вызывающий.|W|character_egorich suspects",
		"Человек в хиджабе отвлекал всех, пока Беркут шмонает их же.",
		"По этому, хиджаб - совсем не лишний элемент в этой истории.",
		"Соня: ...Да.|Y|character_sonya death",
		"Беркут: Но проблема в том, что я никого не шмонал, сука!|W|character_sewa default",
		"Егорыч: (... Как скажешь.)|B",
		"JUMP 3",
		"Егорыч: Впутать Жеку - найти сообщника, у которого есть свой интерес.|W|character_egorich yee",
		"Беркут: Ой конечно, насмешил.|W|character_sewa rage",
		"Соня: Ни один нормальный человек не предпочтёт соучаствовать в серийной карманной краже.|Y|character_sonya death",
		"Исключение ли Жека?",
		"Егорыч: Да. Жеке нужны деньги, чтобы сбежать из дома.|W|character_egorich yee",
		"Не важно, каков их мотив. Главное, что они должны сбежать из дома, где испытывают домашнее насилие. Её сестра согласилась покуситься на бывшую Дашкерина, эта серийная кража - плёвое дело!",
		"Соня: ...|W|character_sonya forceslam|---|REACT sith_slam",
		"Егорыч: (Её реакция была... пугающей.)|B|character_egorich all_of_sudden",
		"Беркут: ...Конченая.|W|character_sewa default",
		"Ну, ладно, ты нашел мне сообщника, который меня не сдаст нах*й. Дальше что?|W|character_sewa rage",
		"JUMP 4",
		"Егорыч: Может, у тебя просто накопились деньги на выкуп и эти 3,250 гривень - последнее, что тебе осталось накопить?",
		"Беркут: Только если ты это докажешь.|W|character_sewa kaef",
		"JUMP 5",
		"Егорыч: На самом деле, есть один человек, которого можно нанять на эти деньги.|W|character_egorich thinks|STOP all",
		"Соня: Кто же?|Y|character_sonya death",
		"Егорыч: Тот, кто считает суммы около тысячи - существенными.|W|character_egorich thinks",
		"Башим Дашкерин.|R|character_egorich rage",
		"Соня: ...|W|character_sonya death",
		"Нет.|Y",
		"То, что он готов давать свидетелям-одношкольникам тысячу не значит, что он стоит тысячу.",
		"OUT res://scenes/case_3/trial_1/arc_a/trial_12a.tscn",
		"JUMP 6",
		"Егорыч: (Правильно ли я угадал с вором?)|B|character_egorich suspects",
		"(...Я должен довести дело до конца, потому что иначе Тьохе - конец!)",
		"JUMP 2",
		"Е. Анатольевна: Разве?|W|character_lentoln kek",
		"Егорыч: А разве нет? Показания с этой уликой не сочитаются как-то, вам так не кажется?|W|character_egorich thinks",
		"Е. Анатольевна: Нет.|W|character_lentoln kek",
		"Егорыч: (Что же, не стану акцентировать на этом внимания. Может, пронесёт с пенальти?)|B|character_egorich damage",
		"JUMP 2",
	]
