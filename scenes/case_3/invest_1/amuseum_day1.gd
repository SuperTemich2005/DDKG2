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
var BoxColor
func _ready():
	BoxColor = Color(0.5,1,0.5,1)
	Dialogue = [ # диалоги. 
		"6 октября, 13:30. Музей-усадьба имени Пирогова.",
		"Экскурсовод: Здравствуйте, дети!|W",#|character_exkurs default",
		"Все: ...|R",
		"Экскурсовод: Сегодня, я расскажу вам историю известнейшего медика 19-го века,|W",
		"Николая Ивановича Пирогово, всемирно известного и любимого врача, который первым применил анестезию для операции.|W",#|character_exkurs insp",
		"Он так же...",
		"Егорыч: (Всё это, конечно, очень интересно...)|B",
		"(Но Радомир что-то хотел мне тайком сказать...)|B",
		"(Его нет поблизости, может, он уже куда-то ушел...?)",
		"Радомир: Эй!|R",
		"Егорыч: А?|W",
		"Радомир: Ищенко, сюда.|W",
		"Егорыч: (Ну и ну.)|B",
		"Тувок?|W|default2",
		"Радомир: Хорошо, что я тебя перехватил.|W|character_tuvok yee1",
		"Помнишь, ты спрашивал меня про тайное дело?|W|character_tuvok default|---|REACT surprise",
		"Егорыч: Да, уже жду не дождусь подробностей.|W",
		"Радомир: Что тебе рассказал Зинец?|W",
		"Егорыч: Ну, в школе произошло...",
		"Радомир: Изнасилование, да?",
		"Егорыч: (Он не подбирает слов.)|B",
		"Радомир: И?|W",
		"Егорыч: Ну, их еще мучали.",
		"Радомир: И что на заседании, проведенным другом Башима Дашкерина, Иваном",
		"Абсолютно все упоминания жертв и подозреваемых были стерты?",
		"Егорыч: И что Тёмыч проголосовал за вину подозреваемого.",
		"Радомир: Так вот, слушай.",
		"Дело так никто и не рассмотрел в высших инстанциях.",
		"Егорыч: Что?",
		"Радомир: Подозреваемый вовремя съехал из страны",
		"И в интерпол заявления на него не поступило, почему-то.",
		"Другими словами, Зинцу можно было и не геройствовать",
		"Исход был более-менее очевиден.",
		"Егорыч: Странно, но почему никто--",
		"Радомир: Разумеется, Башим подкупил родителей жертв, наверное.|W|character_tuvok hmm",
		"Отец Башима Дашкерина, Сергей Дашкерин, является директором какой-то компании в Мексике.",
		"Что-то связанное с кортелями, наркотой и прочим.",
		"Егорыч: Денег куры не клюют, а?",
		"И вот так родителям пофиг на судьбы их дочерей?",
		"Радомир: Ну, пойми меня правильно.",
		"Вероятней всего, у них был выбор между молчанием за деньги",
		"И принудительном, пожизненном затыкании из 9мм калибра за углом.",
		"Если есть деньги на взятку/подкуп, то есть и деньги на какого-нибудь решалу.",
		"Егорыч: Думаешь, Башим или его отец не дали жертвам своего заговора выбора, кроме как молчать?",
		"Тёмыч: Ё-маё, как всё завернулось.|W|character_temich comeon|---|REACT damage",
		"Соня: ...|W|character_sonya death",
	]
	#$investigation_screen.Cur = 119
	Chats = [
		"",
		"",
		"",
		"",
	]
	Moves = [
		"",
		"",
		"",
		"",
	]
	Shows = [
		"",
		"",
		"",
		"",
	]
	NoShow = 141-17
	check_for_read_chats = false
	read_chats = [false,false,false,false]
