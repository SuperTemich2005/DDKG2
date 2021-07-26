extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	if $sprite.animation.left(4) == "case":
		$sprite.scale = Vector2(0.5,0.5)
	else:
		$sprite.scale = Vector2(1.619,1.619)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
