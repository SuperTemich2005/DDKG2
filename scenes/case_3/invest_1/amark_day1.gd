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
		"Егорыч: Отлично",
		"Погнали!|W|character_temich default|START investigation_op",
		"MAIN",
		"Егорыч: Меня зовут Егор Ищенко, я - временно исполняющий обязанности адвоката дежурный.|W|character_sewa default",
		"Беркут: А, ты горой будешь стоять за своего дружка, как последний подсос!|W|character_sewa rage",
		"Пускай ты лучше убедишь своего парня вернуть мне мои деньги! Я не могу купить эту булку!!!|W|character_sewa rage",
		"Егорыч: Что, простите? 'Парня'?!",
		"Соня: Кек|Y|character_sonya death",
		"Егорыч: 'Кек'?!|W",
		"Тёмыч: Не обращай внимания, этот звук иногда воспроизводится этим синтезатором самовольно.|W|character_temich wonder",
		"Это означает ошибку выделения памяти.|W|character_temich default",
		"Не так ли, Сонич?|W|character_temich kekk",
		"Соня: ...|W|character_sonya default",
		"Егорыч: (Действительно ли это был баг?)|B",
		"Беркут: Ага! Вот ты где, п*дрила! Гони деньги обратно!|W|character_sewa rage",
		"Соня: Молчать|Y|character_sonya death",
		"Беркут: !|W|character_sewa oi",
		"Соня: Говори тихо.|Y|character_sonya death",
		"Беркут: Х-Х-Хорошо...|W|character_sewa oi",
		"Тёмыч: Как хорошо, когда в твоём кругу друзей есть крыша.|W|character_temich kekk",
		"Егорыч: (Маленькая девочка крышует отдел в супермаркете. Отличная работа, Соня!)|B",
		"Соня: ...|W|character_sonya death",
		"Егорыч: Так вот, хотел спросить по поводу обстоятельств кражи у тебя денег.|W|character_sewa default",
		"Беркут: Ага, ага, иди нах*й!|W|character_sewa rage",
		"Соня: Говори|Y|character_sonya death",
		"Беркут: Ой, то есть...|W|character_sewa oi",
		"Я думаю, что это произошло где-то в музее П*дракова.|W|character_sewa default",
		"Соня: Маты.|Y|character_sonya death",
		"Беркут: Ой, то есть|W|character_sewa oi",
		"Это произошло в музее Пирогова, да...|W|character_sewa default",
		"Я тогда тусил с одной тёлочкой, лапались там, сосались в другом кабинете...|W|character_sewa kaef",
		"Соня: Слышали.|Y|character_sonya death",
		"Егорыч: (Когда она успела стать моим консулом?)|B",
		"Тёмыч: Да, ты это делал прямо у нас на глазах.|W|character_temich default",
		"Беркут: В этот момент ты и ограбил нас, пид--|W|character_sewa rage",
		"Соня: ...|W|character_sonya death",
		"Беркут: ...Пидарунок з пид йолкы новоричний...|W|character_sewa oi",
		"Тёмыч: ДА пошёл ты со своими оскорблениями на--|W|character_temich rage",
		"Соня: ...|W|character_sonya death",
		"Тёмыч: ...На половчан, на кобяка дружину тую Святославлю!",
		"Беркут: Ну, в общем, да...|W|character_sewa default",
		"Егорыч: Но ведь--",
		"Тёмыч: Все свои обжекшены держи при себе до суда.|W|character_temich kekk",
		"Ты ж не хочешь выдавать все карты сразу же?",
		"Егорыч: ...Ты прав, надо придержать протестов своих...",
		"(Но ведь как он может 'подозревать' Тьоху в том, что он при свидетеле,)|B",
		"(Нарушающим свои личные границы,)",
		"(в ограблении? Почему они двое тут же не забили в колокол? Так были заняты друг другом???)",
		"Тёмыч: Да.|W|character_temich kekk",
		"Егорыч: (???)|B",
		"(Он прочел мои мысли?!)",
		"Тёмыч: Да.|W|character_temich wonder",
		"Егорыч: Ты серьезно?",
		"Тёмыч: В смысле? Я вообще-то с Соней разговариваю.|W|character_temich default",
		"Соня: ...|W|character_sonya death",
		"Не ты?|Y|character_sonya death",
		"Тёмыч: Та да, не я это, не я!|W|character_temich rage",
		"Я же не бессмертный, чтобы тебя шмонать!",
		"Егорыч: ...Как бы то ни было, ты проводил время с другим мальчиком и в это время тебя мог обокрасть Тьоха?|W|character_sewa default",
		"Беркут: Да.",
		"Тёмыч: ПОПАЛСЯ!|W|character_temich objection_1|START pursuit|REACT intro_woosh",
		"Беркут: Что? Где? В смысле?|W|character_sewa oi",
		"Соня: Другим мальчиком...|Y|character_sonya death",
		"Егорыч: Проиграй в голове мой вопрос заново.|W|character_sewa oi",
		"Беркут: ...|W|character_sewa oi|STOP ALL",
		"ААААААААА!!!!!!!!!|W|character_sewa rage",
		"НЕТ! НЕТ! НЕТ! НЕТ! НЕТ! НЕТ! НЕТ!",
		"С ДЕВОЧКОЙ! ДЕВУШКОЙ! ЖЕНЩИНОЙ! БАБОЙ!",
		"Тёмыч: Сфоткано в 4К.|W|character_temich kekk|START investigation_op",
		"Соня: ...|W|character_sonya death",
		"~~~ Показания Беркута добавлены в записи суда|B|character_temich objection_1|---|---|3|autopsy;Показания Беркута;Находясь в музее, Всеволод Беркут проводил время с девушкой. В это время, как он говорит, Артём Зинец мог украсть у него и, вероятно, у своей спутницы, заветные карманные.;1",
		"Тёмыч: Ладно, Егорыч. Давай кого-нибудь еще опросим.|W|character_temich kekk",
		"Егорыч: Обязательно.",
		"MAIN",
		"Егорыч: Меня зовут Егор Ищенко, я - временно исполняющий обязанности адвоката дежурный.|W|character_sonya death", # 90
		"Соня: ...",
		"Егорыч: ...Ради всего хорошего...",
		"Тьоха, у тебя нет никакой онгаку, чтобы её разговорить?|W|character_temich wonder",
		"Тёмыч: ... ... ...",
		"А! Что?|W|character_temich damn",
		"Извини, Егорыч, но одна такая штука уже использует немало волхвовских чудес|W|character_temich default",
		"А собирая его, я потратил все свои силы кудесника",
		"Уже не говорю о том, что её не пробьёт даже Святой Свет.|W|character_temich kekk",
		"Соня: ...|W|character_sonya death",
		"Егорыч: Ладно, покажи на пальцах хотя бы",
		"Сколько у тебя украли",
		"Соня: *5*",
		"Егорыч: 5 гривень?",
		"Соня: ...",
		"Егорыч: 50?",
		"Соня: ...",
		"Егорыч: Эмм, 500?",
		"Соня: ...",
		"Егорыч: Господи, 5,000?!",
		"Тёмыч: 'Я' украл всего лишь 3,250, Егорыч! Не навешивай на меня еще 5,000!|W|character_temich rage|---|---|show money",
		"У Сони с собой нет нала, '5' ничего не означает!",
		"Это даже не '5', она машет 'Нет'!",
		"Егорыч: Научи меня языкам жестов, Тьоха, ради всего хорошего!",
		"Тёмыч: Ну, если хорошо попросишь...|W|character_temich wonder",
		"Соня: ...|W|character_sonya default",
		"Егорыч: Может, ты была свидетелем чего-то...?",
		"Соня: Плащ.|Y|character_sonya death",
		"Егорыч: Плащ? Какой плащ?|W|character_sonya death",
		"Соня: *показывает на плащ под тележкой*",
		"Тёмыч: Действительно, там лежит плащ!",
		"*шорох*|R",
		"Тёмыч: Я нашел под стилажем вот этот плащ, правда форма напоминает больше...|W|character_temich rage|---|---|show hijab",
		"!|W|character_temich rage|STOP ALL|REACT surprise|show hijab",
		"???: Чи вам смакує?|R|character_halal default|---|---",
		"Егорыч: Это же...",
		"Соня: Хиджаб.|Y|character_sonya wtfbruh|START investigation_ed|---",
		"Егорыч: (Даже её это колыхнуло!)|B",
		"Соня: Девочка.|Y|character_sonya death",
		"Тёмыч: Ты имеешь ввиду Жеку-девку?|W|character_temich rage",
		"Егорыч: (Я давно не видел Тьоху таким серьезным...)|B",
		"Соня: ...|W|character_sonya death",
		"Тёмыч: У нас появилось к ней ой как много вопросов теперь, не так ли?|W|character_temich wonder",
		"Егорыч: Ага... Спасибо огромное, Соня!|W|character_sonya death",
		"~~~ Хиджаб подобран с пола|B|character_temich kekk|---|REACT fanfare_newev|4|hijab;Хиджаб;Найден Соней, которая указывает на Фильмонову-младшую.|1",
		"Егорыч: Ладно, из нее мы больше ничего не вытянем.|W|character_temich default",
		"Тёмыч: Согласен, пора искать новую жертву.|W|character_temich kekk",
		"MAIN",
		"Егорыч: Меня зовут ищенко Егор, я - исполняющий обязанности адвоката дежурный.|W|character_mashasis default",
		"Жека: Ааа, ты - друг того воришки?",
		"Егорыч: В этом вопросе нам еще предстоит разобраться. Я и несколько других человек считаем, что он не причастен к ограблениям.",
		"Жека: Да, конечно. Тебя же тоже ограбили, а деньги нашли у твоего 'друга'!|W|character_mashasis rage",
		"Егорыч: В этом-то и проблема: мой друг меня бы не стал обворовывать!",
		"Жека: !|R|character_mashasis zomg",
		"Егорыч: При каких обстоятельствах тебя обворовали?",
		"Жека: Я думаю, что в музее Пирогова.|W|character_mashasis default",
		"Егорыч: (О, а вот здесь уже становится интереснее.)|B",
		"Ты с кем-нибудь там была?|W",
		"С подружкой или кем-то другим? Сестрой, в конце-концов...",
		"Жека: Ну, я была с хорошим другом.|W|character_mashasis default",
		"Тёмыч: Тем, который только что у тебя за спиной рассказывал, как он с тобой в отдельном кабинете 'сосался'?|R|character_temich kekk|---|REACT damage",
		"Жека: Ч-ЧТО?!|W|character_mashasis wut",
	]
	#$investigation_screen.Cur = 119
	Chats = [
		"Допрос - Сева Беркут;3",
		"Допрос - Соня Виноградова;90",
		"Допрос - Женя Фильмонова;138",
		"Допрос - Елена Анатольевна",
	]
	Moves = [
		"Автобус",
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
