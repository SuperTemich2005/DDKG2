extends Node2D
# WHY DO I HAVE TO DO DIS(((((((

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Cur # defines current line
var State # defines current state, next button's props depend on it mostly. # Valid states are 'Def', 'Choice', 'Inv', 'Main', 'Chat', 'Move'
var StateCR # 'No', 'Rec1', 'Rec2'
var ShowChars # for char-to-char printing
var Selected
var ReadChats
var save_file = ConfigFile.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	Selected = 0
	Cur = 0
	ShowChars = 0
	State = "Dialogue"
	StateCR = "No"
	save_file.load("C:/Games/ddkg2.save")
	save_file.set_value("Locations","Last",get_parent().filename)
	save_file.set_value("Locations",get_parent().filename,"1")
	save_file.save("C:/Games/ddkg2.save")
	for i in range(1,len(save_file.get_section_keys("Evidence"))+1):
		get_node("CourtRecord/Cells/Image"+str(i)).animation = save_file.get_value("Evidence",str(i)).split(";")[0]


func refresh():
	if "BoxColor" in get_parent():
		$CourtRecord/ColorOverlay.color = Color(get_parent().BoxColor)
		$show_cell/color.color = Color(get_parent().BoxColor)
	else:
		$CourtRecord/ColorOverlay.color = Color(0.5,0.5,1,1)
		$show_cell/color.color = Color(0.5,0.5,1,1)
	for i in range(1,5):
		if get_parent().Chats[i-1] != "":
			$Chat.get_children()[i-1].text = get_parent().Chats[i-1].split(";")[0]
			$Chat.get_children()[i-1].show()
		if get_parent().Moves[i-1] != "":
			$Moves.get_children()[i-1].text = get_parent().Moves[i-1].split(";")[0]
			$Moves.get_children()[i-1].show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Choices_pressed():
	if State == "Choice":
		for i in range(0,len($Choices.get_children())):
			if $Choices.get_children()[i].pressed:
				Cur = int(get_parent().Dialogue[Cur].split("|")[5].split(";")[i+1].split(":")[1])-1
		State = "Dialogue"
		$Choices.hide()
		_on_Next_pressed()


func _on_Next_pressed():
	Cur+=1
	ShowChars = 0
	$show_cell.hide()
	if get_parent().Dialogue[Cur] != "MAIN" and get_parent().Dialogue[Cur].split(" ")[0] != "JUMP" and get_parent().Dialogue[Cur].split(" ")[0] != "OUT":
		if get_parent().Dialogue[Cur].split("|").size() >= 2: # has color def
			#print("Repaint")
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
					#print("Reanim")
					if get_parent().Dialogue[Cur].split("|")[2].split("_")[0] == "character":
						for i in get_parent().get_node("characters_all").get_children():
							i.hide()
							#print("hid ",i.name)
						var target = get_parent().get_node("characters_all/"+get_parent().Dialogue[Cur].split("|")[2].split(" ")[0])
						#print(target.name)
						if get_parent().Dialogue[Cur].split("|")[2].split(" ")[1] != "HIDE":
							target.get_node("sprite").animation = get_parent().Dialogue[Cur].split("|")[2].split(" ")[1]
							target.show()
						else:
							target.hide()
					else:
						get_parent().get_node("back_ground").animation = get_parent().Dialogue[Cur].split("|")[2]
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
							print("Split, highlight, add evidence")
							if get_parent().Dialogue[Cur].split("|")[5] != "---":
								if get_parent().Dialogue[Cur].split("|")[5].split(";")[0] == "split":
									State = "Choice"
									$Next.hide()
									$Choices.show()
									for i in range(1,get_parent().Dialogue[Cur].split("|")[5].split(";").size()):
										$Choices.get_children()[i-1].show()
										$Choices.get_children()[i-1].text = get_parent().Dialogue[Cur].split("|")[5].split(";")[i].split(":")[0]
								elif get_parent().Dialogue[Cur].split("|")[5].split(" ")[0] == "show":
									$show_cell/evidence.animation = get_parent().Dialogue[Cur].split("|")[5].split(" ")[1]
									$show_cell.show()
									# 0Text|1Color|2Anim|3BGM|4React|5split;choice1:goto1;choice2:goto2;choice3:goto3
								elif get_parent().Dialogue[Cur].split("|")[0].left(3) == "~~~":
									# 0Text|1Color|2Anim|3BGM|4React|5id|6nameint;desc;exp;ver
									save_file.load("C:/Games/ddkg2.save")
									print("Adding evidence")
									if save_file.get_value("Evidence",get_parent().Dialogue[Cur].split("|")[5],"-20;-20;-20;-20;-20").split(";")[-1] < get_parent().Dialogue[Cur].split("|")[5].split(";")[-1]:
										print("adding evidence id ",get_parent().Dialogue[Cur].split("|")[5],": ",get_parent().Dialogue[Cur].split("|")[6])
										save_file.set_value("Evidence",get_parent().Dialogue[Cur].split("|")[5],get_parent().Dialogue[Cur].split("|")[6])
										save_file.save("C:/Games/ddkg2.save")
	elif get_parent().Dialogue[Cur].split(" ")[0] == "OUT":
		get_tree().change_scene(get_parent().Dialogue[Cur].split(" ")[1])
	elif get_parent().Dialogue[Cur] == "MAIN":
		State = "Main"
		$BG.hide()
		$Next.hide()
		$Back.hide()
		$InvestigationButtons.show()
		var temp = 0
		for i in ReadChats:
			if i:
				temp += 1
		if temp == 4 and get_parent().check_for_read_chats:
			State = "Dialogue"
			$BG.show()
			$Next.show()
			$InvestigationButtons.hide()
			Cur = get_parent().goto_when_read-1
			_on_Next_pressed()
	elif get_parent().Dialogue[Cur].split(" ")[0] == "JUMP":
		Cur = int(get_parent().Dialogue[Cur].split(" ")[1])-1
		_on_Next_pressed()


func _input(event):
	if event is InputEventMouseMotion:
		$Crosshair.position = event.position
	if event is InputEventMouseButton:
		if StateCR == "Rec1":
			#print("mouse pressed")
			for i in range(1,len(save_file.get_section_keys("Evidence"))+1):
				if get_node("CourtRecord/BG/Cell"+str(i)).get_global_rect().has_point(event.position):
					Selected = i
					#print(i)
					$CourtRecord/Viewport.animation = get_node("CourtRecord/Cells/Image"+str(i)).animation
					$CourtRecord/Name.text = save_file.get_value("Evidence",str(i)).split(";")[1]
					$CourtRecord/Desc.text = save_file.get_value("Evidence",str(i)).split(";")[2]
					$CourtRecord/Expand.text = save_file.get_value("Evidence",str(i)).split(";")[3]


func _on_update_timeout():
	ShowChars = clamp(ShowChars+1,0,len(get_parent().Dialogue[Cur].split("|")[0]))
	$BG/DialogueBox.text = get_parent().Dialogue[Cur].split("|")[0].left(ShowChars)


func _on_Back_pressed():
	State = "Main"
	$InvestigationButtons.show()
	$Crosshair.hide()
	get_parent().get_node("characters_all").show()
	for i in $Chat.get_children():
		i.hide()
	$Chat.hide()
	$Moves.hide()
	$Back.hide()


func _on_Investigate_pressed():
	State = "Examine"
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
	_on_ShowCourtRecord_pressed()
	$CourtRecord/Present.show()
	for i in $InvestigationButtons.get_children():
		i.disabled = true


func _on_Move_pressed():
	State = "Move"
	$InvestigationButtons.hide()
	$Moves.show()
	$Back.show()

func _on_Chats_pressed():
	if State == "Chat":
		for i in range(0,4):
			if $Chat.get_children()[i].pressed:
				Cur = int(get_parent().Chats[i].split(";")[1])-1
				ReadChats[i] = true
		_on_Next_pressed()
		State = "Dialogue"
		$BG.show()
		$Next.show()
		$Chat.hide()
		$Back.hide()


func _on_First_timeout():
	refresh()
	ReadChats = get_parent().read_chats
	save_file.set_value("Locations",str(get_parent().filename),"1")
	save_file.save("C:/Games/ddkg2.save")


func _on_Check_pressed():
	if $CourtRecord/Expand.text != "noexp":
		if StateCR == "Rec1":
			StateCR = "Rec2"
			$CourtRecord/Cells.hide()
			$CourtRecord/Expand.show()
			$CourtRecord/BG/ExpandBG2.show()
		else: 
			StateCR = "Rec1"
			$CourtRecord/Cells.show()
			$CourtRecord/Expand.hide()
			$CourtRecord/BG/ExpandBG2.hide()


func _on_ShowCourtRecord_pressed():
	if StateCR == "No":
		$CourtRecord.show()
		$Next.hide()
		$BG.hide()
		StateCR = "Rec1"
	else:
		StateCR = "No"
		$CourtRecord.hide()
		if State == "Dialogue":
			$Next.show()
			$BG.show()
		$CourtRecord/Present.hide()
		for i in $InvestigationButtons.get_children():
			i.disabled = false


func _on_PresentEvidence_pressed():
	_on_ShowCourtRecord_pressed()
	var EvidenceFound = false
	save_file.load("C:/Games/ddkg2.save")
	for i in range(1,len(save_file.get_section_keys("Evidence"))):
		print("matching")
		if get_node("CourtRecord/Cells/Image"+str(Selected)).animation == get_parent().Shows[i-1].split(" ")[0]:
			Cur = int(get_parent().Shows[i-1].split(" ")[1])-1
			_on_Next_pressed()
			State = "Dialogue"
			$InvestigationButtons.hide()
			$BG.show()
			$Next.show()
			EvidenceFound = true
			break
	if EvidenceFound == false:
		Cur = get_parent().NoShow-1
		_on_Next_pressed()
		State = "Dialogue"
		$InvestigationButtons.hide()
		$BG.show()
		$Next.show()


func _on_POI_pressed():
	if State == "Examine":
		State = "Dialogue"
		$BG.show()
		$Next.show()
		$Back.hide()
		$InvestigationButtons.hide()
		$Crosshair.hide()
		for i in get_parent().get_node("POIs").get_children():
			if i.pressed:
				Cur = int(i.text)-1
				_on_Next_pressed()
		get_parent().get_node("characters_all").show()


func _on_Moves_pressed():
	if State == "Move":
		for i in range(0,4):
			if $Moves.get_child(i).pressed:
				get_tree().change_scene(get_parent().Moves[i].split(";")[1])
