extends Node2D
var Anims
var Dialogue
var Chats
var Shows
var Moves
var Music
var Ev
var EvCount
var loc_file = ConfigFile.new()
func _ready():
	Dialogue = [ # диалоги. 
		"",
		"5 октября, 12:30. Сквер. G",
		"Тёмыч: Мы ходим уже... пол часа? W",
		"Егорыч: Ну да, где-то так.",
		"Тёмыч: Что же, сегодня мы посетили столовку, парк, сквер здесь какой-то, ",
		"Егорыч: Нам еще предстоит посетить много мест, плюс осмотреть само здание отеля.",
		"Тёмыч: И че мы так не сделали в первый день...?",
		"Егорыч: Хрен его знает, Тьоха.",
		"Тёмыч: Интересно, что делают сейчас люди дома...",
		"Егорыч: Я думаю, что хренью страдают",
		"Тёмыч: Не, то оно понятно, но конкретнее-то хотелось бы узнать...",
		"Егорыч: М, не знаю.",
		"Тёмыч: Стоять!",
		"Егорыч: Что? Что такое?",
		"Тёмыч: ... *фыркает*",
		"...Кейсом пахнет...",
		"Егорыч: Значит, здоровый, если запахи чувствуешь",
		"Тёмыч: Ну да, насморк у меня всё-таки ближе к зиме начинается",
		"Егорыч, за мной.",
		"Тёмыч: (Мне нужно осмотреть этот сквер) B",
		"... W",
		"...",
		"...",
		"Тёмыч: Мать моя женщина, Егогорыч!",
		"Егорыч: Что-то не так?",
		"Тёмыч: Зырь и зови Лентольну!",
		"Егорыч: Что? Куда?",
		"Тёмыч: За этим деревом кто-то лежит! И это явно не бомж/алкоголик/кто-либо-еще!",
		"Егорыч: Что?! Блин, надо срочно осмотреть это место!",
		"Тёмыч: Никогда мой нюх на кейсы меня не подводил, Егогорыч!",
		"Егогорыч: ...",
		"MAIN",
		"Тёмыч: Ау, красавица, просыпаемся!", # лицо, 32
		"Егорыч: Она вообще как, живая?",
		"Тёмыч: Да хрен его знает... Ну вроде дышит",
		"Егорыч: Надо проверить пульс!",
		"Тёмыч: Я у себя его через раз нахожу, а тут кому-то... Тем более, девке",
		"(В силу определенных обстоятельств, я начал избегать прикосновений к девочкам) B",
		"(Ну и, опять же, я в восьмом классе так и не научился нащупывать пульс)",
		"(Пускай этим займется... Егогооооорыыыыыыч?)",
		"Егорыч: Ты знаешь эту девку? W",
		"Тёмыч: Я вижу её впервые в жизни.",
		"Егорыч: Может учителя её опознают...",
		"*звонок*",
		"Алло, Елена Анатольевна? G",
		"Мы в сквере напротив выхода из четвертого блока, бегите сюда скорее!",
		"Тут такое случилось...!",
		"Тёмыч: (Он отлично навел суету на Лентольну. Думаю, она точно прийдёт.) B",
		"~~~ Тело добавлено в записи суда.",
		"EXAM",
		"Тёмыч: Посмотрим...", # 50, грудь
		"Егорыч: Эй, ты, что ты делаешь?!",
		"Тёмыч: Эм, я--",
		"Егорыч: Как ты... Как ты смеешь??",
		"Мародер!",
		"Тёмыч: Чё...??--",
		"Егорыч: Девочка, бедная, лежит, измученная, ей нужна помощь, а ты...!!!",
		"Смотри не сдохни, чертила!",
		"Тёмыч: Да я просто--",
		"Егорыч: Что 'просто'? А ниче, что если там сломалось у нее ребро, то ты можешь проткнуть ей лёгкое?",
		"Я не виноватым буду, все сразу на тебя буду валить",
		"Тёмыч: (Я хотел осмотреть тело на предмет травм. Не судьба...) B",
		"Тёмыч: Кстати, супермен-защитник-слабых, взгляни. W",
		"Егорыч: ...Ого, её пырнули чем-то?",
		"Тёмыч: Да, это явно ножевое ранение",
		"Нет, стой, рана тонкая: не как линия, а как точка",
		"Значит, ударили шилом.",
		"Егорыч: Или... рядом лежащей веткой.",
		"Тёмыч: (Рядом с телом этой девки лежит ветка. У неё на кончике есть пятно крови.) B",
		"(Надо осмотреть и эту улику)",
		"EXAM",
		"Тёмыч: Егорыч, это ветка.", # 71, ветка
		"Егорыч: Я не стану бежать за ней, как собака. Можешь и не пробовать.",
		"Тёмыч: Ты к чему?",
		"Егорыч: К тому, чтобы ты не кидал эту ветку за забор, как сделал месяц назад.",
		"Тёмыч: Ой.",
		"Действительно.",
		"Как бы то ни было, смотри, на кончике пятно крови.",
		"Егорыч: Ого, интересно.",
		"Тёмыч: Скажу так: чем бы эта штука не являлась, не добавить её в материалы дела - нарушение адвокатской этики и здравого смысла",
		"~~~ Ветка добавлена в улики. B",
		"EXAM",
		"Егорыч: Ого. Смотри, какая родинка большая", # 82, рука
		"И цветастая... Это меланома?",
		"Тёмыч: Эм, нет. Это синяк",
		"Егорыч: На руке? И такой формы странной...",
		"Тёмыч: Ха, даже не так.",
		"Это не просто синяк. Это, батинька, самый что ни на есть засос R",
		"Егорыч: Засос? W",
		"Тёмыч: Угу. У нашей девки точно был парень.",
		"Егорыч: Интересно... Да, я придумал!",
		"Мотив у преступницы: она увела парня у другой девки!",
		"Тёмыч: Или! Мотив у преступника: он узнал, что она изменяет с другим парнем и расправился со своей бывшей.",
		"Егорыч: Или! ...Та блин, давай отдадим эту головную боль Аполлонову или Ляхе",
		"Тёмыч: Если, конечно, Ляха будет прокурором.",
		"Егорыч: Угу...",
		"EXAM",
		"Тёмыч: Кастет? Откуда он взялся?", # 97, кастет
		"Егорыч: Кастеты запрещены по закону, как холодное оружие",
		"И я не думаю, что его можно купить даже с лицензией",
		"Хотя, кто знает. Вот складные ножи не считаются холодным оружием, может, и на кастеты такая логика действует?",
		"Тёмыч: ...Я понял, откуда он взялся.",
		"Егорыч: Как? Уже?! Откуда же, тогда, он взялся?",
		"Тёмыч: Егогорыч, видишь, он с торцов такой... рефленый?",
		"Егорыч: Угу. Это какая-то детализация?",
		"Тёмыч: Нет. Он просто некачественно напечатан на 3D принтере",
		"Я, как обладатель принтера моёйного, знаю, что экструдер, перемещаясь по оси Z, то есть вертикально,",
		"Каждую регистрацию слоя останавливается стоппором",
		"Если такой стоппор затянуть, а это, как правило, резинка или болтик,",
		"То новый слой будет слегка 'налазить' на предыдущий",
		"Егорыч: Принтер печатает слой поверх другого слоя?",
		"Тёмыч: Да. Тут - такой случай.",
		"Как бы то ни было, это очень важная улика, которая объяснит наличие множественных синяков и вывихов на теле жертвы",
		"~~~ Кастет добавлен в записи суда B",
		"EXAM",
		"",
	]
	Music = [
		"",
		"5 октября, 12:30. Сквер. G",
		"START peaceful_day Тёмыч: Мы ходим уже... пол часа? W",
		"Егорыч: Ну да, где-то так.",
		"Тёмыч: Что же, сегодня мы посетили столовку, парк, сквер здесь какой-то, ",
		"Егорыч: Нам еще предстоит посетить много мест, плюс осмотреть само здание отеля.",
		"Тёмыч: И че мы так не сделали в первый день...?",
		"Егорыч: Хрен его знает, Тьоха.",
		"Тёмыч: Интересно, что делают сейчас люди дома...",
		"Егорыч: Я думаю, что хренью страдают",
		"Тёмыч: Не, то оно понятно, но конкретнее-то хотелось бы узнать...",
		"Егорыч: М, не знаю.",
		"STOP Тёмыч: Стоять!",
		"Егорыч: Что? Что такое?",
		"Тёмыч: ... *фыркает*",
		"...Кейсом пахнет...",
		"Егорыч: Значит, здоровый, если запахи чувствуешь",
		"Тёмыч: Ну да, насморк у меня всё-таки ближе к зиме начинается",
		"Егорыч, за мной.",
		"Тёмыч: (Мне нужно осмотреть этот сквер) B",
		"... W",
		"...",
		"...",
		"START suspense Тёмыч: Мать моя женщина, Егогорыч!",
		"Егорыч: Что-то не так?",
		"Тёмыч: Зырь и зови Лентольну!",
		"Егорыч: Что? Куда?",
		"Тёмыч: За этим деревом кто-то лежит! И это явно не бомж/алкоголик/кто-либо-еще!",
		"Егорыч: Что?! Блин, надо срочно осмотреть это место!",
		"Тёмыч: Никогда мой нюх на кейсы меня не подводил, Егогорыч!",
		"STOP Егогорыч: ...",
		"START investigation_op MAIN",
		"Тёмыч: Ау, красавица, просыпаемся!", # лицо, 32
		"Егорыч: Она вообще как, живая?",
		"Тёмыч: Да хрен его знает... Ну вроде дышит",
		"Егорыч: Надо проверить пульс!",
		"Тёмыч: Я у себя его через раз нахожу, а тут кому-то... Тем более, девке",
		"(В силу определенных обстоятельств, я начал избегать прикосновений к девочкам) B",
		"(Ну и, опять же, я в восьмом классе так и не научился нащупывать пульс)",
		"(Пускай этим займется... Егогооооорыыыыыыч?)",
		"Егорыч: Ты знаешь эту девку? W",
		"Тёмыч: Я вижу её впервые в жизни.",
		"Егорыч: Может учителя её опознают...",
		"*звонок*",
		"Алло, Елена Анатольевна? G",
		"Мы в сквере напротив выхода из четвертого блока, бегите сюда скорее!",
		"Тут такое случилось...!",
		"Тёмыч: (Он отлично навел суету на Лентольну. Думаю, она точно прийдёт.) B",
		"~~~ Тело добавлено в записи суда.",
		"EXAM",
		"Тёмыч: Посмотрим...", # 50, грудь
		"Егорыч: Эй, ты, что ты делаешь?!",
		"Тёмыч: Эм, я--",
		"Егорыч: Как ты... Как ты смеешь??",
		"Мародер!",
		"Тёмыч: Чё...??--",
		"Егорыч: Девочка, бедная, лежит, измученная, ей нужна помощь, а ты...!!!",
		"Смотри не сдохни, чертила!",
		"Тёмыч: Да я просто--",
		"Егорыч: Что 'просто'? А ниче, что если там сломалось у нее ребро, то ты можешь проткнуть ей лёгкое?",
		"Я не виноватым буду, все сразу на тебя буду валить",
		"Тёмыч: (Я хотел осмотреть тело на предмет травм. Не судьба...) B",
		"Тёмыч: Кстати, супермен-защитник-слабых, взгляни. W",
		"Егорыч: ...Ого, её пырнули чем-то?",
		"Тёмыч: Да, это явно ножевое ранение",
		"Нет, стой, рана тонкая: не как линия, а как точка",
		"Значит, ударили шилом.",
		"Егорыч: Или... рядом лежащей веткой.",
		"Тёмыч: (Рядом с телом этой девки лежит ветка. У неё на кончике есть пятно крови.) B",
		"(Надо осмотреть и эту улику)",
		"EXAM",
		"Тёмыч: Егорыч, это ветка.", # 71, ветка
		"Егорыч: Я не стану бежать за ней, как собака. Можешь и не пробовать.",
		"Тёмыч: Ты к чему?",
		"Егорыч: К тому, чтобы ты не кидал эту ветку за забор, как сделал месяц назад.",
		"Тёмыч: Ой.",
		"Действительно.",
		"Как бы то ни было, смотри, на кончике пятно крови.",
		"Егорыч: Ого, интересно.",
		"Тёмыч: Скажу так: чем бы эта штука не являлась, не добавить её в материалы дела - нарушение адвокатской этики и здравого смысла",
		"~~~ Ветка добавлена в улики.",
		"EXAM",
		"Егорыч: Ого. Смотри, какая родинка большая", # 82, рука
		"И цветастая... Это меланома?",
		"Тёмыч: Эм, нет. Это синяк",
		"Егорыч: На руке? И такой формы странной...",
		"Тёмыч: Ха, даже не так.",
		"Это не просто синяк. Это, батинька, самый что ни на есть засос R",
		"Егорыч: Засос? W",
		"Тёмыч: Угу. У нашей девки точно был парень.",
		"Егорыч: Интересно... Да, я придумал!",
		"Мотив у преступницы: она увела парня у другой девки!",
		"Тёмыч: Или! Мотив у преступника: он узнал, что она изменяет с другим парнем и расправился со своей бывшей.",
		"Егорыч: Или! ...Та блин, давай отдадим эту головную боль Аполлонову или Ляхе",
		"Тёмыч: Если, конечно, Ляха будет прокурором.",
		"Егорыч: Угу...",
		"EXAM",
		"Тёмыч: Кастет? Откуда он взялся?", # 97, кастет
		"Егорыч: Кастеты запрещены по закону, как холодное оружие",
		"И я не думаю, что его можно купить даже с лицензией",
		"Хотя, кто знает. Вот складные ножи не считаются холодным оружием, может, и на кастеты такая логика действует?",
		"Тёмыч: ...Я понял, откуда он взялся.",
		"Егорыч: Как? Уже?! Откуда же, тогда, он взялся?",
		"Тёмыч: Егогорыч, видишь, он с торцов такой... рефленый?",
		"Егорыч: Угу. Это какая-то детализация?",
		"Тёмыч: Нет. Он просто некачественно напечатан на 3D принтере",
		"Я, как обладатель принтера моёйного, знаю, что экструдер, перемещаясь по оси Z, то есть вертикально,",
		"Каждую регистрацию слоя останавливается стоппором",
		"Если такой стоппор затянуть, а это, как правило, резинка или болтик,",
		"То новый слой будет слегка 'налазить' на предыдущий",
		"Егорыч: Принтер печатает слой поверх другого слоя?",
		"Тёмыч: Да. Тут - такой случай.",
		"Как бы то ни было, это очень важная улика, которая объяснит наличие множественных синяков и вывихов на теле жертвы",
		"~~~ Кастет добавлен в записи суда B",
		"EXAM",
		"",
	]
	Anims = [ # массив, в котором 1 слово это перс, а 2 - его анимка
		"",
		"5 октября, 12:30. Сквер. G",
		"Тёмыч: Мы ходим уже... пол часа? W",
		"Егорыч: Ну да, где-то так.",
		"Тёмыч: Что же, сегодня мы посетили столовку, парк, сквер здесь какой-то, ",
		"Егорыч: Нам еще предстоит посетить много мест, плюс осмотреть само здание отеля.",
		"Тёмыч: И че мы так не сделали в первый день...?",
		"Егорыч: Хрен его знает, Тьоха.",
		"Тёмыч: Интересно, что делают сейчас люди дома...",
		"Егорыч: Я думаю, что хренью страдают",
		"Тёмыч: Не, то оно понятно, но конкретнее-то хотелось бы узнать...",
		"Егорыч: М, не знаю.",
		"Тёмыч: Стоять!",
		"Егорыч: Что? Что такое?",
		"Тёмыч: ... *фыркает*",
		"...Кейсом пахнет...",
		"Егорыч: Значит, здоровый, если запахи чувствуешь",
		"Тёмыч: Ну да, насморк у меня всё-таки ближе к зиме начинается",
		"Егорыч, за мной.",
		"Тёмыч: (Мне нужно осмотреть этот сквер) B",
		"... W",
		"...",
		"...",
		"Тёмыч: Мать моя женщина, Егогорыч!",
		"Егорыч: Что-то не так?",
		"Тёмыч: Зырь и зови Лентольну!",
		"Егорыч: Что? Куда?",
		"Тёмыч: За этим деревом кто-то лежит! И это явно не бомж/алкоголик/кто-либо-еще!",
		"Егорыч: Что?! Блин, надо срочно осмотреть это место!",
		"Тёмыч: Никогда мой нюх на кейсы меня не подводил, Егогорыч!",
		"Егогорыч: ...",
		"MAIN",
		"Тёмыч: Ау, красавица, просыпаемся!", # лицо, 32
		"Егорыч: Она вообще как, живая?",
		"Тёмыч: Да хрен его знает... Ну вроде дышит",
		"Егорыч: Надо проверить пульс!",
		"Тёмыч: Я у себя его через раз нахожу, а тут кому-то... Тем более, девке",
		"(В силу определенных обстоятельств, я начал избегать прикосновений к девочкам) B",
		"(Ну и, опять же, я в восьмом классе так и не научился нащупывать пульс)",
		"(Пускай этим займется... Егогооооорыыыыыыч?)",
		"Егорыч: Ты знаешь эту девку? W",
		"Тёмыч: Я вижу её впервые в жизни.",
		"Егорыч: Может учителя её опознают...",
		"*звонок*",
		"Алло, Елена Анатольевна? G",
		"Мы в сквере напротив выхода из четвертого блока, бегите сюда скорее!",
		"Тут такое случилось...!",
		"Тёмыч: (Он отлично навел суету на Лентольну. Думаю, она точно прийдёт.) B",
		"~~~ Тело добавлено в записи суда.",
		"EXAM",
		"Тёмыч: Посмотрим...", # 50, грудь
		"Егорыч: Эй, ты, что ты делаешь?!",
		"Тёмыч: Эм, я--",
		"Егорыч: Как ты... Как ты смеешь??",
		"Мародер!",
		"Тёмыч: Чё...??--",
		"Егорыч: Девочка, бедная, лежит, измученная, ей нужна помощь, а ты...!!!",
		"Смотри не сдохни, чертила!",
		"Тёмыч: Да я просто--",
		"Егорыч: Что 'просто'? А ниче, что если там сломалось у нее ребро, то ты можешь проткнуть ей лёгкое?",
		"Я не виноватым буду, все сразу на тебя буду валить",
		"Тёмыч: (Я хотел осмотреть тело на предмет травм. Не судьба...) B",
		"Тёмыч: Кстати, супермен-защитник-слабых, взгляни. W",
		"Егорыч: ...Ого, её пырнули чем-то?",
		"Тёмыч: Да, это явно ножевое ранение",
		"Нет, стой, рана тонкая: не как линия, а как точка",
		"Значит, ударили шилом.",
		"Егорыч: Или... рядом лежащей веткой.",
		"Тёмыч: (Рядом с телом этой девки лежит ветка. У неё на кончике есть пятно крови.) B",
		"(Надо осмотреть и эту улику)",
		"EXAM",
		"Тёмыч: Егорыч, это ветка.", # 71, ветка
		"Егорыч: Я не стану бежать за ней, как собака. Можешь и не пробовать.",
		"Тёмыч: Ты к чему?",
		"Егорыч: К тому, чтобы ты не кидал эту ветку за забор, как сделал месяц назад.",
		"Тёмыч: Ой.",
		"Действительно.",
		"Как бы то ни было, смотри, на кончике пятно крови.",
		"Егорыч: Ого, интересно.",
		"Тёмыч: Скажу так: чем бы эта штука не являлась, не добавить её в материалы дела - нарушение адвокатской этики и здравого смысла",
		"~~~ Ветка добавлена в улики. B",
		"EXAM",
		"Егорыч: Ого. Смотри, какая родинка большая", # 82, рука
		"И цветастая... Это меланома?",
		"Тёмыч: Эм, нет. Это синяк",
		"Егорыч: На руке? И такой формы странной...",
		"Тёмыч: Ха, даже не так.",
		"Это не просто синяк. Это, батинька, самый что ни на есть засос R",
		"Егорыч: Засос? W",
		"Тёмыч: Угу. У нашей девки точно был парень.",
		"Егорыч: Интересно... Да, я придумал!",
		"Мотив у преступницы: она увела парня у другой девки!",
		"Тёмыч: Или! Мотив у преступника: он узнал, что она изменяет с другим парнем и расправился со своей бывшей.",
		"Егорыч: Или! ...Та блин, давай отдадим эту головную боль Аполлонову или Ляхе",
		"Тёмыч: Если, конечно, Ляха будет прокурором.",
		"Егорыч: Угу...",
		"EXAM",
		"Тёмыч: Кастет? Откуда он взялся?", # 97, кастет
		"Егорыч: Кастеты запрещены по закону, как холодное оружие",
		"И я не думаю, что его можно купить даже с лицензией",
		"Хотя, кто знает. Вот складные ножи не считаются холодным оружием, может, и на кастеты такая логика действует?",
		"Тёмыч: ...Я понял, откуда он взялся.",
		"Егорыч: Как? Уже?! Откуда же, тогда, он взялся?",
		"Тёмыч: Егогорыч, видишь, он с торцов такой... рефленый?",
		"Егорыч: Угу. Это какая-то детализация?",
		"Тёмыч: Нет. Он просто некачественно напечатан на 3D принтере",
		"Я, как обладатель принтера моёйного, знаю, что экструдер, перемещаясь по оси Z, то есть вертикально,",
		"Каждую регистрацию слоя останавливается стоппором",
		"Если такой стоппор затянуть, а это, как правило, резинка или болтик,",
		"То новый слой будет слегка 'налазить' на предыдущий",
		"Егорыч: Принтер печатает слой поверх другого слоя?",
		"Тёмыч: Да. Тут - такой случай.",
		"Как бы то ни было, это очень важная улика, которая объяснит наличие множественных синяков и вывихов на теле жертвы",
		"~~~ Кастет добавлен в записи суда B",
		"EXAM",
		"",
	]
	Ev = [
		"",
		"5 октября, 12:30. Сквер. G",
		"Тёмыч: Мы ходим уже... пол часа? W",
		"Егорыч: Ну да, где-то так.",
		"Тёмыч: Что же, сегодня мы посетили столовку, парк, сквер здесь какой-то, ",
		"Егорыч: Нам еще предстоит посетить много мест, плюс осмотреть само здание отеля.",
		"Тёмыч: И че мы так не сделали в первый день...?",
		"Егорыч: Хрен его знает, Тьоха.",
		"Тёмыч: Интересно, что делают сейчас люди дома...",
		"Егорыч: Я думаю, что хренью страдают",
		"Тёмыч: Не, то оно понятно, но конкретнее-то хотелось бы узнать...",
		"Егорыч: М, не знаю.",
		"Тёмыч: Стоять!",
		"Егорыч: Что? Что такое?",
		"Тёмыч: ... *фыркает*",
		"...Кейсом пахнет...",
		"Егорыч: Значит, здоровый, если запахи чувствуешь",
		"Тёмыч: Ну да, насморк у меня всё-таки ближе к зиме начинается",
		"Егорыч, за мной.",
		"Тёмыч: (Мне нужно осмотреть этот сквер) B",
		"... W",
		"...",
		"...",
		"Тёмыч: Мать моя женщина, Егогорыч!",
		"Егорыч: Что-то не так?",
		"Тёмыч: Зырь и зови Лентольну!",
		"Егорыч: Что? Куда?",
		"Тёмыч: За этим деревом кто-то лежит! И это явно не бомж/алкоголик/кто-либо-еще!",
		"Егорыч: Что?! Блин, надо срочно осмотреть это место!",
		"Тёмыч: Никогда мой нюх на кейсы меня не подводил, Егогорыч!",
		"Егогорыч: ...",
		"MAIN",
		"Тёмыч: Ау, красавица, просыпаемся!", # лицо, 31
		"Егорыч: Она вообще как, живая?",
		"Тёмыч: Да хрен его знает... Ну вроде дышит",
		"Егорыч: Надо проверить пульс!",
		"Тёмыч: Я у себя его через раз нахожу, а тут кому-то... Тем более, девке",
		"(В силу определенных обстоятельств, я начал избегать прикосновений к девочкам) B",
		"(Ну и, опять же, я в восьмом классе так и не научился нащупывать пульс)",
		"(Пускай этим займется... Егогооооорыыыыыыч?)",
		"Егорыч: Ты знаешь эту девку? W",
		"Тёмыч: Я вижу её впервые в жизни.",
		"Егорыч: Может учителя её опознают...",
		"*звонок*",
		"Алло, Елена Анатольевна? G",
		"Мы в сквере напротив выхода из четвертого блока, бегите сюда скорее!",
		"Тут такое случилось...!",
		"Тёмыч: (Он отлично навел суету на Лентольну. Думаю, она точно прийдёт.) B",
		"2/body/Жертва, найдена в парке в паре метров от отеля на север./0",
		"EXAM",
		"Тёмыч: Посмотрим...", # 49, грудь
		"Егорыч: Эй, ты, что ты делаешь?!",
		"Тёмыч: Эм, я--",
		"Егорыч: Как ты... Как ты смеешь??",
		"Мародер!",
		"Тёмыч: Чё...??--",
		"Егорыч: Девочка, бедная, лежит, измученная, ей нужна помощь, а ты...!!!",
		"Смотри не сдохни, чертила!",
		"Тёмыч: Да я просто--",
		"Егорыч: Что 'просто'? А ниче, что если там сломалось у нее ребро, то ты можешь проткнуть ей лёгкое?",
		"Я не виноватым буду, все сразу на тебя буду валить",
		"Тёмыч: (Я хотел осмотреть тело на предмет травм. Не судьба...) B",
		"Тёмыч: Кстати, супермен-защитник-слабых, взгляни. W",
		"Егорыч: ...Ого, её пырнули чем-то?",
		"Тёмыч: Да, это явно ножевое ранение",
		"Нет, стой, рана тонкая: не как линия, а как точка",
		"Значит, ударили шилом.",
		"Егорыч: Или... рядом лежащей веткой.",
		"Тёмыч: (Рядом с телом этой девки лежит ветка. У неё на кончике есть пятно крови.) B",
		"(Надо осмотреть и эту улику)",
		"EXAM",
		"Тёмыч: Егорыч, это ветка.", # 70, ветка
		"Егорыч: Я не стану бежать за ней, как собака. Можешь и не пробовать.",
		"Тёмыч: Ты к чему?",
		"Егорыч: К тому, чтобы ты не кидал эту ветку за забор, как сделал месяц назад.",
		"Тёмыч: Ой.",
		"Действительно.",
		"Как бы то ни было, смотри, на кончике пятно крови.",
		"Егорыч: Ого, интересно.",
		"Тёмыч: Скажу так: чем бы эта штука не являлась, не добавить её в материалы дела - нарушение адвокатской этики и здравого смысла",
		"3/branch/Ветка, которой закололи жертву в грудь./0",
		"EXAM",
		"Егорыч: Ого. Смотри, какая родинка большая", # 81, рука
		"И цветастая... Это меланома?",
		"Тёмыч: Эм, нет. Это синяк",
		"Егорыч: На руке? И такой формы странной...",
		"Тёмыч: Ха, даже не так.",
		"Это не просто синяк. Это, батинька, самый что ни на есть засос R",
		"Егорыч: Засос? W",
		"Тёмыч: Угу. У нашей девки точно был парень.",
		"Егорыч: Интересно... Да, я придумал!",
		"Мотив у преступницы: она увела парня у другой девки!",
		"Тёмыч: Или! Мотив у преступника: он узнал, что она изменяет с другим парнем и расправился со своей бывшей.",
		"Егорыч: Или! ...Та блин, давай отдадим эту головную боль Аполлонову или Ляхе",
		"Тёмыч: Если, конечно, Ляха будет прокурором.",
		"Егорыч: Угу...",
		"EXAM",
		"Тёмыч: Кастет? Откуда он взялся?", # 97, кастет
		"Егорыч: Кастеты запрещены по закону, как холодное оружие",
		"И я не думаю, что его можно купить даже с лицензией",
		"Хотя, кто знает. Вот складные ножи не считаются холодным оружием, может, и на кастеты такая логика действует?",
		"Тёмыч: ...Я понял, откуда он взялся.",
		"Егорыч: Как? Уже?! Откуда же, тогда, он взялся?",
		"Тёмыч: Егогорыч, видишь, он с торцов такой... рефленый?",
		"Егорыч: Угу. Это какая-то детализация?",
		"Тёмыч: Нет. Он просто некачественно напечатан на 3D принтере",
		"Я, как обладатель принтера моёйного, знаю, что экструдер, перемещаясь по оси Z, то есть вертикально,",
		"Каждую регистрацию слоя останавливается стоппором",
		"Если такой стоппор затянуть, а это, как правило, резинка или болтик,",
		"То новый слой будет слегка 'налазить' на предыдущий",
		"Егорыч: Принтер печатает слой поверх другого слоя?",
		"Тёмыч: Да. Тут - такой случай.",
		"Как бы то ни было, это очень важная улика, которая объяснит наличие множественных синяков и вывихов на теле жертвы",
		"4/knucklebuster/Кастет. Напечатан на 3D принтере с дефектом регистрации слоев. Может, им сломали кости и поставили синяки на теле жертвы./0",
		"EXAM",
		"",
	]
	Chats = [ # массив, в котором все, кроме последних 3 *БУКВ* - названия кнопок, а последние 3 буквы - номер строки
		"",
		"",
		"",
		"",
	]
	Moves = [ # массив с названиями кнопок перехода и целью куда они переводят
		"Парк res://scenes/case_2/park_day1.tscn",
		"",
		"",
		"",
	]
	Shows = [ # массив, в котором первое слово - улика, а 2 - номер строки, на который перекинет игрока, если ее показать
		"",
	]
	EvCount = 5
	# СУКА БЛЯТЬ НЕ ТРОГАЙ ЭТО ГАНДОН НЕДОШТОПАННЫЙ АААААА*АААААААААААААААААА!!!!!!!!!!!!!!!!!!!!!!!!
	
	for i in range(1,4):
		if Chats[i-1] != "":
			get_node("chat_"+str(i)).text = Chats[i-1].left(Chats[i-1].length()-3)
	for i in range(1,4):
		if Moves[i-1] != "":
			get_node("move_"+str(i)).text = Moves[i-1].left(Moves[i-1].length()-Moves[i-1].split(" ")[-1].length())
	print(Chats[0].split(" ")[-1])
	
	
	
	loc_file.load("C:/Games/ddkg2.save")
	if str(loc_file.get_value("Locations",str(filename))) == "1":
		$investigation_screen.Cur = 30
		


func _process(_delta):
	if $investigation_screen.State == "Examine":
		$back_ground.animation = "scene"
	else:
		$back_ground.animation = "default"


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


func _on_poi_5_mouse_entered():
	if $investigation_screen.State == "Examine":
		if $investigation_screen.Checked[5] == false:
			$investigation_screen/crosshair.animation = "wut"
		else:
			$investigation_screen/crosshair.animation = "gotchu"


func _on_poi_5_pressed():
	if $investigation_screen.State == "Examine":
		$investigation_screen.State = "Dialogue"
		$investigation_screen.Cur = int($poi_5.text)
		$investigation_screen/show_text.text = Dialogue[$investigation_screen.Cur]
		$investigation_screen.Checked[5] = true


func _on_verif_timeout():
	print("shitfuck")
	loc_file.set_value("Locations",str(filename),"1")
	loc_file.save("C:/Games/ddkg2.save")
