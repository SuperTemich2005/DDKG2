extends Node2D
var fade = -3
var locks = ["r","","","",""]
var chains_back = []
var locks_back = []
var showchains = 0
var fade_done = false
var mult = 0.05


func _ready():
	match len(locks):
		1:
			var subside = 1
			for i in range(2):
				subside *= -1
				var a = Sprite.new()
				a.position = Vector2(512,300)
				a.texture = load("res://sprites/magatama/chains_of_the_heart_1.png")
				a.rotation_degrees = subside*30
				chains_back.append(a)
				a.hide()
				add_child(a)
		2:
			var side = 1
			var subside = 1
			for i in range(4):
				subside *= -1
				if i%2 == 0:
					side *= -1
				var a = Sprite.new()
				a.position = Vector2(512+side*300,300)
				a.texture = load("res://sprites/magatama/chains_of_the_heart_1.png")
				a.rotation_degrees = subside*60
				chains_back.append(a)
				a.hide()
				add_child(a)
		3:
			var side = 1
			var subside = 1
			for i in range(4):
				subside *= -1
				if i%2 == 0:
					side *= -1
				var a = Sprite.new()
				a.position = Vector2(512+side*300,150)
				a.texture = load("res://sprites/magatama/chains_of_the_heart_1.png")
				a.rotation_degrees = subside*30
				chains_back.append(a)
				a.hide()
				add_child(a)
		4:
			var side = 1
			var subside = 1
			for i in range(4):
				subside *= -1
				if i%2 == 0:
					side *= -1
				var a = Sprite.new()
				a.position = Vector2(512+side*300,150)
				a.texture = load("res://sprites/magatama/chains_of_the_heart_1.png")
				a.rotation_degrees = subside*30
				chains_back.append(a)
				a.hide()
				add_child(a)
		5:
			var side = 1
			var subside = 1
			var offs = 0
			for i in range(6):
				var a = Sprite.new()
				subside *= -1
				if i%2 == 0:
					side *= -1
				if i > 3:
					a.position = Vector2(512+-subside*500,600/2-20)
				else:
					a.position = Vector2(512+side*300,600/2-120)
				a.texture = load("res://sprites/magatama/chains_of_the_heart_1.png")
				a.rotation_degrees = subside*30
				chains_back.append(a)
				a.hide()
				add_child(a)


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
	showchains = clamp(showchains+1,0,len(chains_back)-1)
