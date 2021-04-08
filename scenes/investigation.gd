extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Cur
var State : String
var CourtRecord : Array
var Checked : Array
var save_file
var CourtRecordStatus
# Called when the node enters the scene tree for the first time.
func _ready():
	CourtRecordStatus = 0
	CourtRecord.resize(12)
	Checked.resize(10)
	for i in range(0,10):
		Checked[i] = false
	save_file = File.new()
	save_file.open("C:/Games/ddkg2.save",File.READ)
	print(str(save_file.get_as_text().split(";-")))
	CourtRecord = (save_file.get_as_text().split(";-"))
	print("Назв-е улики: "+CourtRecord[1].split(":")[0]+" опис-е улики: "+CourtRecord[1].split(":")[1])
	for i in range(1,CourtRecord.size()):
		get_node("frame_record/evidence_"+str(i)).animation = str(CourtRecord[i].split(":")[0])
	Cur = 0
	State = "Dialogue" # Main Dialogue Examine Chat Show Move
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	match State:
		"Dialogue":
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
			$back_button.hide()
			$back_button.disabled = true
			$background.hide()
			$show_text.hide()
			$investigation_buttons_container.show()
			$next_button.hide()
			$next_button.disabled = true
			$crosshair.hide()
			for i in range(1,4):
				if get_parent().Chats[i-1] != "":
					get_parent().get_node("chat_"+str(i)).hide()
					get_parent().get_node("chat_"+str(i)).disabled = true
		"Examine":
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
		for i in range(1,12):
			if get_node("frame_record/evidence_"+str(i)+"/hb").get_global_rect().has_point(event.position) and CourtRecordStatus == 1:
				print("evidence_"+str(i))
				$frame_record/viewport.animation = get_node("frame_record/evidence_"+str(i)).animation
				$frame_record/Label.text = CourtRecord[i].split(":")[1]


func _on_next_button_pressed():
	Cur+=1
	print(get_parent().Dialogue[Cur+1].split(" ")[0])
	$show_text.text = get_parent().Dialogue[Cur]
	if get_parent().Dialogue[Cur+1].split(" ")[0] == "JUMP":
		Cur = int(get_parent().Dialogue[Cur+1].split(" ")[1])
		$show_text.text = get_parent().Dialogue[Cur]
		print("jumping to whatever")
	if get_parent().Dialogue[Cur].split(" ")[0] == "MAIN":
		State = "Main"
	if get_parent().Dialogue[Cur].split(" ")[0] == "EXAM":
		State = "Examine"
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
		$show_text.text = $show_text.text.left($show_text.text.length()-1)
	if get_parent().Dialogue[Cur].split(" ")[-1] == "G":
		$show_text/text_color.color = Color(0,1,0,1)
		$show_text.text = $show_text.text.left($show_text.text.length()-1)
	if get_parent().Dialogue[Cur].split(" ")[-1] == "B":
		$show_text/text_color.color = Color(0,0,1,1)
		$show_text.text = $show_text.text.left($show_text.text.length()-1)
	if get_parent().Dialogue[Cur].split(" ")[-1] == "R":
		$show_text/text_color.color = Color(1,0.5,0,1)
		$show_text.text = $show_text.text.left($show_text.text.length()-1)
	if get_parent().Dialogue[Cur].split(" ")[-1] == "Y":
		$show_text/text_color.color = Color(1,1,0,1)
		$show_text.text = $show_text.text.left($show_text.text.length()-1)
	if get_parent().Dialogue[Cur].split(" ")[-1] == "P":
			$show_text/text_color.color = Color(1,0,1,1)
			$show_text.text = $show_text.text.left($show_text.text.length()-1)


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
