extends Node2D
var fade = -3
var locks = ["r","r","r","r","r"]
var chains_back = []
var showchains = 0
var fade_done = false
var mult = 0.05
func _ready():
	var deg1 = (180*(len(locks)-2))/len(locks)
	var deg2 = (180*((len(locks)*2)-2))/(len(locks)*2)
	print(deg2)
	for i in range(len(locks)*2):
		var a = Sprite.new()
		a.texture = load("res://sprites/magatama/chains_of_the_heart_2.png")
		a.position = Vector2(1024/2+cos(TAU/len(locks)*i)*150,600/2+sin(TAU/len(locks)*i)*150)
		a.rotation_degrees = deg2*(i+1)
		print(deg2*(i+1))
		a.hide()
		chains_back.append(a)
		add_child(a)
	print(len(chains_back))
	for i in range(len(locks)):
		var a = Sprite.new()
		a.texture = load("res://sprites/magatama/chains_of_the_heart_1.png")
		a.position = Vector2(1024/2+cos(TAU/len(locks)*i)*50,600/2+sin(TAU/len(locks)*i)*50)
		a.rotation_degrees = deg1*(i+1)
		a.hide()
		chains_back.append(a)
		add_child(a)
	print(len(chains_back))
	


func _process(deltah):
	if fade_done == false:
		fade += mult
		$BG.self_modulate.a = clamp(fade,0,1)
		if fade >= 5:
			fade_done = true
	elif fade_done == true and mult != 0:
		mult = 0
		$LaunchChains.start()


func _on_LaunchChains_timeout():
	chains_back[showchains].show()
	print(showchains)
	showchains = clamp(showchains+1,0,len(chains_back)*2)
