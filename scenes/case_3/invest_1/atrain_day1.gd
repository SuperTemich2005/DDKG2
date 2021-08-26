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
func _ready():
	Dialogue = [ # диалоги. 
		"",
		"6 октября. 10:30. В поезде|G|---|---|---", #"Проверка провалена|R|character_masha hey|START omen|REACT damage",
		"Егорыч: (Меня зовут Ищенко Егор, я - Тьохин друг с 5-го класса...)|B",
		"(Сейчас мы на школьной экскурсии по западной Украине.)|B",
		"(Едем из Винницы, где мы пробыли где-то два дня, во Львов.)|B",
		"(Тьоха... вышел в аут.)|B",
		"*БУМ*|R",
		"Егорыч: Ч-Что?!|W",
		"Что это было?!",
		"*скрип двери*|R",
		"Тёмыч: Егогорыч, эти двери скрипят громче, чем мои суставы после двух алгебр|W|character_temich comeon|---|---",
		"Егорыч: Тьоха, что это было? Поезд нехило тряхнуло...|W",
		"Тёмыч: Когда я выбрасывал фантики в тамбуре, в толкан зашел Гордон Фриман|W|character_temich wonder|---|---",
		"Егорыч: Гордон Фримэн?|W",
		"Тёмыч: Потому что с мотыгой.|W|character_temich kekk|---|---",
		"Эээ, не, точнее, с монтировкой, кхм.|W",
		"Егорыч: Кто-то зашел в туалет с монтировкой?|W",
		"Тёмыч: Да. И этот кто-то, видимо, вбросил монтировку в толкан|W",
		"Чуть не отправив нас в Зен|W",
		"Егорыч: (Ну и ну, чего только люди не придумают, лишь бы подвергнуть других опасности.)|B",
		"MAIN",
		"Егорыч: Тьоха, че ты там делаешь?|W|character_temich default|---|---", # 21 ноут
		"Тёмыч: Я делаю сверхкрутую программу по взлому пентагона|W|character_temich kekk|---|---",
		"Егорыч: А если серьезно?",
		"Тёмыч: ...",
		"if(output == 'a'){",
		"return 'a';",
		"}elseif(output == 'b'){",
		"return 'b';",
		"}elseif...",
		"Егорыч: Эмм, я не понимаю?",
		"Тёмыч: Я делаю игру шестой год и пока что в ней есть только базовые механики|W|character_temich thonker|---|---",
		"Хочу стать богатым и известным|W|character_temich yee|---|---",
		"Егорыч: Я слабо представляю как это возможно",
		"Тёмыч: Один человек так уже сделал|W|character_temich wonder|---|---",
		"Так что у меня есть все шансы",
		"Егорыч: (Ну и ну.)|B",
		"MAIN",
		"Егорыч: У! Внезапная кража чипсов!|W|character_temich default|---|REACT surprise", # 38 еда
		"Тёмыч: ...|W|character_temich deskslam|---|REACT slam",
		"Егорыч: Ну, или...",
		"Тёмыч: Конечно, бери!|W|character_temich kekk|---|---",
		"Егорыч: Эээ, да, спасибо...",
		"(Тьоха со своими приколами)|B",
		"(Доприкалывается)|B|character_temich wonder|---|---",
		"Тёмыч: *буль буль буль буль буль*|R",
		"Пока Ироды Окаяные пьют пиво|W|character_temich kekk|---|---",
		"Адвокат от 8-В Тьоха бухает квасом.|W|character_temich yee|---|---",
		"MAIN",
		"Егорыч: Кто на полке спать будет?|W|character_temich thonker|---|---", # 49 полка
		"Тёмыч: Ну, я собирался спать на полке, а не на полу.|W|character_temich kekk|---|---",
		"Егорыч: Я имею ввиду, на верхнюю полку кто полезет? Я уже был на верхней полке, так что твоя очередь.",
		"Тёмыч: Окц.|W|character_temich default|---|---",
		"Егорыч: Хм? Ты быстро сдался...",
		"(Не к добру это)|B",
		"Тёмыч: *лезет*|R|character_temich HIDE|---|---",
		"Егорыч: Тьоха? Тебе там норм?|W",
		"Тёмыч: Эхехехехехехеххехехеехе",
		"Егорыч: Э! Э! Э! Куда ты меня тащишь?!",
		"ААА!",
		"АПУТИ!!!",
		"Тёмыч: Это я гравитационное поле создал вокруг себя своим весом|W|character_temich HIDE|---|REACT surprose",
		"Ух.|W|character_temich kekk|---|REACT frustration",
		"Егорыч: А с другой стороны, мы же через пару часов приедем, где-то вечером уже...",
		"Не стоит делить полок пока что.",
		"Тёмыч: Мало нас как-то, раз уж эта 'ячейка' свободна|W|character_temich thonker|---|REACT frustration",
		"",
	]
	
# СУКА БЛЯТЬ НЕ ТРОГАЙ ЭТО ГАНДОН НЕДОШТОПАННЫЙ АААААААААААААААААААААААА!!!!!!!!!!!!!!!!!!!!!!!
	loc_file.load("C:/Games/ddkg2.save")
	Chats = [
		"",
		"",
		"",
		"",
	]
	Moves = [
		"",
		"",
		"",
		"",
	]
	for i in range(1,4):
		if Chats[i-1] != "":
			get_node("chat_"+str(i)).text = Chats[i-1].left(Chats[i-1].length()-3)
	for i in range(1,4):
		if Moves[i-1] != "":
			get_node("move_"+str(i)).text = Moves[i-1].left(Moves[i-1].length()-Moves[i-1].split(" ")[-1].length())
	print(Chats[0].split(" ")[-1])
	$investigation_screen/frame_record/record_theme.color = Color(0,1,0)

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
