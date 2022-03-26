extends Node2D
var Anims
var Dialogue
var Chats
var Shows
var Moves
var Ev
var Music
var EvCount
var loc_file = ConfigFile.new()
var read_chats
var check_for_read_chats
var goto_when_read
var NoShow
var BoxColor
func _ready():
	BoxColor = Color(0.5,1,0.5,1)
	Dialogue = [ # диалоги. 
		"9 октября. 15:00. Лицей 99, 2-й этаж, атриум 2|G|---|---|---", #"Проверка провалена|R|character_masha hey|START omen|REACT damage",
		"Тёмыч: Дело было очень быстрым, хотя обещало быть затянутым.|W|character_temich kekk|START peaceful_day",
		"Егорыч: Всего лишь 1.5 часа потратили, фух. Не то, что в отеле - по ночам заседали.",
		"(Хотя, была в этом какая-то романтика.)|B",
		"Тёмыч: Обвинений с меня не сняли, однако, при данных нам уликах, это итак невозможно.|W|character_temich comeon",
		"У тебя отлично получилось, Егорыч. Ты выбил меня из пасти Сони.",
		"Егорыч: Но я не прищучил гадов!",
		"Щучить может только Палтиныч, этого даже мне не дано, не то что кому-либо еще.|W|character_temich kekk",
		"Егорыч: (Время спустя, Тёмыч был признан невиновным районным судом.)|B|asd",
		"(Сева и Жека были признаны виновными, оперы из Львова получили больше свидетельских показаний и улик.)",
		"(Тёмыч же остался за скобками.)",
		"(Но меня не покидает ощущение, что я не смог помочь Тёмычу)",
		"(В школе же не все знают про его оправдательный вердикт. Я не знаю, надолго ли, но его всё еще считают вором)",
		"(Радомир, Соня, Жека Целых, Я и ряд других людей - благоразумны и понимают, кто плохой, а кто - нет. Но тем не менее, Дашкерин добился, чего хотел.)",
		"(Тех же, кто считает Тёмыча вором, хоть и не значительно, но больше, чем нормальных людей.)",
		"(Больше Тёмыч не возвращался в адвокатуру, да и я особо не хотел этим заниматься)",
		"(Но если понадобится, я всё-таки помогу своим друзьям выбраться из беды. 'Не делай добра - не получишь зла'?)",
		"(Не делая добра, ты не будешь в положении получить такое же добро в первую очередь.)",
		"(Так что... Я менее категоричный в этом плане.)",
		"OUT res://scenes/case_4/invest_4/introduction4.tscn",
	]
	Chats = [
		"Как экскурсия?;84",
		"Соня;97",
		"'Некое дело';133",
		"ЗМЛ 99;293",
	]
	Moves = [
		"",
		"",
		"",
		"",
	]
	Shows = [
		"badge 287",
		"badge 287",
		"badge 287",
	]
	check_for_read_chats = false
	read_chats = [false,false,false,false]


func _on_investigation_screen_next():
	if $investigation_screen.Cur == 5:
		loc_file.load(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
		#loc_file.set_value("General","Case","4")
		loc_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
