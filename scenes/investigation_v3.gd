extends Node2D
# WHY DO I HAVE TO DO DIS(((((((

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Cur # defines current line
var State # defines current state, next button's props depend on it mostly. # Valid states are 'Def', 'Rec1', 'Rec2', 'Choice', 'Inv', 'Main', 'Chat', 'Move'
var ShowChars # for char-to-char printing
var save_file = ConfigFile.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	Cur = 0
	ShowChars = 0
	State = "Dialogue"
	save_file.load("C:/Games/ddkg2.save")
	save_file.set_value("Locations","Last",get_parent().filename)
	save_file.set_value("Locations",get_parent().filename,"1")
	save_file.save("C:/Games/ddkg2.save")


func refresh():
	for i in range(1,5):
		if get_parent().Chats[i-1] != "":
			$Chat.get_child(i).text = get_parent().Chats[i-1].split(";")[0]
			$Chat.get_child(i).show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Choices_pressed():
	if State == "Choice":
		for i in $Choices.get_children():
			if i.pressed:
				Cur = int(get_parent().Dialogue[Cur].split("|")[5].split(";")[i].split(":")[1])-1
		State = "Dialogue"
		_on_Next_pressed()


func _on_Next_pressed():
	Cur+=1
	ShowChars = 0
	$show_cell.hide()
	if get_parent().Dialogue[Cur] != "MAIN" and get_parent().Dialogue[Cur].split(" ")[0] != "JUMP":
		if get_parent().Dialogue[Cur].split("|").size() >= 2: # has color def
			print("Repaint")
			var col = Color(1,1,1,1)
			match get_parent().Dialogue[Cur].split("|")[1]:
				"W":
					col = Color(1,1,1,1)
				"R":
					col = Color(1,0.5,0.5,1)
				"B":
					col = Color(0.5,0.5,1,1)
				"G":
					col = Color(0.5,1,0.5,1)
				"Y":
					col = Color(1,1,0.5,1)
				"P":
					col = Color(1,0.5,1,1)
				_:
					col = Color(1,1,1,1)
			$BG/text_color.color = col
			if get_parent().Dialogue[Cur].split("|").size() >= 3: # has animation def
				if get_parent().Dialogue[Cur].split("|")[2] != "---":
					print("Reanim")
					for i in get_parent().get_node("characters_all").get_children():
						i.hide()
						print("hid ",i.name)
					var target = get_parent().get_node("characters_all/"+get_parent().Dialogue[Cur].split("|")[2].split(" ")[0])
					print(target.name)
					if get_parent().Dialogue[Cur].split("|")[2].split(" ")[1] != "HIDE":
						target.get_node("sprite").animation = get_parent().Dialogue[Cur].split("|")[2].split(" ")[1]
						target.show()
					else:
						target.hide()
				if get_parent().Dialogue[Cur].split("|").size() >= 4:
					if get_parent().Dialogue[Cur].split("|")[3] != "---":
						if get_parent().Dialogue[Cur].split("|")[3].split(" ")[0] == "START":
							$AudioStreamPlayer.set_stream(load("res://sounds/"+get_parent().Dialogue[Cur].split("|")[3].split(" ")[1]+".ogg"))
							$AudioStreamPlayer.play()
						else:
							$AudioStreamPlayer.stop()
					if get_parent().Dialogue[Cur].split("|").size() >= 5:
						if get_parent().Dialogue[Cur].split("|")[4] != "---":
							if get_parent().Dialogue[Cur].split("|")[4].split(" ")[0] == "REACT":
								$AudioStreamPlayer2.set_stream(load("res://sounds/"+get_parent().Dialogue[Cur].split("|")[4].split(" ")[1]+".ogg"))
								$AudioStreamPlayer2.play()
						if get_parent().Dialogue[Cur].split("|").size() >= 6: # split, highlight evidence
							if get_parent().Dialogue[Cur].split("|")[5] != "---":
								if get_parent().Dialogue[Cur].split("|")[5].split(";")[0] == "split":
									State = "Choice"
									$Next.hide()
									$Choices.show()
									for i in range(1,get_parent().Dialogue[Cur].split("|")[5].split(";").size()+1):
										$Choices.get_child(i).show()
										$Choices.get_child(i).text = get_parent().Dialogue[Cur].split("|")[5].split(";")[i].split(":")[0]
								if get_parent().Dialogue[Cur].split("|")[5].split(" ")[0] == "show":
									$show_cell.animation = get_parent().Dialogue[Cur].split("|")[5].split(" ")[1]
									$show_cell.show()
									# 0Text|1Color|2Anim|3BGM|4React|5split;choice1:goto1;choice2:goto2;choice3:goto3
								if get_parent().Dialogue[Cur].split("|")[5].left(3) == "~~~":
									# 0Text|1Color|2Anim|3BGM|4React|5id|6nameint;desc;exp;ver
									save_file.set_value("Evidence",get_parent().Dialogue[Cur].split("|")[5],get_parent().Dialogue[Cur].split("|")[6])
									save_file.save("C:/Games/ddkg2.save")
	elif get_parent().Dialogue[Cur] == "MAIN":
		State = "Main"
		$BG.hide()
		$Next.hide()
		$Back.hide()
		$InvestigationButtons.show()
	elif get_parent().Dialogue[Cur].split(" ")[0] == "JUMP":
		Cur = int(get_parent().Dialogue[Cur].split(" ")[1])-1
		_on_Next_pressed()


func _input(event):
	if event is InputEventMouseMotion:
		$Crosshair.position = event.position


func _on_update_timeout():
	ShowChars = clamp(ShowChars+1,0,len(get_parent().Dialogue[Cur].split("|")[0]))
	$BG/DialogueBox.text = get_parent().Dialogue[Cur].split("|")[0].left(ShowChars)


func _on_Back_pressed():
	State = "Main"
	$InvestigationButtons.show()
	$Crosshair.hide()
	get_parent().get_node("characters_all").show()
	for i in range(1,5):
		get_parent().get_node("chat_"+str(i)).hide()
	$Chat.hide()


func _on_Investigate_pressed():
	State = "Inv"
	$InvestigationButtons.hide()
	$Crosshair.show()
	$Back.show()
	$BG.hide()
	get_parent().get_node("characters_all").hide()


func _on_Chat_pressed():
	State = "Chat"
	$InvestigationButtons.hide()
	$Chat.show()

func _on_Present_pressed():
	State = "Rec1"
	$InvestigationButtons.hide()


func _on_Move_pressed():
	State = "Move"
	$InvestigationButtons.hide()


func _on_Chats_pressed():
	if State == "Chat":
		for i in range(0,4):
			if $Chat.get_child(i).pressed:
				Cur = int(get_parent().Chats[i].split(";")[1])-1
		_on_Next_pressed()
		State = "Dialogue"
		$BG.show()
		$Next.show()
		$Chat.hide()
		$Back.hide()


func _on_First_timeout():
	refresh()
	save_file.set_value("Locations",str(get_parent().filename),"1")
	save_file.save("C:/Games/ddkg2.save")


func _on_Check_pressed():
	pass # Replace with function body.
