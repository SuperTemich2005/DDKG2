extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Cur
var State : String
# Called when the node enters the scene tree for the first time.
func _ready():
	Cur = 0
	State = "Dialogue" # Main Dialogue Examine ChatSelect Present Move


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
		"Main":
			$back_button.hide()
			$back_button.disabled = true
			$background.hide()
			$show_text.hide()
			$investigation_buttons_container.show()
			$next_button.hide()
			$next_button.disabled = true
			$crosshair.hide()
		"Examine":
			$back_button.show()
			$back_button.disabled = false
			$background.hide()
			$show_text.hide()
			$investigation_buttons_container.hide()
			$next_button.hide()
			$next_button.disabled = true
			$crosshair.show()
func _input(event):
	$crosshair.position = event.position
func _on_next_button_pressed():
	print(get_parent().Dialogue[Cur+1].split(" ")[0])
	Cur+=1
	$show_text.text = get_parent().Dialogue[Cur]
	if get_parent().Dialogue[Cur+1].split(" ")[0] == "JUMP":
		Cur = int(get_parent().Dialogue[Cur+1].split(" ")[1])
		#$show_text.text = get_parent().Dialogue[Cur]
		print("jumping to whatever")
	if get_parent().Dialogue[Cur+1].split(" ")[0] == "MAIN":
		State = "Main"
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
	Cur = int(get_parent().Dialogue[Cur+1].split(" ")[3])+1
	$show_text.text = get_parent().Dialogue[Cur]


func _on_choice_second_pressed():
	$choice_first.disabled = true
	$choice_second.disabled = true
	$next_button.disabled = false
	$choice_first.hide()
	$choice_second.hide()
	$next_button.show()
	Cur = int(get_parent().Dialogue[Cur+1].split(" ")[4])+1
	$show_text.text = get_parent().Dialogue[Cur]


func _on_back_button_pressed():
	State = "Main"


func _on_button_investigate_pressed():
	State = "Examine"
