extends Node2D
var Dialogue
var BoxColor
var Roles
var correct
var va
func _ready():
	correct = "5 a1ff res://scenes/case_easter/trial_3.tscn 3"
	va = "egor"
	BoxColor = Color(0.5,1,0.5,1)
	Roles = [
		"character_egorich pro",
		"character_swetlan jud",
		#"character_temich hld",
		"character_sonya pro",
		"character_lentoln wit",
		"character_temich def",
	]
	Dialogue = [ # диалоги. оффсет 20
		"Светланфёдрна: Допрашивай.|W|character_swetlan default",
		"--- Как со мной не поздоровались ---|R|character_lentoln default|STOP all|REACT intro_woosh",
		"Библиотекарша: На прошлой перемене, я впустила в библиотеку 10-В класс.|G2|character_lentoln default|START2 examination-allegro|---|7",
		"Но никто из них не поздоровался! Даже головой не кивнули!|G2|character_lentoln hmm|---|---|12",
		"За окном еще какие-то охломоны закладки искали, или просто для развлечения в мусорке рылись|G2|character_lentoln omg|---|---|16",
		"EJUMP 37",
		"EJUMP 37",
		"Егорыч: Почему вы это сделали?|W|character_egorich thinks",
		"Библиотекарша: А почему бы и нет?|W|character_lentoln hmm",
		"Тем более, Светлана Фёдоровна ваша попросила-ц...",
		"Егорыч: Ясно. Продолжайте.|W|character_egorich suspects",
		"JUMP 2",
		"Егорыч: А вы пристально следили за нами?|W|character_egorich thinks",
		"Библиотекарша: Ну да. Специально ждала, чтоб со мной поздоровались. А вы меня 'тупо в игнор' за это... заэтосамили...|W|character_lentoln rage",
		"Егорыч: (Очень необычно видеть, как пожилые люди выражаются таким сленгом...)|B|character_egorich laughs|---|REACT surprise",
		"JUMP 3",
		"Егорыч: А можете подробнее рассказать, что вы видели за окном?|W|character_egorich thinks",
		"Библиотекарша: О, та там свои кадры. С 9-й школы что ли...|W|character_lentoln hmm",
		"Ходили из стороны в сторону сначала, оглядывались",
		"А потом под каждый кирпич залезли, рыскали там че-то...",
		"Егорыч: (Она точно следила за нами? Или за теми челами?)|B|character_egorich suspects",
		"~~~ Сомнения Егорыча добавлены в записи суда.|B|character_egorich thinks|---|REACT fanfare_newev|12341613|report;Сомнения Егорыча;Показания библиотекарши странные.;Она подробно описала, что делали какие-то непричастные к делу пацаны за окном.;6",
		"Егорыч: Продолжайе...",
		"JUMP 4",
		"Егорыч: Для вас это так важно?|W|character_egorich thinks",
		"Библиотекарша: Конечно! Вежливость в наше время - большая редкость. А я же работаю библиотекарем в школе!|W|character_lentoln sigh",
		"Вы должны мне в ноги кланяться!|W|character_lentoln rage",
		"Егорыч: (...Либо это ЧСВ, либо маразм, либо и то, и то.)|B|character_egorich suspects",
		"OBJECTION hit wv ",
		"Тёмыч: Светлана... Леонидовна, кхм, а вот Вера Юрьевна, местная учительница биологии, сама ни с кем не здоровается|W|character_temich wonder",
		"И терпит такое же в свою сторону. А она ж биологичка, а биология - крайне важная наука",
		"Во всяком случае, по мнению таких же биолохичек, как она. Так что, ей тоже нам задать 123 генома человека расшифровать?",
		"Просто не сходится это у меня в голове...",
		"Библиотекарша: Так, а ты вообще молчи, гад такой!|W|character_lentoln rage|---|REACT damage",
		"Тёмыч: ...Егогорыч, я всё.|W|character_temich kekk",
		"Егорыч: (Бедный Тьоха...)|B|character_egorich damage",
		"JUMP 5",
		"Егорыч: (Её показания не противоречат тому немногому, что у меня есть.)|B|character_egorich thinks",
		"(Самое время *допросить* её *детальнее*. Авось что-то найду.)|B|character_egorich yee",
		"JUMP 2",
	]


func _on_investigation_screen_next():
	if $investigation_screen.Cur == 13:
		Dialogue[5] = "А я специально следила за всеми, чтобы вы поздоровались. А вы...|G2|character_lentoln sigh|---|REACT frustration|24"
		correct = "5 report res://scenes/case_easter/trial_5.tscn 0"
