extends Node2D
var Anims
var Dialogue
var Chats
var Shows
var Moves
var Music
var EvCount
var loc_file = ConfigFile.new()
func _ready():
	Dialogue = [ # диалоги. 
		"",
		"5 октября. 30 минут до школьного суда. G",
		"Тёмыч: (Та где её носит?) B",
		"... W",
		"Да вот ты где, ё-маё...",
		"Соня: ...",
		"Тёмыч: (Я её искал почти пол часа) B",
		"(Просто чтобы дать ей *это*)",
		"Соня: ... W",
		"Тёмыч: Держи.",
		"Соня: ...",
		"Тёмыч: Что смотришь?",
		"Соня: ...",
		"Тёмыч: Это заколка.",
		"Соня: ...",
		"Тёмыч: Необычная, именно.",
		"Соня: ...",
		"Тёмыч: Необычность в том, что она оборудована электродами",
		"Соня: ...",
		"Тёмыч: Да, электродами. Они принимают нервные импульсы из головы",
		"Центра речи",
		"Ну и, вкратце, позволяют говорить силой мысли",
		"Соня: ...",
		"Тёмыч: Зачем? Ну, для того, чтобы Егорыч подсказывал строчки из стихотворения по укр лит",
		"Соня: ...",
		"Тёмыч: А, зачем *тебе*?",
		"(...Я же правильно угадываю, что она говорит?) B",
		"(Очень тяжело читать мысли без третего глаза)",
		"Ну, чтобы ты могла говорить на заседании W",
		"Просто, лично я не знаю языка жестов.",
		"И мысли читать не умею, если честно",
		"Соня: ...",
		"Тёмыч: (Ого, она взяла...) B",
		"Соня: ... W",
		"Тёмыч: (Главное, чтобы оно не коротнуло у неё на голове, как у Егорыча год назад) B",
		"(Я, конечно, работал потом над ним, но всё же...)",
		"(Я, когда подсказывал 'Заповіт' Егорычу, чуть его там и не контузил...)",
		"Соня: ... W",
		"Привет Y",
		"Тёмыч: О, оно работает. W",
		"Очень хорошо...",
		"Дарю, у меня всё равно есть второе",
		"Соня: ...",
		"Тёмыч: Ладно, увидимся",
		"(...Она совсем не агрессивная и не настолько закрытая, как мне говорили) B",
		"(И она меня не отшила во второй раз. Везет мне...)",
		"(Посмотрим, как все выйдет сегодня...)",
		"OUT res://scenes/case_2/day1-day2_transition.tscn",
		"",
	]
	Anims = [
		"",
		"5 октября. 30 минут до школьного суда. G",
		"character_sonya death Тёмыч: (Та где её носит?) B",
		"... W",
		"Да вот ты где, ё-маё...",
		"character_sonya SHOW Соня: ...",
		"Тёмыч: (Я её искал почти пол часа) B",
		"(Просто чтобы дать ей *это*)",
		"Соня: ... W",
		"Тёмыч: Держи.",
		"Соня: ...",
		"Тёмыч: Что смотришь?",
		"Соня: ...",
		"Тёмыч: Это заколка.",
		"Соня: ...",
		"Тёмыч: Необычная, именно.",
		"Соня: ...",
		"Тёмыч: Необычность в том, что она оборудована электродами",
		"Соня: ...",
		"Тёмыч: Да, электродами. Они принимают нервные импульсы из головы",
		"Центра речи",
		"Ну и, вкратце, позволяют говорить силой мысли",
		"Соня: ...",
		"Тёмыч: Зачем? Ну, для того, чтобы Егорыч подсказывал строчки из стихотворения по укр лит",
		"Соня: ...",
		"Тёмыч: А, зачем *тебе*?",
		"(...Я же правильно угадываю, что она говорит?) B",
		"(Очень тяжело читать мысли без третего глаза)",
		"Ну, чтобы ты могла говорить на заседании W",
		"Просто, лично я не знаю языка жестов.",
		"И мысли читать не умею, если честно",
		"Соня: ...",
		"Тёмыч: (Ого, она взяла...) B",
		"Соня: ... W",
		"Тёмыч: (Главное, чтобы оно не коротнуло у неё на голове, как у Егорыча год назад) B",
		"(Я, конечно, работал потом над ним, но всё же...)",
		"(Я, когда подсказывал 'Заповіт' Егорычу, чуть его там и не контузил...)",
		"Соня: ... W",
		"character_sonya default Привет Y",
		"Тёмыч: О, оно работает. W",
		"Очень хорошо...",
		"Дарю, у меня всё равно есть второе",
		"Соня: ...",
		"Тёмыч: Ладно, увидимся",
		"(...Она совсем не агрессивная и не настолько закрытая, как мне говорили) B",
		"(И она меня не отшила во второй раз. Везет мне...)",
		"(Посмотрим, как все выйдет сегодня...)",
		"OUT ",
		"",
	]
	Music = [
		"",
		"5 октября. 30 минут до школьного суда. G",
		"Тёмыч: (Та где её носит?) B",
		"... W",
		"Да вот ты где, ё-маё...",
		"Соня: ...",
		"Тёмыч: (Я её искал почти пол часа) B",
		"(Просто чтобы дать ей *это*)",
		"Соня: ... W",
		"Тёмыч: Держи.",
		"Соня: ...",
		"Тёмыч: Что смотришь?",
		"Соня: ...",
		"Тёмыч: Это заколка.",
		"Соня: ...",
		"Тёмыч: Необычная, именно.",
		"Соня: ...",
		"Тёмыч: Необычность в том, что она оборудована электродами",
		"Соня: ...",
		"Тёмыч: Да, электродами. Они принимают нервные импульсы из головы",
		"Центра речи",
		"Ну и, вкратце, позволяют говорить силой мысли",
		"Соня: ...",
		"Тёмыч: Зачем? Ну, для того, чтобы Егорыч подсказывал строчки из стихотворения по укр лит",
		"Соня: ...",
		"Тёмыч: А, зачем *тебе*?",
		"(...Я же правильно угадываю, что она говорит?) B",
		"(Очень тяжело читать мысли без третего глаза)",
		"Ну, чтобы ты могла говорить на заседании W",
		"Просто, лично я не знаю языка жестов.",
		"И мысли читать не умею, если честно",
		"Соня: ...",
		"Тёмыч: (Ого, она взяла...) B",
		"Соня: ... W",
		"Тёмыч: (Главное, чтобы оно не коротнуло у неё на голове, как у Егорыча год назад) B",
		"(Я, конечно, работал потом над ним, но всё же...)",
		"(Я, когда подсказывал 'Заповіт' Егорычу, чуть его там и не контузил...)",
		"Соня: ... W",
		"Привет Y",
		"Тёмыч: О, оно работает. W",
		"Очень хорошо...",
		"Дарю, у меня всё равно есть второе",
		"Соня: ...",
		"Тёмыч: Ладно, увидимся",
		"(...Она совсем не агрессивная и не настолько закрытая, как мне говорили) B",
		"(И она меня не отшила во второй раз. Везет мне...)",
		"(Посмотрим, как все выйдет сегодня...)",
		"OUT ",
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
	loc_file.load(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
	for i in range(1,4):
		if Chats[i-1] != "":
			get_node("chat_"+str(i)).text = Chats[i-1].left(Chats[i-1].length()-3)
	for i in range(1,4):
		if Moves[i-1] != "":
			get_node("move_"+str(i)).text = Moves[i-1].left(Moves[i-1].length()-Moves[i-1].split(" ")[-1].length())
	print(Chats[0].split(" ")[-1])
	
	

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
	loc_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
