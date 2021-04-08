extends Node2D
var Dialogue
var Chats
var Shows
func _ready():
	Dialogue = [
		"0",
		"1",
		"2",
		"3",
		"MAIN",
		"PLIT Tak Nie 1 2",
		"", # 6
		"JUMP 2",
		"7",
		"8",
	]
	Chats = [
		"Привет  2",
		"Пока  4",
		"",
		"",
	]
	Shows = [
		"badge 2",
		"",
	]
	if Chats[0] != "":
		$chat_1.text = Chats[0].left(Chats[0].length()-3)
	if Chats[1] != "":
		$chat_2.text = Chats[1].left(Chats[1].length()-3)
	if Chats[2] != "":
		$chat_3.text = Chats[2].left(Chats[2].length()-3)
	if Chats[3] != "":
		$chat_4.text = Chats[3].left(Chats[3].length()-3)
	print(Chats[0].split(" ")[-1])
# 1) цвет, MOV-слова срабатывают мгновенно
# 2) SPLIT, JUMP срабатывают раньше на 1 реплику. Текст перед JUMP лучше сделать
# пустым
# 3) чтобы прыгнуть на N-ную строку, надо из номера строки в редакторе
# вычесть 8



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
