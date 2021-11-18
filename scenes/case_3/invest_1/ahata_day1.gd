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
func _ready():
	Dialogue = [ # диалоги. 
		"",
		"6 октября. 12:50. 'Пузатий пан' 1-й этаж.|G",
		"Жека: Я подсяду?|W|character_zheka default|START panhata_bgm|---",
		"Тёмыч: Триста лет, триста зим, Жека.|W|character_temich default|---|---",
		"Егорыч: Вы видитесь каждый день, так что твоё это 'триста лет' неуместно.|W|---|---|---",
		"Тёмыч: Как скажешь.|W|character_temich comeon|---|REACT frustration",
		"Жека: Быстро доехали, но на завтрак времени вообще не дали.|W|character_zheka bombit|---|---",
		"Тёмыч: Лично я в поезде успел захавать пачку чипсов, но это не то...|W|character_temich wonder|---|---",
		"Егорыч: (А еще конфеток, литр кваса, полкабана и лютефиск)|B",
		"???: Пацаны, я к вам.|W|character_temich HIDE|---|---",
		"Тёмыч: Ты ба, кто пришел - Тувок!|W|character_temich kekk|---|REACT surprise",
		"Радомир: 'Тувок'?|W|character_tuvok default|---|---",
		"Жека: А кто это?|W|character_zheka default|---|---",
		"Егорыч: Это свид--|W",
		"Тёмыч: Шпион Башима.|W|character_temich yee|---|REACT frustration",
		"Радомир: Я же сказал, что у меня не было выбора...|W|character_tuvok rage|---|---",
		"Тёмыч: И тем не менее, ты же понимаешь, что под нож чуть не попал человек, ни на кого не покушавшийся?|W|character_temich dadada|---|---",
		"Радомир: Не такая Маша Фильмонова добрая-хорошая, как ты думаешь!|W|character_tuvok rage|---|---",
		"Тёмыч: Как бы то ни было, Башим Дашкерин достаточно внушительный персонаж, чтобы его бояться. Я никого не о(б)суждаю здесь.|W|character_temich default|---|---",
		"Егорыч: Давайте мы просто закажем че-нить уже и за столом обсудим дела насущные.|W|character_tuvok default|---|---",
		"Тёмыч: Как скажешь, господин посредник", # 20
		"MAIN", # 21
		"Егорыч: Тьоха, возьми сотку, возьми мне котлетки с пюрешкой и хлеб.|W|character_temich comeon|---|---", # Обед, 22
		"Тёмыч: Беленький?|R|character_temich kekk|---|REACT surprise",
		"Егорыч: Да, можно беленький.|W|---|---|---",
		"Тёмыч: ... .|W|character_temich comeon|---|REACT slam",
		"Жека: Мне пожалуйста...|W|character_zheka default|---|---",
		"Макарошки какие-нибудь, котлету по-киевски еще давай.|W|character_zheka yee|---|---",
		"Радомир: Я дошик съел в поезде, мне лучше че-нить выпить.|W|character_tuvok hmm|---|---",
		"Егорыч: Да, в 'пузатом пане' еще, как мне известно, лимонада литр наливают в графин.|W|---|---|---",
		"Давайте вместе на литр лимонада скинемся по десятке|W|---|---|---",
		"Тёмыч: Скидывайтесь мне.|W|character_temich kekk|---|REACT surprise",
		"Егорыч: ('Скидывайтесь мне' значит, что сдача пойдет ему в карман. Эта же фраза также значит, что я не имею права раскрывать его план, иначе он призовёт Боцыка.)|B",
		"(Не дай бог он снова призовёт Боцыка...)|B|character_temich dadada|---|REACT frustration",
		"Тёмыч: Я пiшов.|W|character_temich default|---|---",
		"Егорыч: Эй, Тувок.|W|character_tuvok default|---|---",
		"Ой, то есть, Радомир|W|---|REACT damage",
		"Радомир: М?|W|character_tuvok hmm|---|REACT surprise",
		"Егорыч: А что ты знаешь про деле о школьницах?|W",
		"Радомир: Я не тот человек, с которым можно обсуждать школьниц.|W|character_tuvok surprise|---|---",
		"Да и можно ли вообще с кем-то обсуждать школьниц?|W",
		"Егорыч: Ты знаешь, о чём я говорю.|W",
		"Радомир: Нет, не знаю.|W",
		"Егорыч: Нет, знаешь.|W",
		"Радомир: ...|W|character_tuvok bored|STOP ALL|---",
		"...|W",
		"...|W",
		"И ты не будешь знать, если будешь прилюдно это обсуждать.|W|character_tuvok rage|---|REACT frustration",
		"Я не знаю, кто ты такой, что не знаешь Башима Дашкерина, но если он узнает, что ты знаешь, что мы знаем|W",
		"Никто больше ничего не будет знать.|W",
		"Можем встретиться позже за подробностями, у нас будет экскурсия в музее.|W",
		"Там я и расскажу, что знаю.|W",
		"Жека: ...О чем вы говорите?|W|character_zheka bombit|---|REACT surprise",
		"Тёмыч: Я хз, о чём вы говорите, но держите вашу жратву и жрите|W|character_temich default|---|---",
		"Егорыч: О, смотрите, это араб?|W|character_tuvok surprise|---|---",
	]
# СУКА БЛЯТЬ НЕ ТРОГАЙ ЭТО ГАНДОН НЕДОШТОПАННЫЙ АААААААААААААААААААААААА!!!!!!!!!!!!!!!!!!!!!!!
	loc_file.load("C:/Games/ddkg2.save")
	Chats = [
		"Обед 22",
		"Поездка",
		"Маша и Женя",
		"Новый год",
	]
	Moves = [
		"",
		"",
		"",
		"",
	]
	Shows = [
		"badge 287",
	]
	for i in range(1,5):
		if Chats[i-1] != "":
			get_node("chat_"+str(i)).text = Chats[i-1].left(Chats[i-1].length()-3)
	for i in range(1,5):
		if Moves[i-1] != "":
			get_node("move_"+str(i)).text = Moves[i-1].left(Moves[i-1].length()-Moves[i-1].split(" ")[-1].length())
	print(Chats[0].split(" ")[-1])
	$investigation_screen/frame_record/record_theme.color = Color(0.5,1,0.5)
	read_chats = [false,false,false,false]

func _on_chat_1_pressed():
	if $investigation_screen.State == "Chat" and Chats[0] != "":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int(Chats[0].split(" ")[-1])
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]
		read_chats[0] = true


func _on_chat_2_pressed():
	if $investigation_screen.State == "Chat" and Chats[1] != "":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int(Chats[1].split(" ")[-1])
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]
		read_chats[1] = true


func _on_chat_3_pressed():
	if $investigation_screen.State == "Chat" and Chats[2] != "":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int(Chats[2].split(" ")[-1])
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]
		read_chats[2] = true

func _on_chat_4_pressed():
	if $investigation_screen.State == "Chat" and Chats[3] != "":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int(Chats[3].split(" ")[-1])
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]
		read_chats[3] = true

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
