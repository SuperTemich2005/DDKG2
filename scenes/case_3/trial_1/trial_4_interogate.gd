extends Node2D
var Dialogue
var BoxColor
var Roles
var correct
var va
func _ready():
	correct = "5 report res://scenes/case_3/trial_1/trial_5.tscn 55"
	va = "egor"
	BoxColor = Color(0.5,1,0.5,1)
	Roles = [
		"character_egorich def",
		"character_lentoln jud",
		#"character_temich hld",
		"character_sonya pro",
		"character_sewa wit",
		"character_temich wit",
	]
	Dialogue = [ # диалоги. оффсет 20
		"Е. Анатольевна: Приступайте.",
		"--- Меня ограбили ---|R|character_sewa default|---|REACT intro_woosh",
		"Беркут: Какая-то сволочь украла у меня мои кровные деньги. 500!|G2|character_sewa rage|START2 examination-moderato|REACT damage|7",
		"Беркут: У моей девушки, уже бывшей, кстати, тоже. Не знаю, сколько именно.|G2|character_sewa default|---|---|21",
		"Беркут: Вчера в музее хренороба мы с девушкой гуляли одни и отвлеклись.|G2|character_sewa oi|---|---|31",
		"Беркут: В этот момент, Зинец и ограбил нас!|G2|character_sewa rage|---|---|45",
		"EJUMP 68",
		"Егорыч: 500 гривень? Это немало.|W|character_egorich thinks",
		"Беркут: Ну для тебя, нищеброда, может и много. А мне - даже маловато как-то.|W|character_sewa kaef",
		"Егорыч: Нет, не в этом смысле.|W|character_egorich paper",
		"Было украдено 3,250 у 45 человек, 3,250 поделить на 45 будет 72 гривны.",
		"У тебя украли, получается, больше всех денег?|W|character_egorich thinks",
		"OBJECTION obj",
		"Соня: У кого-то могли украсть 5 копеек. Таким образом, человек попадает в статистику, но по факту на неё не влияет.|Y|character_sonya death",
		"Егорыч: А у кого-то украли 5 копеек?|W|character_egorich suspects",
		"Соня: ...|W|character_sonya death",
		"Я к тому, что у него украли модную сумму, а не сумму выше средней|Y|character_sonya death",
		"Егорыч: Ааа...|W|character_egorich all_of_sudden",
		"Беркут: Бедный парень, мне тебя жалко.|W|character_sewa default",
		"Егорыч: (Мы еще посмотрим, кому кого будет жалко в конце-концов!)|B|character_egorich objection|---|REACT intro_woosh",
		"JUMP 2",
		"Егорыч: Это ты говоришь про 13-летнюю девочку, с которой, как ты вчера в ашане сказал, 'сосался'?|W|character_egorich suspects",
		"Беркут: Э! Подбирай базар!|W|character_sewa rage|---|REACT damage",
		"Соня: ...|W|character_sonya forceslam|---|REACT sith_slam",
		"Ты из этих, что ли?|Y",
		"Беркут: Из кого 'из этих'?|W|character_sewa oi",
		"Соня: ...|W|character_sonya death",
		"Беркут: Ну, возвращаясь к вопросу, да, про неё.|W|character_sewa default",
		"Е. Анатольевна: Так, а вот теперь у меня появились вопросы.|W|character_lentoln rage",
		"Беркут: Да ё-маё!!!|W|character_sewa rage|---|REACT frustration",
		"JUMP 3",
		"Егорыч: Отвлеклись на что?|W|character_egorich thinks",
		"Беркут: Не твоё дело.|W|character_sewa default",
		"Егорыч: Значит шпёхались.|W|character_egorich default",
		"Беркут: ЧТО?!|W|character_sewa oi|---|REACT damage",
		"Нет! Мы не дураки, чтобы делать это прямо в каком-то музее!|W|character_sewa rage",
		"Соня: А может и 'шпёхались'|Y|character_sonya death",
		"Е. Анатольевна: Да как у вас обоих язык поворачивается говорить такое при взрослых?|W|character_lentoln rage",
		"Тёмыч: Без обид, Лентольевна, но при вас как раз таки еще как можно такое говорить.|W|character_temich default",
		"А вот если б тут была какая-нибудь мелочь, например, Жека Фильмонова, то да, мы бы придержали гонор.|W|character_temich kekk",
		"... ... ...",
		"ХОТЯ ПОГОДИТЕ!|W|character_temich objection_1|---|REACT intro_woosh",
		"Егорыч: ХА-ХА-ХА-ХА-ХА-ХА-ХА-ХА!|W|character_egorich laugh",
		"Е. Анатольевна: Господи...|W|character_lentoln sigh",
		"JUMP 4",
		"Егорыч: Как можно ограбить двух людей у них под самым носом?|W|character_egorich thinks",
		"Беркут: У нас были закрыты глаза, а он на кортах сидел.|W|character_sewa default",
		"Вот мы его и не увидели.",
		"Егорыч: Но буквально секунду назад ты сказал это таким тоном, как будто видел его.|W|character_egorich suspects",
		"Беркут: А ты говоришь таким тоном, как будто ты долбо--|W|character_sewa oi",
		"Соня: Только попробуй.|Y|character_sonya death",
		"Беркут: ...Долбодеятель|W|character_sewa oi",
		"Егорыч: (Он вчера формулировал своё обвинение по-другому и у меня оно есть в записях суда.)|B|character_egorich suspects",
		"(Может, это оно?)",
		"JUMP 5",
		"Соня: Я не привыкла так много говорить|Y|character_sonya death",
		"Я предпочитаю слушать, наблюдать, думать...",
		"Но твои действия вынуждают меня идти на крайние меры и...",
		"...|W",
		"...",
		"...",
		"Егорыч: Ау?|W|character_egorich thinks",
		"Е. Анатольевна: Подожди, она выдаёт тебе пенальти.|W|character_lentoln kek",
		"Соня: ...|W|character_sonya death",
		"Егорыч: Эй, эй, эй, не надо!|W|character_egorich damage",
		"(Надо думать перед тем, как показывать улики.)|B",
		"(Может, *допрос* поможет)",
		"JUMP 2",
		"Егорыч: (Тьоха съехал отсюда в галлерку.)|B|character_egorich thinks",
		"(Правильно, т.к. уже появляются первые свиды, его нахождение на стороне защиты, пусть даже и в кресле консула, вызовет недоумение)",
		"(Я один по себе, но тем не менее, я смогу защитить честь Тьохи!)",
		"(Поехали!)|B|character_egorich yee",
		"JUMP 2",
	]