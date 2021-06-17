extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var velocity = Vector3()
func _ready():
	pass # Replace with function body.


func _process(delta):
	if $KinematicBody.is_on_floor() == false:
		velocity = velocity - Vector3(0,0,10)
		print("is flying.")
	else:
		print(str(velocity))
		if Input.is_action_pressed("ui_up"):
			velocity = velocity + Vector3(1,0,0)
		elif Input.is_action_pressed("ui_left"):
			velocity = velocity + Vector3(0,1,0)
		elif Input.is_action_pressed("ui_down"):
			velocity = velocity + Vector3(-1,0,0)
		elif Input.is_action_pressed("ui_right"):
			velocity = velocity + Vector3(0,-1,0)
		else:
			velocity = Vector3()
	$KinematicBody.translation = $KinematicBody.translation + velocity
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
