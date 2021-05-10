extends Node2D
var Anims
var Dialogue
var Chats
var Shows
var Moves
var Music
var EvCount
var Ev
var loc_file = ConfigFile.new()
func _ready():
	Dialogue = [ # диалоги. 
		"",
		"5 октября. Около 19:00. Коридор перед номером 320. G",
		"Е. Анатольевна: Ты точно уверена? Ты же не вытянешь. W",
		"...",
		"Ладно. Вот улики, заседание в подвале через час.",
		"...",
		"Всё, давай, беги.",
		"...",
		"Тёмыч: (Кто там у Лентольны?) B",
		"Ой. Привет. W",
		"(И она сразу же убежала. Ну да, конечно, пошел я нафиг.) B",
		"Е. Анатольевна: О, Зинец, я тебе как раз таки звякнуть собиралась, чтоб сюда шел. W",
		"Тёмыч: Я просто мимо проходил.",
		"Е. Анатольевна: У тебя суды ночью были?",
		"Тёмыч: (Разве что в Attorney Online на ру) B",
		"Нет, а что? W",
		"Е. Анатольевна: Теперь будут.",
		"Жертва может очнуться прямо завтра. Завтра же она и напишет заявление.",
		"Тогда, полиция возьмет дело под личный контроль",
		"Нужно разобраться с деталями и найти преступника как можно скорее.",
		"Тёмыч: Суд сегодня ночью?",
		"Е. Анатольевна: Через час.",
		"Тёмыч: Ё! Я же не готов еще, мне нужно еще осмотреть пару мест--",
		"Е. Анатольевна: Вот тебе улики, держи.",
		"~~~ Отчёт о вскрытии добавлен в записи суда",
		"Тёмыч: Не густо...",
		"Е. Анатольевна: Тебе больше и не нужно, на самом деле.",
		"Тёмыч: ...Наверное.",
		"Е. Анатольевна: Давай, беги, куда тебе еще нужно сбегать, у тебя еще есть время",
		"Тёмыч: ...",
		"(Кстати... Я вспомнил!) B",
		"Ладно, до свидания, Лентольна... W",
		"OUT res://scenes/case_2/222c_day1_1.tscn",
		"",
	]
	Anims = [
		"",
		"5 октября. Около 19:00. Коридор перед номером 320. G",
		"Е. Анатольевна: Ты точно уверена? Ты же не вытянешь. W",
		"...",
		"Ладно. Вот улики, заседание в подвале через час.",
		"...",
		"Всё, давай, беги.",
		"...",
		"character_sonya death Тёмыч: (Кто там у Лентольны?) B",
		"character_sonya SHOW Ой. Привет. W",
		"character_sonya HIDE (И она сразу же убежала. Ну да, конечно, пошел я нафиг.) B",
		"character_lentoln SHOW Е. Анатольевна: О, Зинец, я тебе как раз таки звякнуть собиралась, чтоб сюда шел. W",
		"Тёмыч: Я просто мимо проходил.",
		"character_lentoln kek Е. Анатольевна: У тебя суды ночью были?",
		"Тёмыч: (Разве что в Attorney Online на ру) B",
		"Нет, а что? W",
		"character_lentoln hmm Е. Анатольевна: Теперь будут.",
		"Жертва может очнуться прямо завтра. Завтра же она и напишет заявление.",
		"Тогда, полиция возьмет дело под личный контроль",
		"Нужно разобраться с деталями и найти преступника как можно скорее.",
		"Тёмыч: Суд сегодня ночью?",
		"character_lentoln default Е. Анатольевна: Через час.",
		"Тёмыч: Ё! Я же не готов еще, мне нужно еще осмотреть пару мест--",
		"character_lentoln kek Е. Анатольевна: Вот тебе улики, держи.",
		"~~~ Отчёт о вскрытии добавлен в записи суда",
		"Тёмыч: Не густо...",
		"character_lentoln hmm Е. Анатольевна: Тебе больше и не нужно, на самом деле.",
		"Тёмыч: ...Наверное.",
		"Е. Анатольевна: Давай, беги, куда тебе еще нужно сбегать, у тебя еще есть время",
		"Тёмыч: ...",
		"(Кстати... Я вспомнил!) B",
		"Ладно, до свидания, Лентольна... W",
		"OUT res://scenes/case_2/222c_day1_1.tscn",
		"",
	]
	Music = [
		"",
		"5 октября. Около 19:00. Коридор перед номером 320. G",
		"Е. Анатольевна: Ты точно уверена? Ты же не вытянешь. W",
		"...",
		"Ладно. Вот улики, заседание в подвале через час.",
		"...",
		"Всё, давай, беги.",
		"...",
		"Тёмыч: (Кто там у Лентольны?) B",
		"Ой. Привет. W",
		"(И она сразу же убежала. Ну да, конечно, пошел я нафиг.) B",
		"Е. Анатольевна: О, Зинец, я тебе как раз таки звякнуть собиралась, чтоб сюда шел. W",
		"Тёмыч: Я просто мимо проходил.",
		"START ltn_theme Е. Анатольевна: У тебя суды ночью были?",
		"Тёмыч: (Разве что в Attorney Online на ру) B",
		"Нет, а что? W",
		"Е. Анатольевна: Теперь будут.",
		"Жертва может очнуться прямо завтра. Завтра же она и напишет заявление.",
		"Тогда, полиция возьмет дело под личный контроль",
		"Нужно разобраться с деталями и найти преступника как можно скорее.",
		"Тёмыч: Суд сегодня ночью?",
		"Е. Анатольевна: Через час.",
		"Тёмыч: Ё! Я же не готов еще, мне нужно еще осмотреть пару мест--",
		"Е. Анатольевна: Вот тебе улики, держи.",
		"~~~ Медицинская книжка Иры Жаровой добавлена в записи суда",
		"Тёмыч: Не густо...",
		"Е. Анатольевна: Тебе больше и не нужно, на самом деле.",
		"Тёмыч: ...Наверное.",
		"Е. Анатольевна: Давай, беги, куда тебе еще нужно сбегать, у тебя еще есть время",
		"Тёмыч: ...",
		"(Кстати... Я вспомнил!) B",
		"Ладно, до свидания, Лентольна... W",
		"OUT res://scenes/case_2/222c_day1_1.tscn",
		"",
	]
	Ev = [
		"",
		"5 октября. Около 19:00. Коридор перед номером 320. G",
		"Е. Анатольевна: Ты точно уверена? Ты же не вытянешь. W",
		"...",
		"Ладно. Вот улики, заседание в подвале через час.",
		"...",
		"Всё, давай, беги.",
		"...",
		"Тёмыч: (Кто там у Лентольны?) B",
		"Ой. Привет. W",
		"(И она сразу же убежала. Ну да, конечно, пошел я нафиг.) B",
		"Е. Анатольевна: О, Зинец, я тебе как раз таки звякнуть собиралась, чтоб сюда шел. W",
		"Тёмыч: Я просто мимо проходил.",
		"START ltn_theme Е. Анатольевна: У тебя суды ночью были?",
		"Тёмыч: (Разве что в Attorney Online на ру) B",
		"Нет, а что? W",
		"Е. Анатольевна: Теперь будут.",
		"Жертва может очнуться прямо завтра. Завтра же она и напишет заявление.",
		"Тогда, полиция возьмет дело под личный контроль",
		"Нужно разобраться с деталями и найти преступника как можно скорее.",
		"Тёмыч: Суд сегодня ночью?",
		"Е. Анатольевна: Через час.",
		"Тёмыч: Ё! Я же не готов еще, мне нужно еще осмотреть пару мест--",
		"Е. Анатольевна: Вот тебе улики, держи.",
		"5/report/Медицинская книжка Иры Жаровой. Ученица 8-Г. Заметки доктора: сотряс, сломанные ребра, колотый удар в грудь. Заметки Тьохи: засос на запястье/0",
		"Тёмыч: Не густо...",
		"Е. Анатольевна: Тебе больше и не нужно, на самом деле.",
		"Тёмыч: ...Наверное.",
		"Е. Анатольевна: Давай, беги, куда тебе еще нужно сбегать, у тебя еще есть время",
		"Тёмыч: ...",
		"(Кстати... Я вспомнил!) B",
		"Ладно, до свидания, Лентольна... W",
		"OUT res://scenes/case_2/222c_day1_1.tscn",
		"",
	]
	Chats = [ # массив, в котором все, кроме последних 3 *БУКВ* - названия кнопок, а последние 3 буквы - номер строки
		"Идеи?  43",
		"Что делать? 54",
		"",
		"",
	]
	Moves = [ # массив с названиями кнопок перехода и целью куда они переводят
		"Столовая res://scenes/case_2/mess_day1.tscn",
		"",
		"",
		"",
	]
	Shows = [ # массив, в котором первое слово - улика, а 2 - номер строки, на который перекинет игрока, если ее показать
		"badge 61",
	]
	
# СУКА БЛЯТЬ НЕ ТРОГАЙ ЭТО ГАНДОН НЕДОШТОПАННЫЙ АААААААААААААААААААААААА!!!!!!!!!!!!!!!!!!!!!!!!
	for i in range(1,4):
		if Chats[i-1] != "":
			get_node("chat_"+str(i)).text = Chats[i-1].left(Chats[i-1].length()-3)
	for i in range(1,4):
		if Moves[i-1] != "":
			get_node("move_"+str(i)).text = Moves[i-1].left(Moves[i-1].length()-Moves[i-1].split(" ")[-1].length())
	print(Chats[0].split(" ")[-1])
	loc_file.load("C:/Games/ddkg2.save")
	

func _on_chat_1_pressed():
	if $investigation_screen.State == "Chat" and Chats[0] != "":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int(Chats[0].split(" ")[-1])
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]


func _on_chat_2_pressed():
	if $investigation_screen.State == "Chat" and Chats[1] != "":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int(Chats[1].split(" ")[-1])
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]


func _on_chat_3_pressed():
	if $investigation_screen.State == "Chat" and Chats[2] != "":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int(Chats[2].split(" ")[-1])
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]


func _on_chat_4_pressed():
	if $investigation_screen.State == "Chat" and Chats[3] != "":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int(Chats[3].split(" ")[-1])
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]


func _on_move_1_pressed():
	if $investigation_screen.State == "Move" and Moves[0] != "":
		get_tree().change_scene(Moves[0].split(" ")[-1])


func _on_move_2_pressed():
	if $investigation_screen.State == "Move" and Moves[1] != "":
		get_tree().change_scene(Moves[1].split(" ")[-1])


func _on_move_3_pressed():
	if $investigation_screen.State == "Move" and Moves[2] != "":
		get_tree().change_scene(Moves[2].split(" ")[-1])

func _on_move_4_pressed():
	if $investigation_screen.State == "Move" and Moves[3] != "":
		get_tree().change_scene(Moves[3].split(" ")[-1])


func _on_poi_mouse_exited():
	$investigation_screen/crosshair.animation = "default"


func _on_poi_1_pressed():
	if $investigation_screen.State == "Examine":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int($poi_1.text)
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]
		$investigation_screen.Checked[1] = true


func _on_poi_1_mouse_entered():
	if $investigation_screen.State == "Examine":
		if $investigation_screen.Checked[1] == false:
			$investigation_screen/crosshair.animation = "wut"
		else:
			$investigation_screen/crosshair.animation = "gotchu"


func _on_poi_2_mouse_entered():
	if $investigation_screen.State == "Examine":
		if $investigation_screen.Checked[2] == false:
			$investigation_screen/crosshair.animation = "wut"
		else:
			$investigation_screen/crosshair.animation = "gotchu"


func _on_poi_2_pressed():
	if $investigation_screen.State == "Examine":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int($poi_2.text)
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]
		$investigation_screen.Checked[2] = true


func _on_poi_3_mouse_entered():
	if $investigation_screen.State == "Examine":
		if $investigation_screen.Checked[3] == false:
			$investigation_screen/crosshair.animation = "wut"
		else:
			$investigation_screen/crosshair.animation = "gotchu"


func _on_poi_3_pressed():
	if $investigation_screen.State == "Examine":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int($poi_3.text)
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]
		$investigation_screen.Checked[3] = true


func _on_poi_4_mouse_entered():
	if $investigation_screen.State == "Examine":
		if $investigation_screen.Checked[4] == false:
			$investigation_screen/crosshair.animation = "wut"
		else:
			$investigation_screen/crosshair.animation = "gotchu"


func _on_poi_4_pressed():
	if $investigation_screen.State == "Examine":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int($poi_4.text)
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]
		$investigation_screen.Checked[4] = true



func _on_verif_timeout():
	print("shitfuck")
	loc_file.set_value("Locations",str(filename),"1")
	loc_file.save("C:/Games/ddkg2.save")
