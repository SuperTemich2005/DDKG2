extends Node2D
var Anims
var Dialogue
var Chats
var Shows
var Moves
var Ev
var Music
var EvCount
var loc_file = ConfigFile.new()
var read_chats
var check_for_read_chats
var goto_when_read
var NoShow
func _ready():
	Dialogue = [ # диалоги. 
		"",
		"6 октября. 12:00. Перон Львовского вокзала.|G",
		"Егорыч: Наконец то мы приехали!|W|---|START peaceful_day|---",
		"Ууууух...",
		"После этих часов сидения, потянуться не помешает...",
		"Тёмыч: УУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУУХ!|W|character_temich default|---|REACT damage",
		"Егорыч: Это было... весьма показательно.",
		"Е. Анатольевна: Ждем, пока остальные выйдут...|W|character_lentoln default|---|---",
		"Егорыч: Угу.",
		"Лентольна, куда мы будем сегодня ездить?",
		"Е. Анатольевна: Ну, во Львове есть очень интересная достопримечательность.|W|character_lentoln hmm|---|---",
		"Замок Текуцких|R|character_lentoln kek|---|REACT surprise",
		"Тёмыч: Ну и ну, Лентольна. Да вы у нас 'голубых кровей'?|W|character_temich kekk|---|---",
		"Егорыч: (Если бы кровь Лентольны была основана не на железе, а на кобальте, то да, именно 'голубых кровей')|B",
		"Е. Анатольевна: Но сначала, мы планируем заехать в 'Пузату Хату'. Мы там как раз таки на 12:10 забронировали определенное кол-во столов.|W|character_lentoln hmm|---|---",
		"Все хотят есть.",
		"Тёмыч: Солидарен с теми, кто хочет есть.|W|character_temich wonder|---|---",
		"Е. Анатольевна: О, Артём, а где твой плащ?|W|character_lentoln default|---|---",
		"Тёмыч: Это была кофта, а не плащ...|W|character_temich kekk|---|---",
		"По этому я и переоделся, собственно.|W|character_temich kekk|---|---",
		"Е. Анатольевна: Во, наконец-то последние вышли.|W|character_lentoln default|---|---",
		"Егорыч: (Странно, я думал, что нас меньше.)|B",
		"OUT res://scenes/case_3/invest_1/ahata_day1.tscn",
		"",
	]
# СУКА БЛЯТЬ НЕ ТРОГАЙ ЭТО ГАНДОН НЕДОШТОПАННЫЙ АААААААААААААААААААААААА!!!!!!!!!!!!!!!!!!!!!!!
	loc_file.load("C:/Games/ddkg2.save")
	Chats = [
		"Как экскурсия? 84",
		"Соня 97",
		"'Некое дело' 133",
		"",
	]
	Moves = [
		"",
		"",
		"",
		"",
	]
	Shows = [
		"badge 287",
		"badge 287",
		"badge 287",
	]
	check_for_read_chats = false
	read_chats = [false,false,false,true]
