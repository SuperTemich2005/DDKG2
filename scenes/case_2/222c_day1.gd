extends Node2D
var Dialogue
func _ready():
	Dialogue = [
		"",
		"5 октября. 12:00. Номер 222с G",
		"Тёмыч: Не, нихуя, мы таки все еще тестим W",
		"Тесты вечны.",
		"",
		"MAIN",
		"1",
		"2",
		"3",
		"Зеркало, хуле", # 5, зеркало
		"SPLIT Расследовать ГлавМеню 10 12",
		"Это стоит осмотреть",
		"EXAM",
		"Нафиг надо",
		"MAIN",
		"",
	]
# 1) цвет, MOV-слова срабатывают мгновенно
# 2) SPLIT, JUMP срабатывают раньше на 1 реплику
# 3) чтобы прыгнуть на N-ную строку, надо из номера строки в редакторе
# вычесть 6

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_poi_1_pressed():
	if $investigation_screen.State == "Examine":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int($poi_1.text)
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]
		$investigation_screen.Checked[1] = true


func _on_poi_1_mouse_entered():
	if $investigation_screen.State == "Examine":
		if $investigation_screen.Checked[1] == false:
			$investigation_screen/crosshair.animation = "wut"
		else:
			$investigation_screen/crosshair.animation = "gotchu"
