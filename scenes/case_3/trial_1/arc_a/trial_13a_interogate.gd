extends Node2D
var Dialogue
var BoxColor
var Roles
var correct
var va
func _ready():
	#correct = "6 aff res://scenes/case_3/trial_1/trial_7.tscn 49"
	correct = "3 grafin res://scenes/case_3/trial_1/arc_a/trial_14a.tscn 31"
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
		"--- Вы - мои свидетели. ---|R|character_msis default|---|REACT intro_woosh",
		"Жека: Радик, Зинец, Ты, Жека и Я. Мы все сидели за одним столом и пили сок.|G2|character_msis lmfao|START2 examination-allegro|---|7",
		"Жека: Выпили по стакашке, разговаривали про разное. Выпили все по стакану и ничего не осталось в графине, в итоге.|G2|character_msis lmfao|---|---|15",
		"Жека: Самое удивительное, что произошло за это время, это появление рядом с нами человека в хиджабе.|G2|character_msis what|---|---|23",
		"Жека: Может, меня обокрали как раз-таки тогда?|G2|character_msis what|---|---|27",
		"EJUMP 38",
		"Егорыч: Для справки, мы пили лимонад.|W|character_egorich suspects",
		"Жека: Ой, ну, может, лимонад. Мне-то что?|W|character_msis what",
		"Егорыч: И по сколько мы скинулись на лимонад?|W|character_egorich thinks",
		"Жека: По десятке.|W|character_msis lmfao",
		"Егорыч: (Что?! Она ЛЮТО угадала!)|B|character_egorich all_of_sudden",
		"Жека: Что тако-ое?|W|character_msis default",
		"Егорыч: Ничего. Продолжай.|W|character_egorich suspects",
		"JUMP 2",
		"Егорыч: И про что же?|W|character_egorich suspects",
		"Жека: Говорю же, про разное.|W|character_msis hmm",
		"Егорыч: А конкретнее?|W|character_egorich paper",
		"Жека: Про разное. Это имеет отношение к делу?|W|character_msis hmm",
		"Егорыч: (Умело выкручивается.)|B|character_egorich suspects",
		"Ты выпила стакан, да?|W",
		"Жека: Да. Мы все выпили по стакану.|W|character_msis default",
		"JUMP 3",
		"Егорыч: И что он сказал?|W|character_egorich suspects",
		"Жека: 'Чи вам смакує', так и сказал|W|character_msis lmfao",
		"Егорыч: (Очевидно, она знает. Нет, тут допросы не помогут.)|B|character_egorich thinks",
		"JUMP 4",
		"Егорыч: А разве не в музее Пирогова?|W|character_egorich paper",
		"Жека: Ну, я же не видела, как он меня обворовывает в музее Пирогова. А вот в панской хате он мог, вот как раз таки у него был отвлекающий манёвр!|W|character_msis hmm",
		"Егорыч: (Сладко говорит, но всё же!)|B|character_egorich slam|---|REACT slam",
		"JUMP 5",
		"Егорыч: Елена Анатольевна, эта улика противоречит показаниям Жеки!|W|character_egorich objection|---|REACT slam",
		"Соня: Я бы сказала, что нет.|Y|character_sonya death",
		"Но мне даже можно не говорить. Это дичь!",
		"Е. Анатольевна: Не сказала бы, что дичь.|W|character_lentoln hmm",
		"Но на пенальти тянет.|W|character_lentoln kek",
		"Егорыч: (Я как-то не удивлён уже.)|B|character_egorich sigh",
		"JUMP 2",
		"Егорыч: (Жека нагло врёт, а Тьоха почему-то ей только что помог).|B|character_egorich thinks",
		"(Но я понял, почему. Её ложь можно раскрыть путём сопоставления и противопоставления.)",
		"(Если я сделаю это, то выиграю дело!)",
		"JUMP 2",
	]
