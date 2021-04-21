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
		"5 октября, 12:00. Номер 222с. G",
		"Тёмыч: хрр... W",
		"Егорыч: Тьоха, вставай, уже 12 часов.",
		"Пошли гулять.",
		"Тёмыч: (...задрал уже) B",
		"Егорыч: Тьохааа W",
		"Тёмыч: *неразборчиво* иди в жопу...",
		"Егорыч: Тьохааааа",
		"Тёмыч: ...",
		"Егорыч: ТЬОХА ВСТАВАЙ ПОТОЛОК ПАДАЕТ!!!!11 R",
		"Тёмыч: Аааа Егогорыч да ты задрал уже чертила ааааАААА. W",
		"Егорыч: Бывает...",
		"MAIN",
		"Тёмыч: Зеркало.", # 14
		"Хмм, странно.",
		"Я вижу в этом зеркале восхитительного адвоката",
		"Умного программиста",
		"Талантливого физика",
		"И крутого поцыка.",
		"Егорыч: Но ведь в зеркале всего лишь ты.",
		"Тёмыч: Ооо, а польщен, Егогорыч, весьма польщен.",
		"Егорыч: А не какого-то там адвоката или еще кого-то",
		"Тёмыч: ...",
		"(Встретимся в суде) B",
		"EXAM",
		"Тёмыч: Я бы еще поспал,", # 26
		"Но этот Ирод окаянный мне не позволит",
		"Егорыч: Ооо, будь уверен, Тьоха, я тебе точно не позволю",
		"Тёмыч: Ух, Егогорыч, желаю тебе когда нибудь не выспаться",
		"И чтоб тебя разбудили в 12 часов утра",
		"Егорыч: ...",
		"EXAM",
		"Тёмыч: Егорыч, к оружию!", # 33
		"Егорыч: Зачем?",
		"Тёмыч: Кто знает, что прячется за этой дверью?",
		"Егорыч: ...А что там может прятаться?",
		"Тёмыч: Ну, не знаю, но всё же",
		"Застанем его врасплох пока оно нас не застал врасплох!",
		"Егорыч: ...А может просто не будем открывать этот портал в ад?",
		"Тёмыч: Ух, скучный ты человек, Егогорыч...",
		"(...Какие секреты он прячет за этой дверью?) B",
		"EXAM",
		"Тёмыч: Егогорыч, чем займемся?", # 43, "Идеи?"
		"Егорыч: В подсопке, где было заседание, есть швабры и веники",
		"Тёмыч: О-хо-хох-хох-хо!!!",
		"Егорыч: Способность хохотать - не признак владения веником",
		"Тёмыч: Выше гордость - больнее провал!",
		"Егорыч: О, тут и начинается веселье...!",
		"Тёмыч: Всё кончено, Егорыч, я стою выше тебя!",
		"Егорыч: Ты недооцениваешь мою мощь...!",
		"Тёмыч: Не пытайся...!",
		"Егорыч: ... Че мы вообще творим?",
		"CHAT",
		"Егорыч: Я жрать хочу.",
		"Тёмыч: Как я тебя понимаю...",
		"Шо, в столовку тогда пойдём?",
		"Егорыч: Ну, хотя бы в направлении столовки",
		"Тёмыч: Ну пошли, тогда уж",
		"(Интересно, у них пельмени есть?)",
		"CHAT",
		"Тёмыч: Егогорыч, зырь",
		"Егорыч: Зырю, И?",
		"Тёмыч: И?",
		"Егорыч: Давай ближе к делу, а?",
		"Тёмыч: ...Как бы то ни было.",
		"MAIN",
		""
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
	Music = [
		"",
		"6 октября, 12:00. Номер 222с. G",
		"START peaceful_day",
		"Егорыч: Тьоха, вставай, уже 12 часов.",
		"Пошли гулять.",
		"Тёмыч: (...задрал уже) B",
		"Егорыч: Тьохааа W",
		"Тёмыч: *неразборчиво* иди в жопу...",
		"Егорыч: Тьохааааа",
		"Тёмыч: ...",
		"Егорыч: ТЬОХА ВСТАВАЙ ПОТОЛОК ПАДАЕТ!!!!11 R",
		"Тёмыч: Аааа Егогорыч да ты задрал уже чертила ааааАААА. W",
		"Егорыч: Бывает...",
		"START peaceful_day",
		"Тёмыч: Зеркало.", # 14
		"Хмм, странно.",
		"Я вижу в этом зеркале восхитительного адвоката",
		"Умного программиста",
		"Талантливого физика",
		"И крутого поцыка.",
		"Егорыч: Но ведь в зеркале всего лишь ты.",
		"Тёмыч: Ооо, а польщен, Егогорыч, весьма польщен.",
		"Егорыч: А не какого-то там адвоката или еще кого-то",
		"Тёмыч: ...",
		"(Встретимся в суде) B",
		"EXAM",
		"Тёмыч: Я бы еще поспал,", # 26
		"Но этот Ирод окаянный мне не позволит",
		"Егорыч: Ооо, будь уверен, Тьоха, я тебе точно не позволю",
		"Тёмыч: Ух, Егогорыч, желаю тебе когда нибудь не выспаться",
		"И чтоб тебя разбудили в 12 часов утра",
		"Егорыч: ...",
		"EXAM",
		"Тёмыч: Егорыч, к оружию!", # 33
		"Егорыч: Зачем?",
		"Тёмыч: Кто знает, что прячется за этой дверью?",
		"Егорыч: ...А что там может прятаться?",
		"Тёмыч: Ну, не знаю, но всё же",
		"Застанем его врасплох пока оно нас не застал врасплох!",
		"Егорыч: ...А может просто не будем открывать этот портал в ад?",
		"Тёмыч: Ух, скучный ты человек, Егогорыч...",
		"(...Какие секреты он прячет за этой дверью?) B",
		"EXAM",
		"Тёмыч: Егогорыч, чем займемся?", # 43, "Идеи?"
		"Егорыч: В подсопке, где было заседание, есть швабры и веники",
		"Тёмыч: О-хо-хох-хох-хо!!!",
		"Егорыч: Способность хохотать - не признак владения веником",
		"Тёмыч: Выше гордость - больнее провал!",
		"Егорыч: О, тут и начинается веселье...!",
		"Тёмыч: Всё кончено, Егорыч, я стою выше тебя!",
		"Егорыч: Ты недооцениваешь мою мощь...!",
		"Тёмыч: Не пытайся...!",
		"Егорыч: ... Че мы вообще творим?",
		"CHAT",
		"Егорыч: Я жрать хочу.",
		"Тёмыч: Как я тебя понимаю...",
		"Шо, в столовку тогда пойдём?",
		"Егорыч: Ну, хотя бы в направлении столовки",
		"Тёмыч: Ну пошли, тогда уж",
		"(Интересно, у них пельмени есть?)",
		"CHAT",
		"Тёмыч: Егогорыч, зырь",
		"Егорыч: Зырю, И?",
		"Тёмыч: И?",
		"Егорыч: Давай ближе к делу, а?",
		"Тёмыч: ...Как бы то ни было.",
		"MAIN",
		""
	]
	Shows = [ # массив, в котором первое слово - улика, а 2 - номер строки, на который перекинет игрока, если ее показать
		"badge 61",
	]
	Anims = [ # массив, в котором 1 слово это перс, а 2 - его анимка
		"",
		"6 октября, 12:00. Номер 222с. G",
		"Тёмыч: хрр... W",
		"character_egorich laugh Егорыч: Тьоха, вставай, уже 12 часов.",
		"character_egorich suspects Пошли гулять.",
		"Тёмыч: (...задрал уже) B",
		"character_egorich idk Егорыч: Тьохааа W",
		"character_egorich sigh Тёмыч: *неразборчиво* иди в жопу...",
		"character_egorich default Егорыч: Тьохааааа",
		"Тёмыч: ...",
		"character_egorich laugh Егорыч: ТЬОХА ВСТАВАЙ ПОТОЛОК ПАДАЕТ!!!!11 R",
		"Тёмыч: Аааа Егогорыч да ты задрал уже чертила ааааАААА. W",
		"Егорыч: Бывает...",
		"MAIN",
		"Тёмыч: Зеркало.", # 14
		"Хмм, странно.",
		"Я вижу в этом зеркале восхитительного адвоката",
		"Умного программиста",
		"Талантливого физика",
		"И крутого поцыка.",
		"character_egorich suspects Егорыч: Но ведь в зеркале всего лишь ты.",
		"Тёмыч: Ооо, а польщен, Егогорыч, весьма польщен.",
		"character_egorich yee Егорыч: А не какого-то там адвоката или еще кого-то",
		"Тёмыч: ...",
		"(Встретимся в суде) B",
		"EXAM",
		"Тёмыч: Я бы еще поспал,", # 26
		"Но этот Ирод окаянный мне не позволит",
		"character_egorich default Егорыч: Ооо, будь уверен, Тьоха, я тебе точно не позволю",
		"Тёмыч: Ух, Егогорыч, желаю тебе когда нибудь не выспаться",
		"И чтоб тебя разбудили в 12 часов утра",
		"Егорыч: ...",
		"EXAM",
		"Тёмыч: Егорыч, к оружию!", # 33
		"character_egorich thinks Егорыч: Зачем?",
		"Тёмыч: Кто знает, что прячется за этой дверью?",
		"Егорыч: ...А что там может прятаться?",
		"Тёмыч: Ну, не знаю, но всё же",
		"Застанем его врасплох пока оно нас не застал врасплох!",
		"character_egorich suspects Егорыч: ...А может просто не будем открывать этот портал в ад?",
		"Тёмыч: Ух, скучный ты человек, Егогорыч...",
		"character_egorich idk (...Какие секреты он прячет за этой дверью?) B",
		"EXAM",
		"Тёмыч: Егогорыч, чем займемся?", # 43, "Идеи?"
		"Егорыч: В подсопке, где было заседание, есть швабры и веники",
		"character_egorich yee Тёмыч: О-хо-хох-хох-хо!!!",
		"character_egorich suspects Егорыч: Способность хохотать - не признак владения веником",
		"Тёмыч: Выше гордость - больнее провал!",
		"character_egorich laugh Егорыч: О, тут и начинается веселье...!",
		"Тёмыч: Всё кончено, Егорыч, я стою выше тебя!",
		"Егорыч: Ты недооцениваешь мою мощь...!",
		"Тёмыч: Не пытайся...!",
		"character_egorich idk Егорыч: ... Че мы вообще творим?",
		"CHAT",
		"character_egorich suspects Егорыч: Я жрать хочу.",
		"Тёмыч: Как я тебя понимаю...",
		"Шо, в столовку тогда пойдём?",
		"character_egorich thinks Егорыч: Ну, хотя бы в направлении столовки",
		"Тёмыч: Ну пошли, тогда уж",
		"(Интересно, у них пельмени есть?)",
		"CHAT",
		"Тёмыч: Егогорыч, зырь", # 61
		"character_egorich suspects Егорыч: Зырю, И?",
		"Тёмыч: И?",
		"character_egorich idk Егорыч: Давай ближе к делу, а?",
		"Тёмыч: ...Как бы то ни было.",
		"MAIN",
		""
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
	if str(loc_file.get_value("Locations","1st")) == "1":
		$investigation_screen.Cur = 12

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
	loc_file.set_value("Locations","1st","1")
	loc_file.save("C:/Games/ddkg2.save")
