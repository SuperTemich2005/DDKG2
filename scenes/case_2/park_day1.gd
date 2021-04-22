extends Node2D
var Anims
var Dialogue
var Chats
var Shows
var Moves
var Music
var loc_file = ConfigFile.new()
func _ready():
	Dialogue = [ # диалоги. 
		"",
		"5 октября, 12:25. Парк. G",
		"Тёмыч: (Тут никого нет...) B",
		"(И че делать? ...)",
		"MAIN B",
		"Тёмыч: (Домик.)", # 5
		"(Я ставлю сотку, что при удобном случае, Егорыч устроит засаду.)",
		"(Он же мне засаду устроил в *моем* домике?)",
		"(И тут устроит)",
		"EXAM B", 
		"Тёмыч: (Скамейка.)", # 10
		"(Я не стану приседать)",
		"(Зачем, я уже итак сижу...)",
		"(Восьмой класс...)",
		"(Строгач.)",
		"EXAM B",
		"",
	]
	Music = [
		"",
		"5 октября, 12:25. Парк. G",
		"Тёмыч: (Тут никого нет...) B",
		"(И че делать? ...)",
		"MAIN",
		"Тёмыч: (Домик.) B",
		"(Я ставлю сотку, что при удобном случае, Егорыч устроит засаду.)",
		"(Он же мне засаду устроил в *моем* домике?)",
		"(И тут устроит)",
		"EXAM",
		"Тёмыч: (Скамейка.) B",
		"(Я не стану приседать)",
		"(Зачем, я уже итак сижу...)",
		"(Восьмой класс...)",
		"(Строгач.)",
		"EXAM",
		"",
	]
	Anims = [ # массив, в котором 1 слово это перс, а 2 - его анимка
		"",
		"5 октября, 12:25. Парк. G",
		"Тёмыч: (Тут никого нет...) B",
		"(И че делать? ...)",
		"MAIN",
		"Тёмыч: (Домик.) B",
		"(Я ставлю сотку, что при удобном случае, Егорыч устроит засаду.)",
		"(Он же мне засаду устроил в *моем* домике?)",
		"(И тут устроит)",
		"EXAM",
		"Тёмыч: (Скамейка.) B",
		"(Я не стану приседать)",
		"(Зачем, я уже итак сижу...)",
		"(Восьмой класс...)",
		"(Строгач.)",
		"EXAM",
		"",
	]
	Chats = [ # массив, в котором все, кроме последних 3 *БУКВ* - названия кнопок, а последние 3 буквы - номер строки
		"",
		"",
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
		"",
	]
	# СУКА БЛЯТЬ НЕ ТРОГАЙ ЭТО ГАНДОН НЕДОШТОПАННЫЙ АААААА*АААААААААААААААААА!!!!!!!!!!!!!!!!!!!!!!!!
	
	for i in range(1,4):
		if Chats[i-1] != "":
			get_node("chat_"+str(i)).text = Chats[i-1].left(Chats[i-1].length()-3)
	for i in range(1,4):
		if Moves[i-1] != "":
			get_node("move_"+str(i)).text = Moves[i-1].left(Moves[i-1].length()-Moves[i-1].split(" ")[-1].length())
	print(Chats[0].split(" ")[-1])
	
	
	
	loc_file.load("C:/Games/ddkg2.save")
	if str(loc_file.get_value("Locations","3rd")) == "1":
		$investigation_screen.Cur = 1




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
	loc_file.set_value("Locations","3rd","1")
	loc_file.save("C:/Games/ddkg2.save")
