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
var chains_back = []
var locks_back = []
var magatama_bg_fade = -3
var magatama_prep = false
var magatama_clear
var magatama_bg
var cur_secret = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	Selected = 0
	Cur = 0
	ShowChars = 0
	State = "Dialogue"
	StateCR = "No"
	save_file.load("C:/Games/ddkg2.save")
	cur_secret = int(save_file.get_value("Secrets",get_parent().filename,"0"))
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
	for i in range(1,5):
		if get_parent().Chats[i-1] != "":
			$Chat.get_children()[i-1].text = get_parent().Chats[i-1].split(";")[0]
			$Chat.get_children()[i-1].show()
		if get_parent().Moves[i-1] != "":
			$Moves.get_children()[i-1].text = get_parent().Moves[i-1].split(";")[0]
			$Moves.get_children()[i-1].show()
	if save_file.get_value("Locations",get_parent().filename,"0") == "1" and "goto_when_was" in get_parent() and not get_parent().Dialogue[Cur].split(" ")[0] == "~~~":
		Cur = get_parent().goto_when_was-1
		_on_Next_pressed()
	if get_parent().Chats == ["","","",""]:
		$InvestigationButtons/Chat.hide()
		$InvestigationButtons/Present.hide()
		for i in get_parent().get_node("characters_all").get_children():
			i.hide()
	save_file.load("C:/Games/ddkg2.save")
	save_file.set_value("Locations","Last",get_parent().filename)
	save_file.set_value("Locations",get_parent().filename,"1")
	save_file.save("C:/Games/ddkg2.save")


func set_arc(arc: String):
	save_file.set_value("General","Arc",arc)
	save_file.save("C:/Games/ddkg2.save")
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
	$Skip.show()
	$show_cell.hide()
	if get_parent().Dialogue[Cur].split(" ")[0] == "---":
		$BG/DialogueBox.align = Label.ALIGN_CENTER
	else:
		$BG/DialogueBox.align = Label.ALIGN_LEFT
	if get_parent().Dialogue[Cur] != "MAIN" and get_parent().Dialogue[Cur].split(" ")[0] != "JUMP" and get_parent().Dialogue[Cur].split(" ")[0] != "OUT" and get_parent().Dialogue[Cur].split(" ")[0] != "MAGATAMA" and get_parent().Dialogue[Cur] != "HIDEMAGA" and get_parent().Dialogue[Cur].split(" ")[0] != "NOMAGA" and get_parent().Dialogue[Cur].split(" ")[0] != "BREAKLOCK":
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
								elif get_parent().Dialogue[Cur].split("|")[5].split(" ")[0] == "demand":
									_on_ShowCourtRecord_pressed()
									$CourtRecord/Present.show()
									if get_parent().Dialogue[Cur].split("|")[5].split(" ")[4]:
										$StopMaga.show()
									$BG.show()
								elif get_parent().Dialogue[Cur].split("|")[0].left(3) == "~~~":
									# 0Text|1Color|2Anim|3BGM|4React|5id|6nameint;desc;exp;ver
									save_file.load("C:/Games/ddkg2.save")
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
												save_file.save("C:/Games/ddkg2.save")
											refr = true # не добавляем новую улику
											break
									if not refr: # если добавляем новую улику
										print("adding evidence id ",str(1+save_file.get_section_keys("Evidence").size()),": ",get_parent().Dialogue[Cur].split("|")[6])
										save_file.set_value("Evidence",str(1+save_file.get_section_keys("Evidence").size()),get_parent().Dialogue[Cur].split("|")[6])
										save_file.save("C:/Games/ddkg2.save")
									refresh()
		if get_parent().Dialogue[Cur].split("|")[0] == "SKIP_THIS":
			_on_Next_pressed()
	elif get_parent().Dialogue[Cur].split(" ")[0] == "OUT":
		get_tree().change_scene(get_parent().Dialogue[Cur].split(" ")[1])
	elif get_parent().Dialogue[Cur] == "MAIN":
		State = "Main"
		$BG.hide()
		$Next.hide()
		$Skip.hide()
		$Back.hide()
		$InvestigationButtons.show()
		if cur_secret != 0:
			$Magatama.show()
		var temp = 0
		if "read_chats" in get_parent():
			for i in get_parent().read_chats:
				if i:
					temp += 1
		if temp == 4 and get_parent().check_for_read_chats:
			State = "Dialogue"
			$BG.show()
			$Next.show()
			$InvestigationButtons.hide()
			Cur = get_parent().goto_when_read-1
			_on_Next_pressed()
			get_parent().check_for_read_chats = false
			get_parent().read_chats = [false,false,false,false]
	elif get_parent().Dialogue[Cur].split(" ")[0] == "JUMP":
		Cur = int(get_parent().Dialogue[Cur].split(" ")[1])-1
		_on_Next_pressed()
	elif get_parent().Dialogue[Cur] == "HIDEMAGA":
		print("Hiding magatama")
		for i in chains_back:
			i.hide()
			i.free()
		for i in locks_back:
			i.hide()
			i.free()
		chains_back = []
		locks_back = []
		get_parent().get_node("back_ground").self_modulate = Color(1,1,1,1)
		get_parent().get_node("back_ground").animation = "default"
		_on_Next_pressed()
	elif get_parent().Dialogue[Cur].split(" ")[0] == "BREAKLOCK":
		$AudioStreamPlayer2.set_stream(load("res://sounds/intro_woosh.ogg"))
		$AudioStreamPlayer2.play(0)
		locks_back.pop_back().free()
		$BG.hide()
		$Next.hide()
		$ShowCourtRecord.hide()
		$Skip.hide()
		$autoforward.start()
	elif get_parent().Dialogue[Cur].split(" ")[0] == "NOMAGA":
		$AudioStreamPlayer.stop()
		$BG.hide()
		$Next.hide()
		$ShowCourtRecord.hide()
		$Skip.hide()
		get_parent().get_node("back_ground").animation = "default"
		if len(get_parent().Dialogue[Cur].split(" ")) == 2:
			if get_parent().Dialogue[Cur].split(" ")[1] == "SUPER":
				save_file.set_value("Secrets",get_parent().filename,"0")
				save_file.save("C:/Games/ddkg2.save")
		for i in chains_back:
			i.animation = "retract"
			i.play()
			magatama_clear = true
		for i in locks_back:
			i.hide()
	elif get_parent().Dialogue[Cur].split(" ")[0] == "MAGATAMA":
		var locks = get_parent().Dialogue[Cur].split(" ")[1]
		print((get_parent().Dialogue[Cur].split(" ")))
		if get_parent().Dialogue[Cur].split(" ")[2] != "crossexam":
			save_file.set_value("Secrets",get_parent().filename,get_parent().Dialogue[Cur].split(" ")[2])
			cur_secret = int(get_parent().Dialogue[Cur].split(" ")[2])
			save_file.save("C:/Games/ddkg2.save")
		print("START MAGATAMA")
		print(cur_secret)
		$MagaFadeInClk.start()
		get_parent().get_node("back_ground").animation = "magatama"
		$AudioStreamPlayer.stop()
		$AudioStreamPlayer2.set_stream(load("res://sounds/magatama_start.ogg"))
		$AudioStreamPlayer2.play()
		$Next.hide()
		$ShowCourtRecord.hide()
		$BG.hide()
		$Skip.hide()
		match len(locks):
			1:
				var subside = 1
				for i in range(2):
					subside *= -1
					var a = AnimatedSprite.new()
					a.position = Vector2(512,300)
					a.frames = load("res://sprites/magatama/chains_animations.tres")
					a.rotation_degrees = subside*30
					chains_back.append(a)
					a.hide()
					add_child_below_node($chains,a)
				var lock_color = ""
				if locks[0] == "R":
					lock_color = "res://sprites/magatama/standart_lock.png"
				elif locks[0] == "B":
					lock_color = "res://sprites/magatama/hidden_lock.png"
				elif locks[0] == "G":
					lock_color = "res://sprites/magatama/wont_tell_lock.png"
				var b = Sprite.new()
				b.position = Vector2(512,300)
				b.texture = load(lock_color)
				locks_back.append(b)
				b.hide()
				add_child_below_node($locks_parent,b)
			2:
				var side = 1
				var subside = 1
				for i in range(4):
					subside *= -1
					if i%2 == 0:
						side *= -1
					var a = AnimatedSprite.new()
					a.position = Vector2(512+side*300,300)
					a.frames = load("res://sprites/magatama/chains_animations.tres")
					a.rotation_degrees = subside*60
					chains_back.append(a)
					a.hide()
					add_child_below_node($chains,a)
				side = 1
				for i in range(2):
					side *= -1
					var lock_color = ""
					if locks[i] == "R":
						lock_color = "res://sprites/magatama/standart_lock.png"
					elif locks[i] == "B":
						lock_color = "res://sprites/magatama/hidden_lock.png"
					elif locks[i] == "G":
						lock_color = "res://sprites/magatama/wont_tell_lock.png"
					var b = Sprite.new()
					b.position = Vector2(512+side*300,300)
					b.texture = load(lock_color)
					locks_back.append(b)
					b.hide()
					add_child_below_node($locks_parent,b)
			3:
				var side = 1
				var subside = 1
				for i in range(4):
					subside *= -1
					if i%2 == 0:
						side *= -1
					var a = AnimatedSprite.new()
					a.position = Vector2(512+side*300,150)
					a.frames = load("res://sprites/magatama/chains_animations.tres")
					a.rotation_degrees = subside*30
					chains_back.append(a)
					a.hide()
					add_child_below_node($chains,a)
				for i in range(3):
					var lock_color = ""
					if locks[i] == "R":
						lock_color = "res://sprites/magatama/standart_lock.png"
					elif locks[i] == "B":
						lock_color = "res://sprites/magatama/hidden_lock.png"
					elif locks[i] == "G":
						lock_color = "res://sprites/magatama/wont_tell_lock.png"
					var b = Sprite.new()
					b.position = Vector2(512+cos(TAU/3*i+PI/2)*350,200+sin(TAU/3*i+PI/2)*140)
					b.texture = load(lock_color)
					locks_back.append(b)
					b.hide()
					add_child_below_node($locks_parent,b)
			4:
				var side = 1
				var subside = 1
				for i in range(4):
					subside *= -1
					if i%2 == 0:
						side *= -1
					var a = AnimatedSprite.new()
					a.position = Vector2(512+side*300,150)
					a.frames = load("res://sprites/magatama/chains_animations.tres")
					a.rotation_degrees = subside*30
					chains_back.append(a)
					a.hide()
					add_child_below_node($chains,a)
				for i in range(4):
					var lock_color = ""
					if locks[i] == "R":
						lock_color = "res://sprites/magatama/standart_lock.png"
					elif locks[i] == "B":
						lock_color = "res://sprites/magatama/hidden_lock.png"
					elif locks[i] == "G":
						lock_color = "res://sprites/magatama/wont_tell_lock.png"
					var b = Sprite.new()
					b.position = Vector2(512+cos(i)*300,300-sin(i)*150)
					b.texture = load(lock_color)
					locks_back.append(b)
					b.hide()
					add_child_below_node($locks_parent,b)
			5:
				var side = 1
				var subside = 1
				var offs = 0
				for i in range(6):
					var a = AnimatedSprite.new()
					subside *= -1
					if i%2 == 0:
						side *= -1
					if i > 3:
						a.position = Vector2(512+-subside*500,600/2-20)
					else:
						a.position = Vector2(512+side*300,600/2-120)
					a.frames = load("res://sprites/magatama/chains_animations.tres")
					a.rotation_degrees = subside*30
					chains_back.append(a)
					a.hide()
					add_child_below_node($chains,a)
				for i in range(5):
					var lock_color = ""
					if locks[i] == "R":
						lock_color = "res://sprites/magatama/standart_lock.png"
					elif locks[i] == "B":
						lock_color = "res://sprites/magatama/hidden_lock.png"
					elif locks[i] == "G":
						lock_color = "res://sprites/magatama/wont_tell_lock.png"
					var b = Sprite.new()
					b.position = Vector2(512+cos(TAU/5*i+PI/2)*300,300-sin(TAU/5*i+PI/2)*150)
					b.texture = load(lock_color)
					locks_back.append(b)
					b.hide()
					add_child_below_node($locks_parent,b)


func _process(delta):
	if magatama_prep == true:
		magatama_bg_fade = clamp(magatama_bg_fade+0.05,0,1)
		get_parent().get_node("back_ground").self_modulate = Color(1-magatama_bg_fade,1-magatama_bg_fade,1-magatama_bg_fade,1)
		if magatama_bg_fade == 1:
			magatama_prep = false
			$MagaChainClk.start()
	if magatama_clear == true:
		magatama_bg_fade = clamp(magatama_bg_fade-0.01,0,1)
		get_parent().get_node("back_ground").self_modulate = Color(1-magatama_bg_fade,1-magatama_bg_fade,1-magatama_bg_fade,1)
		if magatama_bg_fade == 0:
			magatama_clear = false
			$autoforward.start()


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
	if cur_secret != 0:
		$Magatama.show()
	State = "Main"
	$InvestigationButtons.show()
	$Crosshair.hide()
	get_parent().get_node("characters_all").show()
	$Chat.hide()
	$Moves.hide()
	$Back.hide()


func _on_Investigate_pressed():
	$Magatama.hide()
	State = "Examine"
	$InvestigationButtons.hide()
	$Crosshair.show()
	$Back.show()
	$BG.hide()
	get_parent().get_node("characters_all").hide()


func _on_Chat_pressed():
	State = "Chat"
	$Magatama.hide()
	$InvestigationButtons.hide()
	$Chat.show()
	$Back.show()
	$Magatama.hide()

func _on_Present_pressed():
	_on_ShowCourtRecord_pressed()
	$Magatama.disabled = true
	$CourtRecord/Present.show()
	for i in $InvestigationButtons.get_children():
		i.disabled = true


func _on_Move_pressed():
	$Magatama.hide()
	State = "Move"
	$InvestigationButtons.hide()
	$Moves.show()
	$Back.show()

func _on_Chats_pressed():
	if State == "Chat":
		$Magatama.hide()
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
	else:
		print("noexp.")


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
		$Magatama.disabled = false


func _on_PresentEvidence_pressed():
	_on_ShowCourtRecord_pressed()
	var EvidenceFound = false
	$StopMaga.hide()
	save_file.load("C:/Games/ddkg2.save")
	if State != "Dialogue":
		for i in range(0,get_parent().Shows.size()+1):
			print("matching ",get_node("CourtRecord/Cells/Image"+str(Selected)).animation," ",get_parent().Shows[i-1].split(" ")[0])
			if get_node("CourtRecord/Cells/Image"+str(Selected)).animation == get_parent().Shows[i-1].split(" ")[0]:
				print("matched")
				Cur = int(get_parent().Shows[i-1].split(" ")[1])-1
				_on_Next_pressed()
				State = "Dialogue"
				$InvestigationButtons.hide()
				$BG.show()
				$Next.show()
				EvidenceFound = true
				break
		if EvidenceFound == false:
			print("no match. goto noshow")
			Cur = get_parent().NoShow-1
			_on_Next_pressed()
			State = "Dialogue"
			$InvestigationButtons.hide()
			$BG.show()
			$Next.show()
	else:
		if get_node("CourtRecord/Cells/Image"+str(Selected)).animation == get_parent().Dialogue[Cur].split("|")[5].split(" ")[1]:
			Cur = int(get_parent().Dialogue[Cur].split("|")[5].split(" ")[2])-1
			_on_Next_pressed()
			State = "Dialogue"
			$BG.show()
			$Next.show()
		else:
			Cur = int(get_parent().Dialogue[Cur].split("|")[5].split(" ")[3])-1
			_on_Next_pressed()
			State = "Dialogue"
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


func _on_Skip_pressed():
	ShowChars = len(get_parent().Dialogue[Cur].split("|")[0])
	$Skip.hide()


func _on_MagaChainClk_timeout():
	var count = 0
	print("Magachain ",chains_back)
	for i in chains_back:
		print(i.visible)
		if i.visible == false:
			i.show()
			i.play()
			break
		else:
			count += 1
	if count == chains_back.size():
		$MagaLockClk.start()
		$MagaChainClk.stop()


func _on_MagaFadeInClk_timeout():
	magatama_prep = true


func _on_MagaLockClk_timeout():
	var count = 0
	$AudioStreamPlayer2.set_stream(load("res://sounds/sith_slam.ogg"))
	for i in locks_back:
		if i.visible == false:
			i.show()
			i.scale = Vector2(2,2)
			$AudioStreamPlayer2.play()
			break
		else:
			count += 1
	if count == len(locks_back):
		$MagaLockClk.stop()
		_on_Next_pressed()
		$BG.show()
		$Next.show()
		$ShowCourtRecord.show()


func _on_autoforward_timeout():
	_on_Next_pressed()
	$BG.show()
	$Next.show()
	$ShowCourtRecord.show()
	$TakeBubble.hide()


func _on_Magatama_pressed():
	$AudioStreamPlayer.set_stream(load("res://sounds/have_rus.ogg"))
	$AudioStreamPlayer.play()
	Cur = cur_secret-1
	State = "Dialogue"
	$InvestigationButtons.hide()
	$Magatama.hide()
	$autoforward2.start()
	$TakeBubble.show()
	if StateCR != "No":
		_on_ShowCourtRecord_pressed()


func _on_autoforward2_timeout():
	_on_Next_pressed()
	$TakeBubble.hide()


func _on_StopMaga_pressed():
	Cur = get_parent().maga_halt-1
	_on_Next_pressed()
	State = "Dialogue"
	$CourtRecord.hide()
	$Next.show()
	$Skip.show()
	$StopMaga.hide()
