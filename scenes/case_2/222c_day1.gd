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
func _ready():
	Dialogue = [ # диалоги. 
		"",
		"5 октября, 12:00. Номер 222с. G",
		"Тёмыч: хрр... W",
		"Егорыч: Тьоха, вставай, уже 12 часов.",
		"Пошли гулять.",
		"Тёмыч: (...задрал уже) B",
		"Егорыч: Тьохааа W",
		"Тёмыч: *неразборчиво* иди в жопу...",
		"Егорыч: Тьохааааа",
		"Тёмыч: ...",
		"Егорыч: ТЬОХА ВСТАВАЙ ПОТОЛОК ПАДАЕТ!!!!11 R",
		"Тёмыч: Аааа Егогорыч да ты задрал уже чертила ааааАААА. W",
		"Егорыч: Бывает...",
		"MAIN",
		"Тёмыч: Зеркало.", # 14
		"Хмм, странно.",
		"Я вижу в этом зеркале восхитительного адвоката",
		"Умного программиста",
		"Талантливого физика",
		"И крутого поцыка.",
		"Егорыч: Но ведь в зеркале всего лишь ты.",
		"Тёмыч: Ооо, а польщен, Егогорыч, весьма польщен.",
		"Егорыч: А не какого-то там адвоката или еще кого-то",
		"Тёмыч: ...",
		"(Встретимся в суде) B",
		"EXAM",
		"Тёмыч: Я бы еще поспал,", # 26
		"Но этот Ирод окаянный мне не позволит",
		"Егорыч: Ооо, будь уверен, Тьоха, я тебе точно не позволю",
		"Тёмыч: Ух, Егогорыч, желаю тебе когда нибудь не выспаться",
		"И чтоб тебя разбудили в 12 часов утра",
		"Егорыч: ...",
		"EXAM",
		"Тёмыч: Егорыч, к оружию!", # 33
		"Егорыч: Зачем?",
		"Тёмыч: Кто знает, что прячется за этой дверью?",
		"Егорыч: ...А что там может прятаться?",
		"Тёмыч: Ну, не знаю, но всё же",
		"Застанем его врасплох пока оно нас не застал врасплох!",
		"Егорыч: ...А может просто не будем открывать этот портал в ад?",
		"Тёмыч: Ух, скучный ты человек, Егогорыч...",
		"(...Какие секреты он прячет за этой дверью?) B",
		"EXAM",
		"Тёмыч: Егогорыч, чем займемся?", # 43, "Идеи?"
		"Егорыч: В подсопке, где было заседание, есть швабры и веники",
		"Тёмыч: О-хо-хох-хох-хо!!!",
		"Егорыч: Способность хохотать - не признак владения веником",
		"Тёмыч: Выше гордость - больнее провал!",
		"Егорыч: О, тут и начинается веселье...!",
		"Тёмыч: Всё кончено, Егорыч, я стою выше тебя!",
		"Егорыч: Ты недооцениваешь мою мощь...!",
		"Тёмыч: Не пытайся...!",
		"Егорыч: ... Че мы вообще творим?",
		"CHAT",
		"Егорыч: Я жрать хочу.",
		"Тёмыч: Как я тебя понимаю...",
		"Шо, в столовку тогда пойдём?",
		"Егорыч: Ну, хотя бы в направлении столовки",
		"Тёмыч: Ну пошли, тогда уж",
		"(Интересно, у них пельмени есть?) B",
		"CHAT",
		"Тёмыч: Егогорыч, зырь",
		"Егорыч: Зырю, И?",
		"Тёмыч: И?",
		"Егорыч: Давай ближе к делу, а?",
		"Тёмыч: ...Как бы то ни было.",
		"MAIN",
		"",
		"5 октября. Около 14 часов дня. Номер 222с. G",
		"Тёмыч: Ух, набегался я знатно... W",
		"Егорыч: Тьоха, может пойдем еще проведем расследование?",
		"Тёмыч: Нет, спасибо, по-позже...",
		"(Фух, может кофея сделать?) B",
		"(Хотя... Нафиг надо?)",
		"Егорыч: Стоп... Ты видишь это? W",
		"Тёмыч: Что 'это'?",
		"Егорыч: ...Её.",
		"Тёмыч: ...?",
		"???: Таки вылупились, а?",
		"Тёмыч: ЕГОГОРЫЧ, К ОРУЖИЮ!",
		"Егорыч: Руки вверх, я шмаляю аккуратно, нейтрализую быстро!",
		"Тёмыч: (Он стреляет в глаза. Уже два суда против него устроили) B",
		"(В итоге я подкупил Лентольну 12 баллами по химии, инфе и олимпиадой по инфе)",
		"(Просто чтобы она не признала его виновным в атаке на Ивана Кирова.)",
		"???: Эй, вы что творите? W",
		"Ну согласна, нужно было вас дождаться, постучаться",
		"Но и вы же должны были дверь закрыть?",
		"Тёмыч: Ты не закрыл дверь?",
		"Егорыч: Может, это 'ты' не закрыл дверь?",
		"Тёмыч: Как бы то ни было...!",
		"НЕ ДУРИ, РУКИ В ГОРУ!",
		"???: Та блин, задолбали уже",
		"Я просто поговорить пришла.",
		"Тёмыч: Да? Ну-ну...",
		"MAIN",
		"Тёмыч: Кто ты такая? W", # 96, identify yourself nigga
		"Маша: Меня зовут Маша Фильмонова",
		"Тёмыч: (Фига фамилия у человека стрёмная...) B",
		"И что ты здесь делаешь? W",
		"Маша: Вы же знаете, что Ирку слили?",
		"Тёмыч: Кого?",
		"Маша: Иру Жарову из 8-Г, говорю.",
		"Тёмыч: (Это та, которую мы нашли в сквере рядом с парком?) B",
		"Егорыч: Давайте договоримся, что под любыми словами, описывающими жертву в этом деле W",
		"Мы будем иметь ввиду 'избили'",
		"В конце-концов, она сейчас должна быть в мéде",
		"Восстанавливаться",
		"Но не в морге.",
		"'Осматриваться'",
		"Маша: Как хотите. В общем, в этом начали подозревать меня",
		"Тёмыч: Пазл сложился. Тебе нужен адвокат?",
		"Маша: Да! Ты же этот, как его там, Артём Зенец?",
		"Тёмыч: (...На слух никто никогда не узнает, что моя фамилия пишется через 'и') B",
		"Маша: Вот, ты мне и нужен. W",
		"Тёмыч: Ясно.",
		"Стоп, погоди, разве это еще может рассматриваться школьным судом?",
		"Маша: В смысле?",
		"Тёмыч: Если я не ошибаюсь, применили холодное оружие. Это - статься ККУ {Криминального Кодекса Украины}",
		"Жертву избили до переломов и пырнули веткой. Это - другая статься ККУ.",
		"И все выглядит так, как будто бы было спланировано самое настоящее *убийство*. Это - статья 115, либо какой-то её пункт как минимум",
		"До 10 лет тюрьмы, вроде?",
		"Разве это еще может рассматриваться нами?",
		"Маша: Слушай, друг, я не знаю, можно или не можно. Просто *надо* и все",
		"Тёмыч: (Действительно. Сейчас важнее разобраться с ситуацией, а не понять, откуда у нас такие полномочия)",
		"А чем ты занимаешься? W",
		"Расскажи о себе, может...",
		"Маша: Ну... Я рисую. А что?",
		"Тёмыч: ...Та нет, ничего.",
		"Забей.",
		"CHAT",
		"Маша: Эта Ирка...", # 131, суть дела
		"Она увела у меня парня.",
		"Но мне всё равно. Если он ушел, значит он меня не любит. Зачем мне за него бороться?",
		"Насильно мил не будешь, а?",
		"Тёмыч: Скорее 'если у тебя нет глока, от парня не будет и прока'",
		"Егорыч: Ты слегка накосячил, когда придумывал этот 'афоризм', но сойдёт",
		"Маша: При любом раскладе, этого хватило, чтобы подозревать меня в том, что я кого-то там избила",
		"Тёмыч: Где ты была в момент, когда произошло это преступление?",
		"Маша: А когда оно произошло?",
		"Тёмыч: ...Действительно.",
		"Стоп, они тебя не спрашивали?",
		"Маша: Нет, она меня не спрашивала.",
		"Тёмыч: Странно.",
		"...Стоп, кто 'она'? Соня Виноградова?",
		"Ну тогда ясно, почему она спрашивала.",
		"И тебя никто не посвящал в детали дела?",
		"Маша: Нет.",
		"Я сама ничего не знаю.",
		"Вопросы по этому делу мне задавать бесполезно. Честно.",
		"Тёмыч: Жалко...",
		"CHAT",
		"Тёмыч: Маша, что ты можешь сказать про Соню?", # 152, Соня
		"Маша: Брр!",
		"Тёмыч: Эм, что?",
		"Маша: Я н-не хочу об этом г-говорить...",
		"Тёмыч: ('Об этом'?) B",
		"Маша: Она просто шизанутая. W",
		"Тёмыч: Что?",
		"Маша: В *тихом* омуте чертилы водятся.",
		"Даже не черти. Чертилы.",
		"Тёмыч: (Мне нравится этот... подбор слов) B",
		"Маша: Просто конченая... W",
		"Тёмыч: Почему же?",
		"Маша: Рассказываю. Она меня чуть не убила.",
		"Я покупала пирожок в столовке и обсчитала продавца-еврея на пять гривень.",
		"Тёмыч: Них-- кхм, продолжай.",
		"(Сумасшедшая) B",
		"Маша: Но когда я выходила из столовой, она меня гопстопнула. W",
		"Даже не стопанула. Конкретно гопстопнула.",
		"И начала смотреть на меня. Нет, не на меня: мне. В глаза.",
		"Я на неё не совсем обратила внимания и пошла своей дорогой.",
		"Попыталась пойти своей дорогой, точнее, как вдруг...",
		"Она меня схватила за плечо.",
		"Я попыталась высвободиться, но при первой попытке стряхнуть её...",
		"...",
		"Она сжала свою руку.",
		"Причем так сильно... У неё еще были ногти длинные, острые, она на мне даже шрамы оставила, наверное.",
		"Это было так больно, что я закричала. Только когда нас начали растаскивать дежурные, она то ли устала, то ли пощадила меня.",
		"Она практически вырвала у меня мою руку...",
		"Тёмыч: Ничего себе...",
		"Маша: Ты же видел её уже?",
		"Тёмыч: Да, а что? Вроде как, не проявляла признаков агрессии",
		"(Может потому, что я не пытался обсчитать продавщицу.) B",
		"Маша: Видел же её рожу? Глаза? W",
		"Она в тени, её зрачки перекрывают радужку.",
		"Но тогда, её зрачки немножко сузились. От перенапряжения, наверное",
		"Или просто напряжения, не знаю. В общем, тогда я впервые увидела её ядовитые, жёлтые глаза",
		"Ужас... Я за тебя переживаю, Тём",
		"Тёмыч: Ничего страшного, переживу.",
		"(Она такая агрессивная?) B",
		"(Слабо верится.)",
		"(Но ладно, допустим.)",
		"OUT res://scenes/case_2/320a_day1.tscn",
		"",
	]
	Chats = [ # массив, в котором все, кроме последних 3 *БУКВ* - названия кнопок, а последние 3 буквы - номер строки
		"Идеи?  43",
		"Что делать? 54",
		"",
		"",
	]
	Moves = [ # массив с названиями кнопок перехода и целью куда они переводят
		"Столовая res://scenes/case_2/mess_day1.tscn",
		"",
		"",
		"",
	]
	Music = [
		"",
		"6 октября, 12:00. Номер 222с. G",
		"START peaceful_day",
		"Егорыч: Тьоха, вставай, уже 12 часов.",
		"Пошли гулять.",
		"Тёмыч: (...задрал уже) B",
		"Егорыч: Тьохааа W",
		"Тёмыч: *неразборчиво* иди в жопу...",
		"Егорыч: Тьохааааа",
		"Тёмыч: ...",
		"Егорыч: ТЬОХА ВСТАВАЙ ПОТОЛОК ПАДАЕТ!!!!11 R",
		"Тёмыч: Аааа Егогорыч да ты задрал уже чертила ааааАААА. W",
		"Егорыч: Бывает...",
		"START peaceful_day",
		"Тёмыч: Зеркало.", # 14
		"Хмм, странно.",
		"Я вижу в этом зеркале восхитительного адвоката",
		"Умного программиста",
		"Талантливого физика",
		"И крутого поцыка.",
		"Егорыч: Но ведь в зеркале всего лишь ты.",
		"Тёмыч: Ооо, а польщен, Егогорыч, весьма польщен.",
		"Егорыч: А не какого-то там адвоката или еще кого-то",
		"Тёмыч: ...",
		"(Встретимся в суде) B",
		"EXAM",
		"Тёмыч: Я бы еще поспал,", # 26
		"Но этот Ирод окаянный мне не позволит",
		"Егорыч: Ооо, будь уверен, Тьоха, я тебе точно не позволю",
		"Тёмыч: Ух, Егогорыч, желаю тебе когда нибудь не выспаться",
		"И чтоб тебя разбудили в 12 часов утра",
		"Егорыч: ...",
		"EXAM",
		"Тёмыч: Егорыч, к оружию!", # 33
		"Егорыч: Зачем?",
		"Тёмыч: Кто знает, что прячется за этой дверью?",
		"Егорыч: ...А что там может прятаться?",
		"Тёмыч: Ну, не знаю, но всё же",
		"Застанем его врасплох пока оно нас не застал врасплох!",
		"Егорыч: ...А может просто не будем открывать этот портал в ад?",
		"Тёмыч: Ух, скучный ты человек, Егогорыч...",
		"(...Какие секреты он прячет за этой дверью?) B",
		"EXAM",
		"Тёмыч: Егогорыч, чем займемся?", # 43, "Идеи?"
		"Егорыч: В подсопке, где было заседание, есть швабры и веники",
		"Тёмыч: О-хо-хох-хох-хо!!!",
		"Егорыч: Способность хохотать - не признак владения веником",
		"Тёмыч: Выше гордость - больнее провал!",
		"Егорыч: О, тут и начинается веселье...!",
		"Тёмыч: Всё кончено, Егорыч, я стою выше тебя!",
		"Егорыч: Ты недооцениваешь мою мощь...!",
		"Тёмыч: Не пытайся...!",
		"Егорыч: ... Че мы вообще творим?",
		"CHAT",
		"Егорыч: Я жрать хочу.",
		"Тёмыч: Как я тебя понимаю...",
		"Шо, в столовку тогда пойдём?",
		"Егорыч: Ну, хотя бы в направлении столовки",
		"Тёмыч: Ну пошли, тогда уж",
		"(Интересно, у них пельмени есть?)",
		"CHAT",
		"Тёмыч: Егогорыч, зырь",
		"Егорыч: Зырю, И?",
		"Тёмыч: И?",
		"Егорыч: Давай ближе к делу, а?",
		"Тёмыч: ...Как бы то ни было.",
		"MAIN",
		"",
		"5 октября. Около 14 часов дня. Номер 222с. G",
		"Тёмыч: Ух, набегался я знатно... W",
		"Егорыч: Тьоха, может пойдем еще проведем расследование?",
		"Тёмыч: Нет, спасибо, по-позже...",
		"(Фух, может кофея сделать?) B",
		"(Хотя... Нафиг надо?)",
		"Егорыч: Стоп... Ты видишь это? W",
		"Тёмыч: Что 'это'?",
		"Егорыч: ...Её.",
		"Тёмыч: ...?",
		"???: Таки вылупились, а?",
		"Тёмыч: ЕГОГОРЫЧ, К ОРУЖИЮ!",
		"Егорыч: Руки вверх, я шмаляю аккуратно, нейтрализую быстро!",
		"Тёмыч: (Он стреляет в глаза. Уже два суда против него устроили) B",
		"(В итоге я подкупил Лентольну 12 баллами по химии, инфе и олимпиадой по инфе)",
		"(Просто чтобы она не признала его виновным в атаке на Ивана Кирова.)",
		"???: Эй, вы что творите? W",
		"Ну согласна, нужно было вас дождаться, постучаться",
		"Но и вы же должны были дверь закрыть?",
		"Тёмыч: Ты не закрыл дверь?",
		"Егорыч: Может, это 'ты' не закрыл дверь?",
		"Тёмыч: Как бы то ни было...!",
		"НЕ ДУРИ, РУКИ В ГОРУ!",
		"???: Та блин, задолбали уже",
		"Я просто поговорить пришла.",
		"Тёмыч: Да? Ну-ну...",
		"START investigation_op MAIN",
		"Тёмыч: Кто ты такая? W", # 94, identify yourself nigga
		"Маша: Меня зовут Маша Фильмонова",
		"Тёмыч: (Фига фамилия у человека стрёмная...) B",
		"И что ты здесь делаешь? W",
		"Маша: Вы же знаете, что Ирку слили?",
		"Тёмыч: Кого?",
		"Маша: Иру Жарову из 8-Г, говорю.",
		"Тёмыч: (Это та, которую мы нашли в сквере рядом с парком?) B",
		"Егорыч: Давайте договоримся, что под любыми словами, описывающими жертву в этом деле",
		"Мы будем иметь ввиду 'избили'",
		"В конце-концов, она сейчас должна быть в мéде",
		"Восстанавливаться",
		"Но не в морге.",
		"'Осматриваться'",
		"Маша: Как хотите. В общем, в этом начали подозревать меня",
		"Тёмыч: Пазл сложился. Тебе нужен адвокат?",
		"Маша: Да! Ты же этот, как его там, Артём Зенец?",
		"Тёмыч: (...На слух никто никогда не узнает, что моя фамилия пишется через 'и') B",
		"Маша: Вот, ты мне и нужен. W",
		"Тёмыч: Ясно.",
		"Стоп, погоди, разве это еще может рассматриваться школьным судом?",
		"Маша: В смысле?",
		"Тёмыч: Если я не ошибаюсь, применили холодное оружие. Это - статься ККУ {Криминального Кодекса Украины}",
		"Жертву избили до переломов и пырнули веткой. Это - другая статься ККУ.",
		"И все выглядит так, как будто бы было спланировано самое настоящее *убийство*. Это - статья 115, либо какой-то её пункт как минимум",
		"До 10 лет тюрьмы, вроде?",
		"Разве это еще может рассматриваться нами?",
		"Маша: Слушай, друг, я не знаю, можно или не можно. Просто *надо* и все",
		"Тёмыч: (Действительно. Сейчас важнее разобраться с ситуацией, а не понять, откуда у нас такие полномочия)",
		"А чем ты занимаешься? W",
		"Расскажи о себе, может...",
		"Маша: Ну... Я рисую. А что?",
		"Тёмыч: ...Та нет, ничего.",
		"Забей.",
		"CHAT",
		"Маша: Эта Ирка...", # 124, суть дела
		"Она увела у меня парня.",
		"Но мне всё равно. Если он ушел, значит он меня не любит. Зачем мне за него бороться?",
		"Насильно мил не будешь, а?",
		"Тёмыч: Скорее 'если у тебя нет глока, от парня не будет и прока'",
		"Егорыч: Ты слегка накосячил, когда придумывал этот 'афоризм', но сойдёт",
		"Маша: При любом раскладе, этого хватило, чтобы подозревать меня в том, что я кого-то там избила",
		"Тёмыч: Где ты была в момент, когда произошло это преступление?",
		"Маша: А когда оно произошло?",
		"Тёмыч: ...Действительно.",
		"Стоп, они тебя не спрашивали?",
		"Маша: Нет, она меня не спрашивала.",
		"Тёмыч: Странно.",
		"...Стоп, кто 'она'? Соня Виноградова?",
		"Ну тогда ясно, почему она спрашивала.",
		"И тебя никто не посвящал в детали дела?",
		"Маша: Нет.",
		"Я сама ничего не знаю.",
		"Вопросы по этому делу мне задавать бесполезно. Честно.",
		"Тёмыч: Жалко...",
		"CHAT",
		"Тёмыч: Маша, что ты можешь сказать про Соню?", # 145, Соня
		"Маша: Брр!",
		"Тёмыч: Эм, что?",
		"Маша: Я н-не хочу об этом г-говорить...",
		"Тёмыч: ('Об этом'?) B",
		"Маша: Она просто шизанутая. W",
		"Тёмыч: Что?",
		"Маша: В *тихом* омуте чертилы водятся.",
		"Даже не черти. Чертилы.",
		"Тёмыч: (Мне нравится этот... подбор слов) B",
		"Маша: Просто конченая... W",
		"Тёмыч: Почему же?",
		"Маша: Рассказываю. Она меня чуть не убила.",
		"Я покупала пирожок в столовке и обсчитала продавца-еврея на пять гривень.",
		"Тёмыч: Них-- кхм, продолжай.",
		"(Сумасшедшая) B",
		"Маша: Но когда я выходила из столовой, она меня гопстопнула. W",
		"Даже не стопанула. Конкретно гопстопнула.",
		"И начала смотреть на меня. Нет, не на меня: мне. В глаза.",
		"Я на неё не совсем обратила внимания и пошла своей дорогой.",
		"Попыталась пойти своей дорогой, точнее, как вдруг...",
		"Она меня схватила за плечо.",
		"Я попыталась высвободиться, но при первой попытке стряхнуть её...",
		"...",
		"Она сжала свою руку.",
		"Причем так сильно... У неё еще были ногти длинные, острые, она на мне даже шрамы оставила, наверное.",
		"Это было так больно, что я закричала. Только когда нас начали растаскивать дежурные, она то ли устала, то ли пощадила меня.",
		"Она практически вырвала у меня мою руку...",
		"Тёмыч: Ничего себе...",
		"Маша: Ты же видел её уже?",
		"Тёмыч: Да, а что? Вроде как, не проявляла признаков агрессии",
		"(Может потому, что я не пытался обсчитать продавщицу.) B",
		"Маша: Видел же её рожу? Глаза? W",
		"Она в тени, её зрачки перекрывают радужку.",
		"Но тогда, её зрачки немножко сузились. От перенапряжения, наверное",
		"Или просто напряжения, не знаю. В общем, тогда я впервые увидела её ядовитые, жёлтые глаза",
		"Ужас... Я за тебя переживаю, Тём",
		"Тёмыч: Ничего страшного, переживу.",
		"(Она такая агрессивная?) B",
		"(Слабо верится.)",
		"(Но ладно, допустим.)",
		"CHAT",
		"",
	]
	Shows = [ # массив, в котором первое слово - улика, а 2 - номер строки, на который перекинет игрока, если ее показать
		"badge 61",
	]
	Anims = [ # массив, в котором 1 слово это перс, а 2 - его анимка
		"",
		"6 октября, 12:00. Номер 222с. G",
		"character_egorich SHOW Тёмыч: хрр... W",
		"character_egorich laugh Егорыч: Тьоха, вставай, уже 12 часов.",
		"character_egorich suspects Пошли гулять.",
		"Тёмыч: (...задрал уже) B",
		"character_egorich idk Егорыч: Тьохааа W",
		"character_egorich sigh Тёмыч: *неразборчиво* иди в жопу...",
		"character_egorich default Егорыч: Тьохааааа",
		"Тёмыч: ...",
		"character_egorich laugh Егорыч: ТЬОХА ВСТАВАЙ ПОТОЛОК ПАДАЕТ!!!!11 R",
		"Тёмыч: Аааа Егогорыч да ты задрал уже чертила ааааАААА. W",
		"character_egorich SHOW Егорыч: Бывает...",
		"MAIN",
		"Тёмыч: Зеркало.", # 14
		"Хмм, странно.",
		"Я вижу в этом зеркале восхитительного адвоката",
		"Умного программиста",
		"Талантливого физика",
		"И крутого поцыка.",
		"character_egorich suspects Егорыч: Но ведь в зеркале всего лишь ты.",
		"Тёмыч: Ооо, а польщен, Егогорыч, весьма польщен.",
		"character_egorich yee Егорыч: А не какого-то там адвоката или еще кого-то",
		"Тёмыч: ...",
		"(Встретимся в суде) B",
		"EXAM",
		"Тёмыч: Я бы еще поспал,", # 26
		"Но этот Ирод окаянный мне не позволит",
		"character_egorich default Егорыч: Ооо, будь уверен, Тьоха, я тебе точно не позволю",
		"Тёмыч: Ух, Егогорыч, желаю тебе когда нибудь не выспаться",
		"И чтоб тебя разбудили в 12 часов утра",
		"Егорыч: ...",
		"EXAM",
		"Тёмыч: Егорыч, к оружию!", # 33
		"character_egorich thinks Егорыч: Зачем?",
		"Тёмыч: Кто знает, что прячется за этой дверью?",
		"Егорыч: ...А что там может прятаться?",
		"Тёмыч: Ну, не знаю, но всё же",
		"Застанем его врасплох пока оно нас не застал врасплох!",
		"character_egorich suspects Егорыч: ...А может просто не будем открывать этот портал в ад?",
		"Тёмыч: Ух, скучный ты человек, Егогорыч...",
		"character_egorich idk (...Какие секреты он прячет за этой дверью?) B",
		"EXAM",
		"Тёмыч: Егогорыч, чем займемся?", # 43, "Идеи?"
		"Егорыч: В подсопке, где было заседание, есть швабры и веники",
		"character_egorich yee Тёмыч: О-хо-хох-хох-хо!!!",
		"character_egorich suspects Егорыч: Способность хохотать - не признак владения веником",
		"Тёмыч: Выше гордость - больнее провал!",
		"character_egorich laugh Егорыч: О, тут и начинается веселье...!",
		"Тёмыч: Всё кончено, Егорыч, я стою выше тебя!",
		"Егорыч: Ты недооцениваешь мою мощь...!",
		"Тёмыч: Не пытайся...!",
		"character_egorich idk Егорыч: ... Че мы вообще творим?",
		"CHAT",
		"character_egorich suspects Егорыч: Я жрать хочу.",
		"Тёмыч: Как я тебя понимаю...",
		"Шо, в столовку тогда пойдём?",
		"character_egorich thinks Егорыч: Ну, хотя бы в направлении столовки",
		"Тёмыч: Ну пошли, тогда уж",
		"(Интересно, у них пельмени есть?)",
		"CHAT",
		"Тёмыч: Егогорыч, зырь", # 61
		"character_egorich suspects Егорыч: Зырю, И?",
		"Тёмыч: И?",
		"character_egorich idk Егорыч: Давай ближе к делу, а?",
		"Тёмыч: ...Как бы то ни было.",
		"MAIN",
		"",
		"5 октября. Около 14 часов дня. Номер 222с. G",
		"character_egorich thinks Тёмыч: Ух, набегался я знатно... W",
		"character_egorich SHOW Егорыч: Тьоха, может пойдем еще проведем расследование?",
		"Тёмыч: Нет, спасибо, по-позже...",
		"(Фух, может кофея сделать?) B",
		"(Хотя... Нафиг надо?)",
		"Егорыч: Стоп... Ты видишь это? W",
		"Тёмыч: Что 'это'?",
		"Егорыч: ...Её.",
		"character_masha hey Тёмыч: ...?",
		"character_masha SHOW ???: Таки вылупились, а?",
		"character_egorich rage Тёмыч: ЕГОГОРЫЧ, К ОРУЖИЮ!",
		"character_egorich SHOW Егорыч: Руки вверх, я шмаляю аккуратно, нейтрализую быстро!",
		"Тёмыч: (Он стреляет в глаза. Уже два суда против него устроили) B",
		"(В итоге я подкупил Лентольну 12 баллами по химии, инфе и олимпиадой по инфе)",
		"character_masha brr (Просто чтобы она не признала его виновным в атаке на Ивана Кирова.)",
		"character_masha SHOW ???: Эй, вы что творите? W",
		"character_masha sigh Ну согласна, нужно было вас дождаться, постучаться",
		"Но и вы же должны были дверь закрыть?",
		"character_egorich shrug Тёмыч: Ты не закрыл дверь?",
		"character_egorich SHOW Егорыч: Может, это 'ты' не закрыл дверь?",
		"character_masha brr Тёмыч: Как бы то ни было...!",
		"character_masha SHOW НЕ ДУРИ, РУКИ В ГОРУ!",
		"character_masha sigh ???: Та блин, задолбали уже",
		"Я просто поговорить пришла.",
		"Тёмыч: Да? Ну-ну...",
		"MAIN",
		"character_masha SHOW Тёмыч: Кто ты такая? W", # 94, identify yourself nigga
		"Маша: Меня зовут Маша Фильмонова",
		"Тёмыч: (Фига фамилия у человека стрёмная...) B",
		"И что ты здесь делаешь? W",
		"Маша: Вы же знаете, что Ирку слили?",
		"Тёмыч: Кого?",
		"Маша: Иру Жарову из 8-Г, говорю.",
		"character_egorich default Тёмыч: (Это та, которую мы нашли в сквере рядом с парком?) B",
		"character_egorich SHOW Егорыч: Давайте договоримся, что под любыми словами, описывающими жертву в этом деле",
		"Мы будем иметь ввиду 'избили'",
		"В конце-концов, она сейчас должна быть в мéде",
		"Восстанавливаться",
		"character_egorich thinks Но не в морге.",
		"'Осматриваться'",
		"character_masha SHOW Маша: Как хотите. В общем, в этом начали подозревать меня",
		"Тёмыч: Пазл сложился. Тебе нужен адвокат?",
		"character_masha hey Маша: Да! Ты же этот, как его там, Артём Зенец?",
		"Тёмыч: (...На слух никто никогда не узнает, что моя фамилия пишется через 'и') B",
		"Маша: Вот, ты мне и нужен. W",
		"Тёмыч: Ясно.",
		"Стоп, погоди, разве это еще может рассматриваться школьным судом?",
		"Маша: В смысле?",
		"Тёмыч: Если я не ошибаюсь, применили холодное оружие. Это - статься ККУ {Криминального Кодекса Украины}",
		"Жертву избили до переломов и пырнули веткой. Это - другая статься ККУ.",
		"И все выглядит так, как будто бы было спланировано самое настоящее *убийство*. Это - статья 115, либо какой-то её пункт как минимум",
		"До 10 лет тюрьмы, вроде?",
		"Разве это еще может рассматриваться нами?",
		"Маша: Слушай, друг, я не знаю, можно или не можно. Просто *надо* и все",
		"Тёмыч: (Действительно. Сейчас важнее разобраться с ситуацией, а не понять, откуда у нас такие полномочия)",
		"А чем ты занимаешься? W",
		"Расскажи о себе, может...",
		"character_masha default Маша: Ну... Я рисую. А что?",
		"Тёмыч: ...Та нет, ничего.",
		"Забей.",
		"CHAT",
		"Маша: Эта Ирка...", # 124, суть дела
		"Она увела у меня парня.",
		"Но мне всё равно. Если он ушел, значит он меня не любит. Зачем мне за него бороться?",
		"Насильно мил не будешь, а?",
		"Тёмыч: Скорее 'если у тебя нет глока, от парня не будет и прока'",
		"Егорыч: Ты слегка накосячил, когда придумывал этот 'афоризм', но сойдёт",
		"Маша: При любом раскладе, этого хватило, чтобы подозревать меня в том, что я кого-то там избила",
		"Тёмыч: Где ты была в момент, когда произошло это преступление?",
		"Маша: А когда оно произошло?",
		"Тёмыч: ...Действительно.",
		"Стоп, они тебя не спрашивали?",
		"Маша: Нет, она меня не спрашивала.",
		"Тёмыч: Странно.",
		"...Стоп, кто 'она'? Соня Виноградова?",
		"Ну тогда ясно, почему она спрашивала.",
		"И тебя никто не посвящал в детали дела?",
		"Маша: Нет.",
		"Я сама ничего не знаю.",
		"Вопросы по этому делу мне задавать бесполезно. Честно.",
		"Тёмыч: Жалко...",
		"CHAT",
		"Тёмыч: Маша, что ты можешь сказать про Соню?", # 145, Соня
		"Маша: Брр!",
		"Тёмыч: Эм, что?",
		"Маша: Я н-не хочу об этом г-говорить...",
		"Тёмыч: ('Об этом'?) B",
		"Маша: Она просто шизанутая. W",
		"Тёмыч: Что?",
		"Маша: В *тихом* омуте чертилы водятся.",
		"Даже не черти. Чертилы.",
		"Тёмыч: (Мне нравится этот... подбор слов) B",
		"character_masha hey Маша: Просто конченая... W",
		"Тёмыч: Почему же?",
		"Маша: Рассказываю. Она меня чуть не убила.",
		"character_masha default Я покупала пирожок в столовке и обсчитала продавца-еврея на пять гривень.",
		"Тёмыч: Них-- кхм, продолжай.",
		"(Сумасшедшая) B",
		"Маша: Но когда я выходила из столовой, она меня гопстопнула. W",
		"Даже не стопанула. Конкретно гопстопнула.",
		"И начала смотреть на меня. Нет, не на меня: мне. В глаза.",
		"Я на неё не совсем обратила внимания и пошла своей дорогой.",
		"Попыталась пойти своей дорогой, точнее, как вдруг...",
		"character_masha brr Она меня схватила за плечо.",
		"Я попыталась высвободиться, но при первой попытке стряхнуть её...",
		"...",
		"Она сжала свою руку.",
		"Причем так сильно... У неё еще были ногти длинные, острые, она на мне даже шрамы оставила, наверное.",
		"Это было так больно, что я закричала. Только когда нас начали растаскивать дежурные, она то ли устала, то ли пощадила меня.",
		"Она практически вырвала у меня мою руку...",
		"Тёмыч: Ничего себе...",
		"character_masha hey Маша: Ты же видел её уже?",
		"Тёмыч: Да, а что? Вроде как, не проявляла признаков агрессии",
		"(Может потому, что я не пытался обсчитать продавщицу.) B",
		"Маша: Видел же её рожу? Глаза? W",
		"Она в тени, её зрачки перекрывают радужку.",
		"Но тогда, её зрачки немножко сузились. От перенапряжения, наверное",
		"Или просто напряжения, не знаю. В общем, тогда я впервые увидела её ядовитые, жёлтые глаза",
		"character_masha sigh Ужас... Я за тебя переживаю, Тём",
		"Тёмыч: Ничего страшного, переживу.",
		"(Она такая агрессивная?) B",
		"(Слабо верится.)",
		"(Но ладно, допустим.)",
		"CHAT",
		"",
	]
	
# СУКА БЛЯТЬ НЕ ТРОГАЙ ЭТО ГАНДОН НЕДОШТОПАННЫЙ АААААААААААААААААААААААА!!!!!!!!!!!!!!!!!!!!!!!!
	$characters_all/character_masha/desk.hide()
	loc_file.load(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
	if str(loc_file.get_value("Locations",filename)) == "1":
		if str(loc_file.get_value("Locations","res://scenes/case_2/park_day1.tscnchecked")) == "1":
			$investigation_screen.Cur = 67
			Chats[0] = "Кто ты   96"
			Chats[1] = "Суть дела  130"
			Chats[2] = "Соня   152"
		else: 
			$investigation_screen.Cur = 12
	for i in range(1,4):
		if Chats[i-1] != "":
			get_node("chat_"+str(i)).text = Chats[i-1].left(Chats[i-1].length()-3)
	for i in range(1,4):
		if Moves[i-1] != "":
			get_node("move_"+str(i)).text = Moves[i-1].left(Moves[i-1].length()-Moves[i-1].split(" ")[-1].length())
	print(Chats[0].split(" ")[-1])
	

func _on_chat_1_pressed():
	if $investigation_screen.State == "Chat" and Chats[0] != "":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int(Chats[0].split(" ")[-1])
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]


func _on_chat_2_pressed():
	if $investigation_screen.State == "Chat" and Chats[1] != "":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int(Chats[1].split(" ")[-1])
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]


func _on_chat_3_pressed():
	if $investigation_screen.State == "Chat" and Chats[2] != "":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int(Chats[2].split(" ")[-1])
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]


func _on_chat_4_pressed():
	if $investigation_screen.State == "Chat" and Chats[3] != "":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int(Chats[3].split(" ")[-1])
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]


func _on_move_1_pressed():
	if $investigation_screen.State == "Move" and Moves[0] != "":
		get_tree().change_scene(Moves[0].split(" ")[-1])


func _on_move_2_pressed():
	if $investigation_screen.State == "Move" and Moves[1] != "":
		get_tree().change_scene(Moves[1].split(" ")[-1])


func _on_move_3_pressed():
	if $investigation_screen.State == "Move" and Moves[2] != "":
		get_tree().change_scene(Moves[2].split(" ")[-1])

func _on_move_4_pressed():
	if $investigation_screen.State == "Move" and Moves[3] != "":
		get_tree().change_scene(Moves[3].split(" ")[-1])


func _on_poi_mouse_exited():
	$investigation_screen/crosshair.animation = "default"


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


func _on_poi_2_mouse_entered():
	if $investigation_screen.State == "Examine":
		if $investigation_screen.Checked[2] == false:
			$investigation_screen/crosshair.animation = "wut"
		else:
			$investigation_screen/crosshair.animation = "gotchu"


func _on_poi_2_pressed():
	if $investigation_screen.State == "Examine":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int($poi_2.text)
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]
		$investigation_screen.Checked[2] = true


func _on_poi_3_mouse_entered():
	if $investigation_screen.State == "Examine":
		if $investigation_screen.Checked[3] == false:
			$investigation_screen/crosshair.animation = "wut"
		else:
			$investigation_screen/crosshair.animation = "gotchu"


func _on_poi_3_pressed():
	if $investigation_screen.State == "Examine":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int($poi_3.text)
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]
		$investigation_screen.Checked[3] = true


func _on_poi_4_mouse_entered():
	if $investigation_screen.State == "Examine":
		if $investigation_screen.Checked[4] == false:
			$investigation_screen/crosshair.animation = "wut"
		else:
			$investigation_screen/crosshair.animation = "gotchu"


func _on_poi_4_pressed():
	if $investigation_screen.State == "Examine":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int($poi_4.text)
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]
		$investigation_screen.Checked[4] = true



func _on_verif_timeout():
	print("shitfuck")
	loc_file.set_value("Locations",str(filename),"1")
	loc_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
