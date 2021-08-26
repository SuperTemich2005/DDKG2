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
		"6 октября. 10:00. Перед отелем|G|---|---|---", #"Проверка провалена|R|character_masha hey|START omen|REACT damage",
		"Тёмыч: (Сегодня такой пасмурный день...)|B|---|---|---",
		"(Еще нагнетают тучи... Не удивлюсь, если сегодня польёт, как из ведра.)|B",
		"Егорыч: Тьоха, здравствуй.|W|character_egorich laugh|START egor_theme|---",
		"Тёмыч: ДО СВИДАНИЯ!|R|character_egorich all_of_sudden|---|REACT slam|",
		"Егорыч: Смешно...|W|character_egorich suspects|---|REACT frustration",
		"MAIN",
		"Егорыч: Тьоха, ты знаешь, куда нас понесут?|W|character_egorich thinks|---|---",
		"Тёмыч: Я абсолютно без понятия. Серьезно.|W|---|---|---",
		"Типа, я думаю, что еще до отъезда, Лентольна нам говорила...|W|---|---|---",
		"Может, в вайбере писала...|W|---|---|---",
		"Егорыч: Думаешь?|W|character_egorich suspects|---|---",
		"Тёмыч: Ну, Лентольна не стала бы говорить такая типа|W|---|---|---",
		"'Эй, лошары, по три тыщи каждый сдал и по коням - в народные еб'-- кхм, ну ты понял.|W|character_egorich thinks|---|---",
		"Егорыч: Согласен, как-то странно было бы.|W|character_egorich yee|---|---",
		"Тёмыч: (...Если бы я был учителем, то я бы так и сделал, да и к тому же никого бы никуда не повез.)|B|character_egorich suspects|---|---",
		"(И никто бы мне ничего не сделал.)|B|---|---|---",
		"Егорыч: Насколько мне известно, поездка может длиться до пяти часов.|W|character_egorich thinks|---|---",
		"Тёмыч: Львов, Умань, ммм, Черновцы...|W",
		"Неужели, мы переезжаем в другой город?|W",
		"Егорыч: Объяснило бы тот факт, что нас попросили собрать с собой все вещи и выселиться.|W",
		"MAIN",
		"Егорыч: Тьоха--|W|character_egorich default|---|---",
		"Тёмыч: Когда я хочу что-то спросить,|W|character_egorich all_of_sudden|---|---",
		"Ты спрашиваешь конкретно этот самый вопрос|W|---|---|---",
		"Но первый.|W|character_egorich suspects|---|---",
		"Егорыч: ...Бывает.|W|character_egorich shrug|---|---",
		"Так вот, Тьоха, чем ты будешь щас заниматься?|W|character_egorich thinks|---|---",
		"Тёмыч: Ну, у меня до сих пор не пройден адвокат.|W|character_egorich yee|---|---",
		"По этому я могу провести значительную часть времени за свитчой.|W",
		"Егорыч: Ясно...|W|character_egorich suspects|---|---",
		"Я же буду читать статью про боснийскую артиллерию|W|character_egorich yee|---|---",
		"Тёмыч: (АРТИЛЛЕРИЯ!)|B",
		"(Нагоняет воспоминания...)|B",
		"MAIN",
		"Егорыч: В планах было сидеть с тобой, ибо я почти никого из нашей 'экспедиционной группы' не знаю|W|character_egorich thinks|---|---",
		"Тёмыч: Как скажешь.|W",
		"Егорыч: Можно обсудить множество планов|W|character_egorich yee|---|---",
		"Тактик в ВМКГ|W",
		"И прочего|W|character_egorich default|---|---",
		"Тёмыч: Не спорю|W",
		"Можно обсудить кейсы еще, наверное...|W",
		"Егорыч: Угу...|W|character_egorich thinks|---|---",
		"Е. Анатольевна: Дети, загружаемся.|W|character_egorich all_of_sudden|STOP|REACT surprise",
		"Чемоданы в багажник, сами - в салон.|W|character_egorich thinks|---|---",
		"Мы едем во Львов, надеюсь, вы в номерах ничего не забыли.|W",
		"В. Юрьевна: Мой класс садится на правую сторону, класс Текуцкой - на левый!|W",
		"Егорыч: Ух, потопали...|W|character_egorich shrug|---|---",
		"OUT res://scenes/case_3/invest_1/atrain_day1.tscn",
		"",
	]
	
# СУКА БЛЯТЬ НЕ ТРОГАЙ ЭТО ГАНДОН НЕДОШТОПАННЫЙ АААААААААААААААААААААААА!!!!!!!!!!!!!!!!!!!!!!!
	loc_file.load("C:/Games/ddkg2.save")
	Chats = [
		"Куда нас везут  8",
		"Что ты будешь делать  23",
		"С кем сядешь 36",
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
	loc_file.set_value("Evidence","1","badge:Значок дежурного, у каждого свой номер. Мой - 13. В отличии от Тьохи, я всего лишь помощник адвоката")
	loc_file.save("C:/Games/ddkg2.save")
	
