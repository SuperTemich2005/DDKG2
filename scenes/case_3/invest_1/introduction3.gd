extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _ready():
	$AudioStreamPlayer.play()


func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/case_3/invest_1/briefing.tscn")
