extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Special
var ShowChars
var Cur
var State : String
var CourtRecord : Array
var Checked : Array
var save_file
var loc_file
var CourtRecordStatus
var Pos
# Called when the node enters the scene tree for the first time.
func _ready():
	Pos = "jud" # wit def pro jud hld
	Special = 0
	ShowChars = 0
	CourtRecordStatus = 0
	CourtRecord.resize(12) 
	Checked.resize(10)
	for i in range(0,10):
		Checked[i] = false
	Cur = 0
	save_file = ConfigFile.new()
	save_file.load("C:/Games/ddkg2.save")
	for i in range(1,12):
		get_node("frame_record/evidence_"+str(i)).animation = str(save_file.get_value("Evidence",str(i),"default")).split(":")[0]
	State = "Dialogue" # Main Dialogue Examine Chat Show Move
	save_file.set_value("Locations","Last",get_parent().filename)
	save_file.save("C:/Games/ddkg2.save")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if get_parent().Anims[Cur].split(" ")[0].left(9) == "character":
		if get_parent().Anims[Cur].split(" ")[1] == "HIDE":
			get_parent().get_node("characters_all/"+get_parent().Anims[Cur].split(" ")[0]).hide()
		elif get_parent().Anims[Cur].split(" ")[1] == "SHOW":
			#print("showing +"+str(get_parent().get_node("characters_all/"+get_parent().Anims[Cur].split(" ")[0])))
			for i in range(0,get_parent().get_node("characters_all").get_child_count()):
				get_parent().get_node("characters_all").get_children()[i].hide()
			get_parent().get_node("characters_all/"+get_parent().Anims[Cur].split(" ")[0]).show()
		else:
			get_parent().get_node("characters_all/"+get_parent().Anims[Cur].split(" ")[0]+"/sprite").animation = get_parent().Anims[Cur].split(" ")[1]
			for i in range(0,get_parent().get_node("characters_all").get_child_count()):
				get_parent().get_node("characters_all").get_children()[i].hide()
			get_parent().get_node("characters_all/"+get_parent().Anims[Cur].split(" ")[0]).show()
	match State:
		"Dialogue":
			get_parent().get_node("characters_all").show()
			$back_button.hide()
			$back_button.disabled = true
			$background.show()
			$show_text.show()
			if not get_parent().Dialogue[Cur+1].split(" ")[0] == "SPLIT":
				$next_button.show()
				$next_button.disabled = false
			$press_button.hide()
			$press_button.disabled = true
			$court_record.text = "Записи суда"
		"Show":
			$press_button.hide()
			$press_button.disabled = true
			$back_button.show()
			$back_button.disabled = false
			$investigation_buttons_container.hide()
			$next_button.hide()
			$next_button.disabled = true
			$crosshair.hide()
			$frame_record/record_show.show()
			$frame_record/record_show.disabled = false
		"Interogation":
			$back_button.show()
			$back_button.disabled = false
			$next_button.show()
			$next_button.disabled = false
			$press_button.show()
			$press_button.disabled = false
			$court_record.text = "Показать"

func _input(event):
	if event is InputEventMouseButton and Input.is_action_pressed("lmb_click"):
		for i in range(2,13):
			if get_node("frame_record/evidence_"+str(i-1)+"/hb").get_global_rect().has_point(event.position) and CourtRecordStatus == 1 and get_node("frame_record/evidence_"+str(i-1)).animation != "default":
				print("evidence_"+str(i))
				$frame_record/viewport.animation = get_node("frame_record/evidence_"+str(i-1)).animation
				$frame_record/Label.text = str(save_file.get_value("Evidence",str(i-1))).split(":")[1]


func _on_next_button_pressed():
	if Cur == 1 and get_parent().filename.right(get_parent().filename.length()-15) == "_crossexam.tscn":
		State = "Interogation"
		$intro_whoosh.show()
		$intro_whoosh.play()
	ShowChars = 0
	Cur+=1
	if get_parent().Dialogue[Cur].split(" ")[0] == "OUT":
		get_tree().change_scene(get_parent().Dialogue[Cur].split(" ")[1])
	if get_parent().Dialogue[Cur].split(" ")[0] == "~~~":
		$AudioStreamPlayer2.set_stream(load("res://sounds/fanfare_newev.ogg"))
		$AudioStreamPlayer2.play()
		print(get_parent().Ev[Cur].split("/"))
		if save_file.get_value("Evidence",get_parent().Ev[Cur].split("/")[0],"-20:-20:-20:-20").split(":")[2] < get_parent().Ev[Cur].split("/")[3]:
			save_file.set_value("Evidence",get_parent().Ev[Cur].split("/")[0],get_parent().Ev[Cur].split("/")[1]+":"+get_parent().Ev[Cur].split("/")[2]+":"+get_parent().Ev[Cur].split("/")[3])
		else:
			pass
		save_file.save("C:/Games/ddkg2.save")
		for i in range(1,12):
			get_node("frame_record/evidence_"+str(i)).animation = str(save_file.get_value("Evidence",str(i),"default")).split(":")[0]
	else:
		$AudioStreamPlayer2.stop()
	if get_parent().Music[Cur] != "": 
		if get_parent().Music[Cur].split(" ")[0] == "REACT":
			$AudioStreamPlayer2.set_stream(load("res://sounds/"+get_parent().Music[Cur].split(" ")[1]+".ogg"))
			print("res://sounds/"+get_parent().Music[Cur].split(" ")[1]+".ogg")
			$AudioStreamPlayer2.play()
		if get_parent().Music[Cur].split(" ")[0] == "START":
			if $AudioStreamPlayer.playing == false:
				$AudioStreamPlayer.set_stream(load("res://sounds/"+get_parent().Music[Cur].split(" ")[1]+".ogg"))
				print("res://sounds/"+get_parent().Music[Cur].split(" ")[1]+".ogg")
				$AudioStreamPlayer.playing = true
		if get_parent().Music[Cur].split(" ")[0] == "STOP":
			$AudioStreamPlayer.playing = false
	print(get_parent().Dialogue[Cur+1].split(" ")[0])
	#$show_text.text = get_parent().Dialogue[Cur]
	if get_parent().Dialogue[Cur+1].split(" ")[0] == "EJUMP":
		Cur = int(get_parent().Dialogue[Cur+1].split(" ")[1]) 
		$show_text.text = get_parent().Dialogue[Cur]
		State = "Dialogue"
		$show_text/text_color.color = Color(1,1,1,1)
		print("jumping to whatever")
	if get_parent().Dialogue[Cur+1].split(" ")[0] == "JUMP":
		Cur = int(get_parent().Dialogue[Cur+1].split(" ")[1]) 
		$show_text.text = get_parent().Dialogue[Cur]
		print("jumping to whatever")
	if get_parent().Dialogue[Cur].split(" ")[0] == "INTER":
		State = "Interogation"
		$back_button.show()
		$back_button.disabled = false
		$next_button.show()
		$next_button.disabled = false
		$press_button.show()
		$press_button.disabled = false
	if get_parent().Dialogue[Cur].split(" ")[0] == "SHOW":
		State = "Show"
		$back_button.show()
		$back_button.disabled = false
		$investigation_buttons_container.hide()
		$next_button.hide()
		$next_button.disabled = true
		$crosshair.hide()
		$frame_record.show()
		$show_text.hide()
		$background.hide()
		$court_record.hide()
		$frame_record/record_show.show()
		$frame_record/record_show.disabled = false
		$show_text/text_color.color = Color(1,1,1,1)
	if get_parent().Dialogue[Cur+1].split(" ")[0] == "SPLIT":
		$choice_first.disabled = false
		$choice_second.disabled = false
		$next_button.disabled = true
		$choice_first.show()
		$choice_second.show()
		$next_button.hide()
		$choice_first.text = get_parent().Dialogue[Cur+1].split(" ")[1]
		$choice_second.text = get_parent().Dialogue[Cur+1].split(" ")[2]
	if get_parent().Dialogue[Cur].split(" ")[-1].left(1) == "I":
		State = "Interogation"
	if get_parent().Anims[Cur].split(" ").size() >= 2:
		if get_parent().Anims[Cur].split(" ")[-2] == "POS":
			get_parent().get_node("back_ground").play(get_parent().Anims[Cur].split(" ")[-1])
	if get_parent().Dialogue[Cur].split(" ")[-1-int(get_parent().Dialogue[Cur].split(" ")[-1].left(1) == "I")] == "W":
		$show_text/text_color.color = Color(1,1,1,1)
		Special = 1+int(get_parent().Dialogue[Cur].split(" ")[-1].left(1) == "I")*int(get_parent().Dialogue[Cur].split(" ")[-1].length()+1)
	elif get_parent().Dialogue[Cur].split(" ")[-1-int(get_parent().Dialogue[Cur].split(" ")[-1].left(1) == "I")] == "G":
		$show_text/text_color.color = Color(0,1,0,1)
		Special = 1+int(get_parent().Dialogue[Cur].split(" ")[-1].left(1) == "I")*int(get_parent().Dialogue[Cur].split(" ")[-1].length()+1)
	elif get_parent().Dialogue[Cur].split(" ")[-1-int(get_parent().Dialogue[Cur].split(" ")[-1].left(1) == "I")] == "B" or get_parent().Dialogue[Cur].split(" ")[0] == "~~~":
		$show_text/text_color.color = Color(0.25,0.25,1,1)
		Special = 1+int(get_parent().Dialogue[Cur].split(" ")[-1].left(1) == "I")*int(get_parent().Dialogue[Cur].split(" ")[-1].length()+1)
	elif get_parent().Dialogue[Cur].split(" ")[-1-int(get_parent().Dialogue[Cur].split(" ")[-1].left(1) == "I")] == "R":
		$show_text/text_color.color = Color(1,0.5,0,1)
		Special = 1+int(get_parent().Dialogue[Cur].split(" ")[-1].left(1) == "I")*int(get_parent().Dialogue[Cur].split(" ")[-1].length()+1)
	elif get_parent().Dialogue[Cur].split(" ")[-1-int(get_parent().Dialogue[Cur].split(" ")[-1].left(1) == "I")] == "Y":
		$show_text/text_color.color = Color(1,1,0,1)
		Special = 1+int(get_parent().Dialogue[Cur].split(" ")[-1].left(1) == "I")*int(get_parent().Dialogue[Cur].split(" ")[-1].length()+1)
	elif get_parent().Dialogue[Cur].split(" ")[-1-int(get_parent().Dialogue[Cur].split(" ")[-1].left(1) == "I")] == "P":
		$show_text/text_color.color = Color(1,0,1,1)
		Special = 1+int(get_parent().Dialogue[Cur].split(" ")[-1].left(1) == "I")*int(get_parent().Dialogue[Cur].split(" ")[-1].length()+1)
	else:
		Special = 0


func _on_choice_first_pressed():
	$choice_first.disabled = true
	$choice_second.disabled = true
	$next_button.disabled = false
	$choice_first.hide()
	$choice_second.hide()
	$next_button.show()
	Cur = int(get_parent().Dialogue[Cur+1].split(" ")[3])
	$show_text.text = get_parent().Dialogue[Cur]


func _on_choice_second_pressed():
	$choice_first.disabled = true
	$choice_second.disabled = true
	$next_button.disabled = false
	$choice_first.hide()
	$choice_second.hide()
	$next_button.show()
	Cur = int(get_parent().Dialogue[Cur+1].split(" ")[4])
	$show_text.text = get_parent().Dialogue[Cur]


func _on_back_button_pressed():
	match State:
		"Show":
			State = "Dialogue"
			CourtRecordStatus = 0
			$frame_record.hide()
			$court_record.show()
			$court_record.disabled = false
		"Interogation":
			Cur = clamp(Cur - 2,1,get_parent().Dialogue.size())
			_on_next_button_pressed()
			


func _on_court_record_pressed():
	match CourtRecordStatus:
		0:
			CourtRecordStatus = 1
			$frame_record.show()
			if State != "Interogation":
				$frame_record/record_show.hide()
			else:
				$frame_record/record_show.show()
		1:
			CourtRecordStatus = 0
			$frame_record.hide()


func _on_record_show_pressed():
	CourtRecordStatus = 0
	$frame_record.hide()
	State = "Dialogue"
	$AudioStreamPlayer2.set_stream(load("res://sounds/obj_rus.ogg"))
	$AudioStreamPlayer2.play()
	$speech_bubble.animation = "objection"
	$speech_bubble.show()
	$autoforward.start()
	$next_button.hide()
	$back_button.hide()
	$next_button.disabled = true
	$back_button.disabled = true
	$show_text/text_color.color = Color(0,0,0,0)
	if $frame_record/viewport.animation == get_parent().CorrectShow.split(" ")[0]: # showing correct evidence
		if Cur == int(get_parent().CorrectShow.split(" ")[1]): # showing at correct statement
			if get_parent().CorrectShow.split(" ")[-1] != "pressed": # no pressing needed
				$superforward.start()
			else: # if pressing needed
				if get_parent().Pressed == 1: # if pressed correctly
					$superforward.start()
				else:
					Cur = get_parent().WrongShow-1
					$autoforward.start()
		else:
			Cur = get_parent().WrongShow-1
			$autoforward.start()
	else:
		Cur = get_parent().WrongShow-1
		$autoforward.start()


func _on_update_timeout():
	ShowChars = clamp(ShowChars+1,0,get_parent().Dialogue[Cur].length()-Special)
	$show_text.text = get_parent().Dialogue[Cur].left(ShowChars)


func _on_press_button_pressed():
	State = "Dialogue"
	$AudioStreamPlayer2.set_stream(load("res://sounds/hit_rus.ogg"))
	$AudioStreamPlayer2.play()
	$speech_bubble.animation = "hit"
	$speech_bubble.show()
	$autoforward.start()
	$next_button.hide()
	$back_button.hide()
	$next_button.disabled = true
	$back_button.disabled = true
	$show_text/text_color.color = Color(0,0,0,0)
	#$show_text.hide()
	
	print(get_parent().Dialogue[Cur].split(" ")[-1].right(get_parent().Dialogue[Cur].split(" ")[-1].length()-2))
	print(get_parent().Dialogue[Cur].split(" ")[-1])
	print(get_parent().Dialogue[Cur])
	Cur = int(get_parent().Dialogue[Cur].split(" ")[-1].right(get_parent().Dialogue[Cur].split(" ")[-1].length()-2))-1

func _on_autoforward_timeout():
	#$show_text.show()
	$show_text/text_color.color = Color(1,1,1,1)
	$speech_bubble.hide()
	$next_button.show()
	$back_button.show()
	$next_button.disabled = false
	$back_button.disabled = false
	


func _on_superforward_timeout():
	get_tree().change_scene(get_parent().Out)
