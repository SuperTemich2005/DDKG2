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
		"character_temich wit",
	]
	Dialogue = [ # диалоги. 
		"",
		"Егорыч: Елена Анатольевна, в показаниях Тьохи есть противоречие!|W|character_egorich yee",
		"Тёмыч: И довольный такой|W|character_temich kekk",
		"Е. Анатольевна: И как же так?|W|character_lentoln hmm",
		"Егорыч: Тьоха говорит, что его карманы были пусты.|W|character_egorich paper",
		"Однако, Тьоха, не из твоего ли кармана...|W|character_egorich slam|---|REACT slam",
		"...вывалилась эта стопка?|W|character_egorich objection|---|REACT intro_woosh|show money",
		"Тёмыч: А!|W|character_temich damn|START egorich_objection|---",
		"Так... Это ж не из моего кармана!|W|character_temich rage",
		"Я напомню, что когда я выворачивал свои карманы, чтобы доказать, что чужих денег у меня нет,",
		"Эти деньги, да, выпали из того места, где у меня карманы.",
		"Но готов поклясться, что в этот же момент кто-то был рядом со мной и выбросил эту стопку",
		"В силу перспективы и прочей хрени показалось, что это из меня выпало. Но это мне подбросили!|W|character_temich kekk",
		"OBJECTION obj",
		"Соня: Кто|Y|character_sonya death",
		"Егорыч: Ну, кто-то, кто был рядом с Тьохой.|W|character_egorich thinks",
		"Соня: Кто|Y|character_sonya death",
		"Егорыч: (Видимо, она хочет, чтобы я назвал человека.)|B|character_egorich suspects",
		"(Но откуда я знаю? ...Странно, но я бы точно заметил, что кто-то подбрасывает Тьохе деньги!)|B",
		"(...Должно быть объяснение, иначе Тьоха - виновен.)",
		"Е. Анатольевна: То есть, ты хочешь сказать, что эти деньги тебе подбросили?|W|character_lentoln hmm",
		"Тёмыч: Нет, блин, это я их стырил и они у меня выпали, что теперь я пытаюсь отмазаться.|W|character_temich kekk",
		"Соня: ...|W|character_sonya death",
		"Егорыч: Спокойно, спокойно! Не надо выдвигать на этом протест, дорогая моя!|W|character_egorich all_of_sudden",
		"А ты, Тьоха, думай, что говоришь. Это вполне могла расценить Лентольна как признание в содеянном.",
		"Тёмыч: Ой всё...|W|character_temich comeon",
		"Соня: ...|W|character_sonya death|STOP all",
	]
