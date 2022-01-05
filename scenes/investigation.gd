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
var ThisOne
# Called when the node enters the scene tree for the first time.


func _ready():
	ThisOne = get_parent().filename
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
	for i in range(1,13):
		get_node("frame_record/evidence_"+str(i)).animation = str(save_file.get_value("Evidence",str(i),"default")).split(":")[0]
	State = "Dialogue" # Main Dialogue Examine Chat Show Move
	if get_parent().filename != "res://scenes/case_2/invest_day2/court_lobby_day2.tscn":
		save_file.set_value("Locations","Last",get_parent().filename)
		save_file.save("C:/Games/ddkg2.save")
	#_on_next_button_pressed()
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
	match State:
		"Dialogue":
			get_parent().get_node("characters_all").show()
			$back_button.hide()
			$back_button.disabled = true
			$investigation_buttons_container.hide()
			$crosshair.hide()
			$background.show()
			$show_text.show()
			if not get_parent().Dialogue[Cur+1].split(" ")[0] == "SPLIT":
				$next_button.show()
				$next_button.disabled = false
			for i in range(1,4):
				if get_parent().Chats[i-1] != "":
					get_parent().get_node("chat_"+str(i)).hide()
					get_parent().get_node("chat_"+str(i)).disabled = true
		"Main":
			get_parent().get_node("characters_all").show()
			$back_button.hide()
			$back_button.disabled = true
			$background.hide()
			$show_text.hide()
			$investigation_buttons_container.show()
			if get_parent().Chats[0] == "":
				$investigation_buttons_container/button_chat.hide()
				$investigation_buttons_container/button_present.hide()
			$next_button.hide()
			$next_button.disabled = true
			$crosshair.hide()
			for i in range(1,4):
				if get_parent().Chats[i-1] != "":
					get_parent().get_node("chat_"+str(i)).hide()
					get_parent().get_node("chat_"+str(i)).disabled = true
				if get_parent().Moves[i-1] != "":
					get_parent().get_node("move_"+str(i)).hide()
					get_parent().get_node("move_"+str(i)).disabled = true
		"Examine":
			get_parent().get_node("characters_all").hide()
			$back_button.show()
			$back_button.disabled = false
			$background.hide()
			$show_text.hide()
			$investigation_buttons_container.hide()
			$next_button.hide()
			$next_button.disabled = true
			$crosshair.show()
		"Chat":
			$back_button.show()
			$back_button.disabled = false
			$background.hide()
			$show_text.hide()
			$investigation_buttons_container.hide()
			$next_button.hide()
			$next_button.disabled = true
			$crosshair.hide()
			for i in range(1,4):
				if get_parent().Chats[i-1] != "":
					get_parent().get_node("chat_"+str(i)).show()
					get_parent().get_node("chat_"+str(i)).disabled = false
		"Move":
			$back_button.show()
			$back_button.disabled = false
			$background.hide()
			$show_text.hide()
			$investigation_buttons_container.hide()
			$next_button.hide()
			$next_button.disabled = true
			$crosshair.hide()
			for i in range(1,4):
				if get_parent().Moves[i-1] != "":
					get_parent().get_node("move_"+str(i)).show()
					get_parent().get_node("move_"+str(i)).disabled = false
		"Show":
			$back_button.show()
			$back_button.disabled = false
			$investigation_buttons_container.hide()
			$next_button.hide()
			$next_button.disabled = true
			$crosshair.hide()
			$frame_record/record_show.show()
			$frame_record/record_show.disabled = false

func _input(event):
	if event is InputEventMouseMotion:
		$crosshair.position = event.position
	if event is InputEventMouseButton and Input.is_action_pressed("lmb_click"):
		for i in range(2,13):
			if get_node("frame_record/evidence_"+str(i-1)+"/hb").get_global_rect().has_point(event.position) and CourtRecordStatus == 1 and get_node("frame_record/evidence_"+str(i-1)).animation != "default":
				print("evidence_"+str(i))
				$frame_record/viewport.animation = get_node("frame_record/evidence_"+str(i-1)).animation
				$frame_record/Label.text = str(save_file.get_value("Evidence",str(i-1))).split(":")[1]
				#print(str(save_file.get_value("Evidence",str(i-1))).split(":")[0])


func _on_next_button_pressed():
	var CheckedEvs = 0
	for i in range(1,Checked.size()):
		#print(str(CheckedEvs))
		if Checked[i] == true:
			CheckedEvs += 1
	if CheckedEvs == get_parent().EvCount:
		print("asdasdasd")
		save_file.set_value("Locations",str(get_parent().filename)+"checked","1")
		save_file.save("C:/Games/ddkg2.save")

	ShowChars = 0
	Cur+=1
	if get_parent().Dialogue[Cur].split(" ")[0] == "OUT":
		$update.free()
		get_tree().change_scene(get_parent().Dialogue[Cur].split(" ")[1])
	if get_parent().Dialogue[Cur].split(" ")[0] == "~~~":
		$AudioStreamPlayer2.set_stream(load("res://sounds/fanfare_newev.ogg"))
		$AudioStreamPlayer2.play()
		save_file.load("C:/Games/ddkg2.save")
		if save_file.get_value("Evidence",get_parent().Ev[Cur].split("/")[0],"-20:-20:-20:-20").split(":")[2] < get_parent().Ev[Cur].split("/")[3]:
			save_file.set_value("Evidence",get_parent().Ev[Cur].split("/")[0],get_parent().Ev[Cur].split("/")[1]+":"+get_parent().Ev[Cur].split("/")[2]+":"+get_parent().Ev[Cur].split("/")[3])
			print(get_parent().Ev[Cur].split("/")[0])
		else:
			pass
		save_file.save("C:/Games/ddkg2.save")
		for i in range(1,13):
			get_node("frame_record/evidence_"+str(i)).animation = str(save_file.get_value("Evidence",str(i),"default")).split(":")[0]
	else:
		$AudioStreamPlayer2.stop()
	if get_parent().Music[Cur] != "":
		if get_parent().Music[Cur].split(" ")[0] == "START":
			$AudioStreamPlayer.set_stream(load("res://sounds/"+get_parent().Music[Cur].split(" ")[1]+".ogg"))
			print("res://sounds/"+get_parent().Music[Cur].split(" ")[1]+".ogg")
			$AudioStreamPlayer.playing = true
		if get_parent().Music[Cur].split(" ")[0] == "STOP":
			$AudioStreamPlayer.playing = false
	print(get_parent().Dialogue[Cur+1].split(" ")[0])
	#$show_text.text = get_parent().Dialogue[Cur]
	if get_parent().Dialogue[Cur+1].split(" ")[0] == "JUMP":
		Cur = int(get_parent().Dialogue[Cur+1].split(" ")[1])
		$show_text.text = get_parent().Dialogue[Cur]
		print("jumping to whatever")
	if get_parent().Dialogue[Cur].split(" ")[0] == "MAIN":
		State = "Main"
		$show_text/text_color.color = Color(1,1,1,1)
	if get_parent().Dialogue[Cur].split(" ")[0] == "EXAM":
		State = "Examine"
		$show_text/text_color.color = Color(1,1,1,1)
	if get_parent().Dialogue[Cur].split(" ")[0] == "CHAT":
		State = "Chat"
		$show_text/text_color.color = Color(1,1,1,1)
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
	if get_parent().Dialogue[Cur].split(" ")[-1] == "W":
		$show_text/text_color.color = Color(1,1,1,1)
		Special = 1
	elif get_parent().Dialogue[Cur].split(" ")[-1] == "G":
		$show_text/text_color.color = Color(0,1,0,1)
		Special = 1
	elif get_parent().Dialogue[Cur].split(" ")[-1] == "B" or get_parent().Dialogue[Cur].split(" ")[0] == "~~~":
		$show_text/text_color.color = Color(0.25,0.25,1,1)
		Special = 1
	elif get_parent().Dialogue[Cur].split(" ")[-1] == "R":
		$show_text/text_color.color = Color(1,0.5,0,1)
		Special = 1
	elif get_parent().Dialogue[Cur].split(" ")[-1] == "Y":
		$show_text/text_color.color = Color(1,1,0,1)
		Special = 1
	elif get_parent().Dialogue[Cur].split(" ")[-1] == "P":
		$show_text/text_color.color = Color(1,0,1,1)
		Special = 1
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
	State = "Main"
	CourtRecordStatus = 0
	$frame_record.hide()
	$court_record.show()
	$court_record.disabled = false

func _on_button_investigate_pressed():
	State = "Examine"


func _on_button_chat_pressed():
	State = "Chat"


func _on_court_record_pressed():
	match CourtRecordStatus:
		0:
			CourtRecordStatus = 1
			$frame_record.show()
			$frame_record/record_show.hide()
		1:
			CourtRecordStatus = 0
			$frame_record.hide()
			$frame_record/record_show.hide()



func _on_button_present_pressed():
	CourtRecordStatus = 1
	$frame_record.show()
	State = "Show"
	$court_record.hide()
	$court_record.disabled = true


func _on_record_show_pressed():
	for i in range(0,get_parent().Shows.size()):
		print($frame_record/viewport.animation+" asdasdasd "+get_parent().Shows[i].split(" ")[0])
		if $frame_record/viewport.animation == get_parent().Shows[i].split(" ")[0]:
			State = "Dialogue"
			Cur = int(get_parent().Shows[i].split(" ")[-1])
			$show_text.text = get_parent().Dialogue[Cur]
			CourtRecordStatus = 0
			$frame_record.hide()
			$frame_record/record_show.hide()
			$court_record.show()
			$court_record.disabled = false
			break
		else:
			continue


func _on_button_move_pressed():
	State = "Move"


func _on_update_timeout():
	ShowChars = clamp(ShowChars+1,1,get_parent().Dialogue[Cur].length()-Special)
	$show_text.text = get_parent().Dialogue[Cur].left(ShowChars)
