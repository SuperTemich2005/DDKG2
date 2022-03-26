extends Node2D
var Anims
var Dialogue
var Ev
var Music
var loc_file = ConfigFile.new()
var Cast
func _ready():
	Dialogue = [
		"",
		"--- Что я видел --- R",
		"Радомир: Я сидел в парке с другом. W",
		"Мы там сидели и ничего не делали.",
		"Внезапно, я увидел, как на одну девочку зверски бьёт и режет другая",
		"Страшное зрелище",
		"Мимо нас проходило несколько человек, но вряд ли они это видели.",
		"Тёмыч: Перейдем сразу же к делу, если никто не против",
		"OUT res://scenes/case_2/trial_day1/trial_15_crossexam.tscn",
		"",
	]
	Anims = [
		"",
		"character_wit2 default --- Что я видел --- R POS wit",
		"START examination-allegro Радомир: Я сидел в парке с другом. W",
		"character_wit2 bored Мы там сидели и ничего не делали.",
		"character_wit2 surprise Внезапно, я увидел, как на одну девочку зверски бьёт и режет другая",
		"character_wit2 damage Страшное зрелище",
		"character_wit2 default Мимо нас проходило несколько человек, они тоже это видели, наверное",
		"character_temich paper STOP Тёмыч: Перейдем сразу же к делу, если никто не против POS def",
		"OUT ",
		"OUT ",
	]
	Music = [
		"",
		"--- Что я видел --- R",
		"START examination-allegro Радомир: Я сидел в парке с другом. W",
		"Мы там сидели и ничего не делали.",
		"Внезапно, я увидел, как на одну девочку зверски бьёт и режет другая",
		"Страшное зрелище",
		"Мимо нас проходило несколько человек, они тоже это видели, наверное",
		"STOP Тёмыч: Перейдем сразу же к делу, если никто не против",
		"OUT ",
		"OUT ",
	]
	loc_file.load(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
	loc_file.set_value("Locations","Last",filename)
	loc_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")


