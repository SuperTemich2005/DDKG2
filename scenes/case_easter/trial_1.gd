extends Node2D
var Dialogue
var BoxColor
var Roles
func _ready():
	BoxColor = Color(0.5,1,0.5,1)
	Roles = [
		"character_egorich def",
		"character_lentoln jud",
		#"character_temich hld",
		"character_sonya pro",
		"character_wit wit",
		"character_temich def",
		"character_temich2 wit",
	]
	Dialogue = [ # диалоги. 
		"*стук*|W|---|---|REACT damage",
		"Е. Анатольевна: Судебное заседание по делу Артёма Зинца объявляю открытым!|W|character_lentoln hmm|START trial",
		"Стороны готовы?",
		"Соня: ...|W|character_sonya death",
		"Егорыч: Защита более, чем готова!|W|character_egorich yee",
		"Е. Анатольевна: Приношу извинения за то, что собрала всех присутствующих здесь, во время каникул.|W|character_lentoln sigh",
		"Но дело касается всех присутсвующих на школьной поездке по западной Украине. Откладывать это дело на неделю - неуважение к потерпевшим.",
		"Тёмыч: А еще, вас бы за это порвали на британский флаг.|W|character_temich kekk",
		"Е. Анатольевна: Не без этого, признаюсь.|W|character_lentoln hmm",
		"Егорыч: (Тьоха сидит на стуле консула, но тем не менее, права у него ограниченнее, чем у женщин в талибском Афганистане)|B|character_egorich thinks",
		"(...Что такое 'Талибан'?)|B|character_egorich suspects",
		"Е. Анатольевна: Соня, докладывай.|W|character_lentoln kek",
		"Соня: 45 обворовано.|Y|character_sonya death|STOP all",
		"Егорыч: СКОЛЬКО?!|W|character_egorich all_of_sudden|---|REACT damage",
		"Е. Анатольевна: ЧТО!|W|character_lentoln omg|---|REACT damage",
		"Тёмыч: ЕБ--|W|character_temich damn|---|REACT damage",
		"Соня: 3,250|Y|character_sonya death|---|REACT frustration|show money",
		"...|W",
		"Е. Анатольевна: ...Информативно.|W|character_lentoln sigh",
		"Е. Анатольевна: Что же, суд требует подсудимого объясниться.|W|character_lentoln hmm|START enterwit",
		"Тёмыч: А типа показания подозреваемого сильно кому-то нужны?|W|character_temich dadada",
		"Егорыч: Как видишь.|W|character_egorich idk",
		"Тёмыч: Ну ладно.",
		"--- Исповедь Тьохи ---|R|character_temich2 default|STOP all|REACT intro_woosh",
		"Тёмыч: Я был под пристальным надзором Егогорыча всё это время. Если и грабить, то не без его помощи.|W|character_temich2 kekk|START examination-moderato",
		"Тёмыч: Но обвиняют в преступлении только меня, так что Егорыча оставляем за скобками, тем более, он скорее запустит Титанаванне маслину в лоб, чем грабанёт кого-то или поможет грабануть кого-то.",
		"Тёмыч: Когда я выворачивал карманы, из них ничего не выпадало. Они были пусты!|W|character_temich2 rage",
		"Тёмыч: Как и обвинения в мою сторону от девочки, чью сестру я спас от детской комнаты милиции!",
		"Тёмыч: Которая 'сосётся' с паханом на 3 года её старше, что как бы намекает, что нет у неё ни стыда, ни совести!",
		"Е. Анатольевна: Чё-то вы все какие-то информативные сегодня...|W|character_lentoln kek|STOP all",
		"Егорыч: Что же, я займусь этим.",
		"OUT res://scenes/case_3/trial_1/trial_2_interogate.tscn",
	]
