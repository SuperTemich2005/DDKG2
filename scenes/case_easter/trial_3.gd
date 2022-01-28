extends Node2D
var Dialogue
var BoxColor
var Roles
func _ready():
	BoxColor = Color(0.5,0.5,1,1)
	Roles = [
		"character_egorich pro",
		"character_swetlan jud",
		#"character_temich hld",
		"character_sonya wit",
		"character_wit wit",
		"character_temich def",
	]
	Dialogue = [ # диалоги. 
		"",
		"Тёмыч: Светлана Фёдоровна, я хочу обратить внимание на то, что свидетель кивнул головой в знак приветствия библиотекарше.|W|character_temich kekk",
		"Светланфёдрна: И что? Ты думаешь, этого достаточно???|W|character_swetlan wtf|START suspense|REACT surprise",
		"Тёмыч: Да. Согласно этому журналу, который за день до происшествия взял себе Егорыч,|W|character_temich wonder|STOP all|---|show aff",
		"Это более чем достаточно!|W|character_temich objection_1|START objection_theme|REACT intro_woosh",
		"Светланфёдрна: О боже... *вздых*|W|character_swetlan default",
		"Ну и что ты доказал? Что один из твоих друзей кивнул головой библиотекарше?",
		"Ну молодец, а остальные 30 человек головой не кивнули.",
		"Тёмыч: (...Я бессилен.)|B|character_temich damn|STOP all|REACT frustration",
		"Егорыч: ...|W|character_egorich thinks",
		"(Тьохе нужно помочь, как мне кажется...)|B|character_egorich suspects",
		"(Он опять кваса напился, теперь страдает.)",
		"(Но тем не менее, он показал, что учителя не настолько неуязвимы! Я пойду нах*й, если ничего не попытаюсь сделать.)|B|character_egorich rage|STOP all",
		"OBJECTION hit wv egor",
		"Светлана Фёдоровна, у меня есть свои вопросы.",
		"Светланфёдрна: Да вы что, сговорились, что ли?|W|character_swetlan wtf",
		"Ну и что тебе нужно, Егор?",
		"Егорыч: Меня интересует мнение самой библиотекарши... Есть ли ей дело до того, кто там с ней поздоровался?|W|character_egorich thinks|START logic",
		"Светланфёдрна: Ну если она мне пожаловалась, то конечно есть!|W|character_swetlan wtf",
		"Егорыч: Хотелось бы распросить её отдельно.|W|character_egorich suspects",
		"Светланфёдрна: Ну ладно...|W|character_swetlan default|STOP all|REACT frustration",
		"...",
		"Библиотекарша: Здрасте, Светлана Фёдоровна.|W|character_lentoln default|START ltn_theme",
		"Вызывали?",
		"Егорыч: (Вот она - Чертила Доносческая.)|B|character_egorich thinks",
		"Светланфёдрна: Та да, Светлана Леонидовна, вызывала.|W|character_swetlan default",
		"По поводу инцидента, произошедшего на прошлой перемене.",
		"Библиотекарша: Ох, не напоминай...|W|character_lentoln hmm",
		"Такие эти дети противные у тебя...",
		"Тёмыч: Да с вами все мы поздоровались, а вы не заметили и теперь бочку на нас катите!|W|character_temich deskslam|---|REACT slam",
		"Библиотекарша: Закрой рот. Вот, просто: закрой рот.|W|character_lentoln rage|---|REACT frustration",
		"Егорыч: А вот опишите то, что только что произошло.|W|character_egorich thinks",
		"Библиотекарша: Да запросто, я как щас помню это!|W|character_lentoln omg",
		"--- Как со мной не поздоровались ---|R|---|STOP all|REACT intro_woosh",
		"Библиотекарша: На прошлой перемене, я впустила в библиотеку 10-В класс.|W|character_lentoln default|START examination-moderato",
		"Но никто из них не поздоровался! Даже головой не кивнули!|W|character_lentoln hmm",
		"За окном еще какие-то охломоны закладки искали, или просто для развлечения в мусорке рылись|W|character_lentoln omg",
		"Егорыч: Ваши показания какие-то мутные...|W|character_egorich suspects|STOP all|REACT frustration",
		"Но не суть. Я проведу перекрестный допрос.|W|character_egorich yee",
		"Тёмыч: Удачи, дружище.|W|character_temich kekk",
		"OUT res://scenes/case_easter/trial_4_interogate.tscn",
	]
	$investigation_screen._on_Next_pressed()


func _on_investigation_screen_next():
	if $investigation_screen.Cur == 25-16:
		BoxColor = Color(0.5,1,0.5,1)
		$investigation_screen.refresh()
