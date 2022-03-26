extends Node2D
signal next
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
	save_file.load(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
	save_file.set_value("Locations","Last",get_parent().filename)
	save_file.set_value("Locations",get_parent().filename,"1")
	save_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
	if save_file.get_value("General","Arc","asffhad") != "asffhad": # the best `if` in my life
		$ArcBG.show()
		$ArcBG/Label.show()
		$ArcBG/Label.text = "Арка: "+save_file.get_value("General","Arc","asffhad")


func refresh():
	for i in range(1,len(save_file.get_section_keys("Evidence"))+1):
		get_node("CourtRecord/Cells/Image"+str(i)).animation = save_file.get_value("Evidence",str(i)).split(";")[0]
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
	if "Arc" in get_parent():
		get_parent().Arc = save_file.get_value("General","Arc")
		$ArcBG.show()
		$ArcBG/Label.text = "Арка: "+get_parent().Arc
	if "BoxColor" in get_parent():
		$CourtRecord/ColorOverlay.color = Color(get_parent().BoxColor)
		$show_cell/color.color = Color(get_parent().BoxColor)
	else:
		$CourtRecord/ColorOverlay.color = Color(0.5,0.5,1,1)
		$show_cell/color.color = Color(0.5,0.5,1,1)


func set_arc(arc: String):
	save_file.set_value("General","Arc",arc)
	save_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
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
		$Next.show()
		_on_Next_pressed()


func _on_Next_pressed():
	emit_signal("next")
	Cur+=1
	ShowChars = 0
	$show_cell.hide()
	if get_parent().Dialogue[Cur].split(" ")[0] == "OBJECTION":
		$Bubble.show()
		$Bubble.animation = get_parent().Dialogue[Cur].split(" ")[1]
		$Next.hide()
		$BG.hide()
		$hidebub2.start()
		$Skip.hide()
		print("Objection!")
		if get_parent().Dialogue[Cur].split(" ").size() >= 3:
			print("With VA")
			if get_parent().Dialogue[Cur].split(" ")[2] == "wv":
				var ava = get_parent().Dialogue[Cur].split(" ")[3]
				print(ava," ","res://sounds/"+get_parent().Dialogue[Cur].split(" ")[1]+"_rus"+ava+".ogg")
				$AudioStreamPlayer2.set_stream(load("res://sounds/"+get_parent().Dialogue[Cur].split(" ")[1]+"_rus"+ava+".ogg"))
				$AudioStreamPlayer2.play()
	else:
		$Skip.show()
	if get_parent().Dialogue[Cur] != "MAIN" and get_parent().Dialogue[Cur].split(" ")[0] != "JUMP" and get_parent().Dialogue[Cur].split(" ")[0] != "OUT":
		if get_parent().Dialogue[Cur].split("|").size() >= 2: # has color def
			#print("Repaint")
			var col = Color(1,1,1,1)
			match get_parent().Dialogue[Cur].split("|")[1]:
				"BIG":
					$BG/DialogueBox.get_font("font").size = 48
				"W":
					col = Color(1,1,1,1)
					$BG/DialogueBox.get_font("font").size = 16
				"R":
					col = Color(1,0.5,0.5,1)
					$BG/DialogueBox.get_font("font").size = 16
				"B":
					col = Color(0.5,0.5,1,1)
					$BG/DialogueBox.get_font("font").size = 16
				"G":
					col = Color(0.5,1,0.5,1)
					$BG/DialogueBox.get_font("font").size = 16
				"Y":
					col = Color(1,1,0.5,1)
					$BG/DialogueBox.get_font("font").size = 16
				"P":
					col = Color(1,0.5,1,1)
					$BG/DialogueBox.get_font("font").size = 16
				_:
					col = Color(1,1,1,1)
					$BG/DialogueBox.get_font("font").size = 16
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
					for i in range(get_parent().Roles.size()):
						if get_parent().Dialogue[Cur].split("|")[2].split(" ")[0] == get_parent().Roles[i].split(" ")[0]:
							get_parent().get_node("back_ground").animation = get_parent().Roles[i].split(" ")[1]
							get_parent().get_node("fore_ground").animation = get_parent().Roles[i].split(" ")[1]
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
								if get_parent().Dialogue[Cur].split("|")[5].split(";")[0] == "arc":
									set_arc(str(get_parent().Dialogue[Cur].split("|")[5].split(";")[1]))
									$ArcBG.show()
									$ArcBG/Label.text = "Арка: "+str(get_parent().Dialogue[Cur].split("|")[5].split(";")[1])
									$AudioStreamPlayer2.set_stream(load("res://sounds/fanfare_newev.ogg"))
									$AudioStreamPlayer2.play()
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
									save_file.load(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
									print("Adding evidence")
									var refr = false # не добавляем новую улику? false - добавляем новую улику
									for x in range(1,1+save_file.get_section_keys("Evidence").size()): # счетчик сравнивает текущую улику с каждой уликой в записях
										print("Сравнение ",x," ",save_file.get_value("Evidence",str(x))," с ",get_parent().Dialogue[Cur].split("|")[6])
										if save_file.get_value("Evidence",str(x)).split(";")[0] == get_parent().Dialogue[Cur].split("|")[6].split(";")[0]: # есть ли такая улика уже
											print("совпадение")
											print(int(save_file.get_value("Evidence",str(x)).split(";")[-1])," ",int(get_parent().Dialogue[Cur].split("|")[6].split(";")[-1]))
											if int(save_file.get_value("Evidence",str(x)).split(";")[-1]) < int(get_parent().Dialogue[Cur].split("|")[6].split(";")[-1]): # новее ли улика
												print("adding evidence id ",str(1+save_file.get_section_keys("Evidence").size()),": ",get_parent().Dialogue[Cur].split("|")[6])
												save_file.erase_section_key("Evidence",str(x))
												save_file.set_value("Evidence",str(x),get_parent().Dialogue[Cur].split("|")[6])
												save_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
											refr = true # не добавляем новую улику
											break
									if not refr: # если добавляем новую улику
										print("adding evidence id ",str(1+save_file.get_section_keys("Evidence").size()),": ",get_parent().Dialogue[Cur].split("|")[6])
										save_file.set_value("Evidence",str(1+save_file.get_section_keys("Evidence").size()),get_parent().Dialogue[Cur].split("|")[6])
										save_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
									refresh()
	elif get_parent().Dialogue[Cur].split(" ")[0] == "OUT":
		get_tree().change_scene(get_parent().Dialogue[Cur].split(" ")[1])
	elif get_parent().Dialogue[Cur] == "MAIN":
		State = "Main"
		$BG.hide()
		$Next.hide()
		$Back.hide()
		$Skip.hide()
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
	if event is InputEventKey:
		if Input.is_key_pressed(KEY_SPACE) and State == "Dialogue":
			_on_Next_pressed()
	if event is InputEventMouseMotion:
		$Crosshair.position = event.position
	if event is InputEventMouseButton:
		if StateCR == "Rec1":
			#print("mouse pressed")
			for i in range(1,len(save_file.get_section_keys("Evidence"))+1):
				if get_node("CourtRecord/BG/Cell"+str(i)).get_global_rect().has_point(event.position):
					Selected = i
					#if Selected < save_file.get_section_keys().size():
					$CourtRecord/Viewport.animation = get_node("CourtRecord/Cells/Image"+str(i)).animation
					$CourtRecord/Name.text = save_file.get_value("Evidence",str(i)).split(";")[1]
					$CourtRecord/Desc.text = save_file.get_value("Evidence",str(i)).split(";")[2]
					$CourtRecord/Expand.text = save_file.get_value("Evidence",str(i)).split(";")[3]


func _on_update_timeout():
	ShowChars = clamp(ShowChars+1,0,len(get_parent().Dialogue[Cur].split("|")[0]))
	$BG/DialogueBox.text = get_parent().Dialogue[Cur].split("|")[0].left(ShowChars)
	if ShowChars == len(get_parent().Dialogue[Cur].split("|")[0]):
		$Skip.hide()


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


func _on_First_timeout():
	refresh()
	save_file.set_value("Locations",str(get_parent().filename),"1")
	save_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")


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


func _on_PresentEvidence_pressed():
	_on_ShowCourtRecord_pressed()
	var EvidenceFound = false
	save_file.load(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
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


func _on_hidebub2_timeout():
	$Bubble.hide()
	$Next.show()
	_on_Next_pressed()
	$BG.show()


func _on_Skip_pressed():
	ShowChars = len(get_parent().Dialogue[Cur].split("|")[0])
	$Skip.hide()
