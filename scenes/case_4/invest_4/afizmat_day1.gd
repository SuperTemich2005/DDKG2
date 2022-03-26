extends Node2D
var Anims
var Dialogue: PoolStringArray
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
var goto_when_was
var maga_halt
func _ready():
	loc_file.load(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
	Dialogue = [ # диалоги. 
		"29 апреля. 12:55. Ларёк 'Физмат' рядом с Лицеем 99.|G",
		"Тёмыч: ДА БЛИНААААА|W|character_egorich suspects|START peaceful_spring|REACT damage",
		"Егорыч: Что-то не так?",
		"Тёмыч: Щас вроде не то, что очень тепло,",
		"Но это грёбаное солнце шпалит мне в хлебальник, как Ярыло Даждьбогу в рыло!",
		"Егорыч: Ты никогда не тратил навыков в рифмовании и прочем.|W|character_egorich yee",
		"Тёмыч: Я скорее сдам пост адвоката, чем сдам красноречие, ирод окаянный!",
		"Егорыч: Кстати, чела из шестого класса обвиняют в краже журнала.|W|character_egorich thinks",
		"Тёмыч: В шестом классе можно успешно доказать, что журнал крал не ты.",
		"И не говори МНЕ, что это невозможно!",
		"Егорыч: Ну, действительно.|W|character_egorich suspects|---|REACT surprise",
		"Ну, ладно. Я просто думал, что ты не будешь против.|W|character_egorich default",
		"В конце, близкая к душе и телу ситуация",
		"Тёмыч: То, как меня кинули *два года* назад мне ближе.|W|---|---|REACT surprise",
		"Да и тем более, почему ты сам не займешься этим делом? Этим кто угодно может заниматься.",
		"Егорыч: Ну, я не смогу. За то мне известно, что у нас на горизонте возникает новый человек.",
		"Тёмыч: Да, Лентольна однажды сказала, что если я вернусь в суд, то поставит мне законного консула.|W|character_egorich thinks",
		"Типа ты слишком нелегальный, Егорыч.|W|character_egorich suspects|---|REACT surprise",
		"Егорыч: Как так получилось...",
		"Тёмыч: Она сказала, что сейчас в историко-правовом классе отбывает срок Захар Прохоров.",
		"Кроме имени я ничего не знаю.",
		"Егорыч: Странно, мне она назвала другое имя.|W|character_egorich thinks|---|REACT surprise",
		"Девочку.",
		"Тёмыч: Ну, мне-то вообще всё равно.|W|character_egorich default|---|REACT frustration",
		"Егорыч: Соня без дела сидит, как ты ушел.",
		"Тёмыч: Мне ли не знать",
		"Егорыч: Неужели ты вообще не хочешь--",
		"Тёмыч: Давай лучше по домам и в майн? В майне мне есть, чем заняться.",
		"Егорыч: Я планировал вообще-то тебя позвать в морской док.|W|character_egorich thinks",
		"Тёмыч: А что? У нас появились эти триклятые пропеллеры?",
		"Егорыч: Моторы.|W|character_egorich suspects|---|REACT frustration",
		"Тёмыч: А, ну извините, капитан Егорыч.",
		"Егорыч: Короб нам отлично помогает с лодкой.|W|character_egorich thinks|---|REACT surprise",
		"Его инженерные навыки достаточно продвинутые, но с запчастями и моторами он помогает лучше всего.",
		"Тёмыч: Еще продвинутее его способ заработка.",
		"Егорыч: Как ты думаешь, куда мы прежде всего поплывём?",
		"Тёмыч: Это решение уже за Коробом, он же больше всех скинулся.",
		"Эм, нет, кстати, сегодня я не смогу в док съездить.",
		"Но в гитхабе есть новая версия прошивки. Связь должна работать. Приедешь - скачай.",
		"Егорыч: Хорошо, проверю.|W|character_egorich yee|---|REACT surprise",
		"Тёмыч: (В конце прошлого года, ученые научились синтезировать новый материал)|B",
		"(Дешевый в производстве, за то прочный и плотный, как закалённая сталь)",
		"(Его начали использовать для массового производства подводных лодок и кораблей, он называется 'кракенит')",
		"(С ним даже мы, школьники, смогли построить свою подлодку!)",
		"(Хотя в нашем бюджете была всего лишь тысяча долларов. Настолько кракенит крутой - с ним можно делать настоящие подлодки и не тратить триллионов долларов.)",
		"(Короб бан Эскиз, это наш брат по интересам, разделяющий наше желание исследовать мир)",
		"(То есть, делать то, что я хочу делать после этой всей адвокатуры.)",
		"(Он перевелся в нашу школу на нашей параллели и занимается переводом на разные языки и программированием.)",
		"(Фриланся, он скинулся на подводную лодку больше всех)",
		"(Егорыч занимается инженерией, я и Эскиз - программированием)",
		"(За это время, Меридиан вновь подаёт признаки жизни, однако я особо не волнуюсь... пока что.)",
		"Егорыч: Тёмыч?|W|character_egorich suspects|START peaceful_spring",
		"Тёмыч: М?",
		"MAIN",
		"Тёмыч: Эй, Егорыч, слышал про Жаркую?|W|character_egorich default",
		"Егорыч: Про Жарову? Да, кстати, она вроде от кого-то залетела|W|character_egorich thinks",
		"Тёмыч: Удивил. Учитывая, какая она затасканная и отшпёханная,",
		"удивительно, что только сейчас.|W|character_egorich laugh",
		"Егорыч: Как ты думаешь, кто герой-осеменитель?|W|character_egorich thinks",
		"Тёмыч: Из нас двух может быть только один, и то не я.|W|character_egorich suspects",
		"Егорыч: Очень смешно.",
		"Тёмыч: А как может быть не смешно, ирод окаянный?|W|character_egorich thinks",
		"Егорыч: Ну вот как ты только что пошутил, вот так и может.|W|character_egorich objection|---|REACT intro_woosh",
		"Тёмыч: Ух чертила!|W|character_egorich laugh",
		"MAIN",
		"Егорыч: Я думаю, что в последний звонок мы сможем уплыть!|W|character_egorich yee",
		"Тёмыч: Капец, иметь собственную подлодную лодку...|W|character_egorich default",
		"Егорыч: Нам осталось сделать двигательную систему, перепроверить корпус на герметичность и гравировку сделать",
		"Тёмыч: 'Мореплаватель NX-1', много ли подлодок с таким названием?",
		"Егорыч: Не знаю.|W|character_egorich thinks",
		"А, еще ведь нужно сделать интерфейс и наладить прочую механику, а то мотор один раз чуть мне в жбан не заехал. Клапан хлипкий попался.|W|character_egorich all_of_sudden",
		"Тёмыч: (Егорыч - главный инженер подлодки. Ему ли не дать качественных клапанов, чтобы угрозы для жизни меньше было?)|B|character_egorich yee",
		"До чего дошел прогресс. Интересно, а с таким можно строить дешманские ракеты?|W|character_egorich thinks",
		"Егорыч: Хочешь полететь в космос?",
		"Тёмыч: А что?",
		"Егорыч: Ну... Подумаем.|W|character_egorich suspects",
		"Тёмыч: Обязательно подумаем!|W|character_egorich yee",
		"MAIN",
		"Тёмыч: На подходе потенциально новый адвокат, чел из историко-правового класса.|W|character_egorich thinks",
		"Лентольна говорила, что поставит его мне консулом, если что. Захар Прохоров.",
		"Егорыч: Мне Лентольна говорила про девочку.",
		"Тёмыч: Вот пускай их друг для друга консулом ставит, чтобы потом появился какой-нибудь Вася Пупкин и нагнул их обоих.|W|character_egorich all_of_sudden",
		"Егорыч: Тьоха, ну че ты так категорично?|W|character_egorich thinks|---|REACT surprise",
		"Тёмыч: В смысле?",
		"Егорыч: Ну, ты бросил всю школу на произвол судьбы своим уходом.",
		"И всё из-за одного человека.|---|REACT frustration",
		"Тёмыч: Ааа, ты об этом?",
		"Ну, понимаешь, где есть одна шваль, готовая тебя пырнуть с-под тишка",
		"Там есть и вторая",
		"За ней идёт третья",
		"Четвёртая, пятая, десятая, двухсотая.|W|character_egorich suspects|---|REACT surprise",
		"Каждая из них вредит твоей репутации.",
		"Даже сейчас есть люди, которые думают, что я тогда два года назад украл три тыщи с чем-то грывень.",
		"Благо, моя ситуация не настолько плачевная, насколько могла бы быть.",
		"Егорыч: Но всё же, за всё то время, что ты адвокатил, это единственный случай, не так ли?|W|character_egorich suspects",
		"Тёмыч: Допустим, и? Даже если и так, то только за мной выбор - защищать людей в суде или позволить им попасться в ложные обвинения",
		"Егорыч: Но как же Соня? Вера Юрьевна сказала, что она готовилась стать прокурором и встать против тебя.|W|character_egorich thinks|---|REACT surprise",
		"Тёмыч: Она просто сказала, что Соня станет прокурором в школьном суде. Не более.|---|REACT frustration",
		"(Ну и даже если и так, то мы всё равно часто проводим время вместе. Своей компанией я её не обделяю, хоть мы и не видимся на этих школьных заседаниях.)|B",
		"Егорыч: Как знаешь.",
		"MAIN",
		"Егорыч: Тебя признали невиновным два года назад, но у тебя до сих пор бывают проблемы с остальными?|W|character_egorich thinks",
		"Тёмыч: Ну, благоразумных людей достаточно, чтобы спокойно жить|W|---|---|REACT frustration",
		"Хотя в столовку мне путь закрыт, как и на ярмарку.",
		"Егорыч: Мне жаль, что я не смог самолично довести дело до конца.|W|character_egorich damage",
		"Тёмыч: Я думаю, что даже я бы не смог.",
		"Самое главное, что мои друзья от меня не отвернулись и что я смог не стать изгоем.",
		"(Да, определенные последствия я испытываю на своей затасканной шкуре)|B",
		"(Но чертям позорным будет недостаточно лишь этого, чтобы выжить меня.)",
		"MAIN",
		"Тёмыч: Зырь, Егорыч, ремещокьна моем значке теперь круче!|W|charqcter_egotich suspects",
		"Егорыч: На мне этот трюк не работает.",
		"Тёмыч: (Чертила...)|B|character_egorich laugh",
		"Егорыч: Оказывается, это не обозначение статуса школьного адвоката.|W|character_egorich thinks",
		"Тёмыч: Кто бы мог подумать... Но я думаю, что за свою карьеру я успел придать этой картонке больше смысла всё-равно.",
		"MAIN",
		"Тёмыч: Это солнце меня бесит!|---|REACT damage", # солнце, 116
		"Егорыч: Понимаю...|W|character_egorich damage",
		"Тёмыч: Что ты понимаешь? Ты стоишь к нему спиной, черт позорный!|W|character_egorich all_of_sudden",
		"Егорыч: Это не мешает мне 'понимать'|W|character_egorich objection|START egorich_objection|REACT intro_woosh",
		"Тёмыч: (Тьоха использует PSI Блютуз Глушитель Ψ!)|B|character_egorich default|START peaceful_spring",
		"MAIN",
		"Егорыч: Я слышал, оттуда сбросилась девочка из нашей школы!|W|character_egorich all_of_sudden|---|REACT damage",
		"Тёмыч: (Одна из жертв 'Тайного дела', произошедшего где-то 3 года назад.)|B",
		"(Кто-то изнасиловал четырех школьниц в одном из кабинетов школы. Этот и пара других кабинетов сейчас замурованы.)",
		"(Каждая из жертв потерпела серьезные последствия в виде психических расстройств. Одна из них потеряла память, другая попыталась самоубиться...)",
		"Я слышал, её завалила Титанаванна.|W|character_egorich all_of_sudden|---|REACT surprise",
		"Егорыч: Матан опасен для здоровья...|W|character_egorich thinks|---|REACT frustration",
		"Тёмыч: Как бы то ни было, наших и людей из других школ регулярно сбивают рядом с местным АТБ и кольцевой развязкой.",
		"Меня это не удивляет",
		"Егорыч: И это - самое страшное.",
		"MAIN",
		"Тёмыч: Дурка.|W|character_egorich default",
		"Егорыч: Разве?|W|character_egorich suspects|---|REACT surprise",
		"Тёмыч: А что тогда?",
		"Егорыч: Обычный жилой дом.",
		"Тёмыч: Дурка.",
		"Егорыч: ...???",
		"MAIN",
		"Егорыч: Минимаркет 'Физмат'.|W|character_egorich thinks",
		"Сюда бегают наши на большой перемене, так как в АТБ ошиваются завучки.",
		"Тёмыч: Вот прикольно будет, если туда зайдёт условная Мариванна.|W|character_egorich laugh",
		"MAIN",
		"Тёмыч: За этими деревьями ничего не видно. Странно.|W|character_egorich thinks",
		"Егорыч: Действительно, за этими деревьями не видно абсолютно ничего. Самая плотная растительная стена, которую я когда-либо видел.",
		"Тёмыч: Нет, я к тому, что сегодня утром тут не было абсолютно ничего. Эта стена появилась из ниоткуда!|W|character_egorich all_of_sudden|---|REACT surprise",
		"MAIN",
		"29 апреля. 13:07. Ларёк 'Физмат' рядом с Лицеем 99.|G",
		"Егорыч: Спустя столько времени, ты таки нашел выход из школы!|W|character_egorich yee|START egor_theme",
		"Тёмыч: Теперь можно и по домам. Мы итак в школе задержались, как будто бы никакой сокращенки у нас не было...",
		"Егорыч: Угу. Ну, ладно, я найду автобус и поеду в цимет.",
		"Тёмыч: Удачи.",
		"???: СТОЯТЬ!|R|character_egorich all_of_sudden|STOP all|REACT surprise",
		"???: Старший следователь по существенным делам школьного коммитета защиты прав и дипломатии, Владислав Иванович|W|character_paltos whatever|START paltos_theme",
		"Тёмыч: Ну ё-маё, ну ё-маё...",
		"Тебя тут не хватало, Ирод Окаянный!",
		"Аполлонов: Мне тоже не очень приятно видеть тебя, Зина.",
		"Но тем не менее.",
		"Тёмыч: И че ты тут забыл, черт позорный?",
		"Аполлонов: Новых обзывачек ты так и не выучил...|W|character_paltos kek|---|REACT surprise",
		"Тёмыч: Взаимно.|W|character_paltos suspects",
		"Аполлонов: Я вообще не за тобой пришел, можешь уходить.",
		"Тёмыч: Чего еще прикажешь, о великий Палтос?",
		"(Управляющий, как обычно. Ему и до 'самого' старшего следователя недалеко, и до старосты)|B",
		"(Но выполнять чьи-то приказы лично я не стану)",
		"(Тем более, если это Палтос.)",
		"Аполлонов: Ну, если хочешь видеть, как я вяжу твоего друга, то пожалуйста, наблюдай.|W|character_paltos kek|STOP all|REACT surprise",
		"Егорыч: Чего?|W|character_egorich all_of_sudden",
		"Тёмыч: (Палтос - каратист. Егорыч, конечно, свергнул террористов вместе со мной и другими в Днепре,)|B|character_egorich thinks|START suspense",
		"(но Палтосу ничего не помешает кинуть с прогиба бедного Егогорыча. Надо что-то делать!)",
		"Что это значит, мой старый-добрый-злобный 'друг'?|W|character_paltos suspects|---|REACT surprise",
		"Аполлонов: Я не должен перед тобой отчитываться.",
		"Могу сказать только, что Ищенко Егор обвиняется в совершении преступления.",
		"Преступление небольшое, школьного масштаба, так что мы сами справимся даже без полиций.",
		"Тёмыч: Какое преступление?",
		"Аполлонов: Ну...|W|character_paltos default",
		"Ты ж не адвокат, Зина-Корзина.|R|character_paltos kek|---|REACT surprise",
		"Тёмыч: (Ух!)|B",
		"(Палтос прав, я отказался от судебных дел два года назад...)",
		"(Но право на адвокатскую деятельность в школьном суде имеет любой!)",
		"(Я верю Егорычу и В Егорыча! Он никогда не сделает со мной того, что сделали бы другие.)",
		"(И никто не может угрожать страйкбольщику Красного Глаза - контр-террористической группировки Днепропетровска из Запорожья!)",
		"Тёмыч: Охрана, отмена!|W|character_egorich all_of_sudden|STOP all|REACT intro_woosh",
		"Аполлонов: В смысле?|W|character_paltos suspects",
		"Тёмыч: Ты расскажешь мне, в чем обвиняется мой поручитель!|W|character_egorich yee|---|REACT surprise",
		"Аполлонов: Это прикол какой-то? В смысле 'поручитель', ты же не адвокат.|W|character_paltos kek",
		"Тёмыч: Серьезно?",
		"ПРОТЕСТУЮ!|W|character_paltos suspects|START objection_theme|REACT obj_rus",
		"Я не знаю, что ты там себе выдумал, но прав ты только на 99%.",
		"Я действительно не защищаю никого, но это не значит, что я не буду защищать своего лучшего друга и помощника!",
		"Мы прошли через многое, так что каким бы не было это преступление, ты расскажешь!",
		"Аполлонов: Переобулся, а?|W|character_paltos suspects",
		"Тёмыч: Ты не знаешь, в каких я башмаках ходил эти два года и как я в них попал.",
		"Так что твоё обвинение в лицемерии я со спокойной душёй *отклоняю.*",
		"Аполлонов: Хмф.",
		"Это дело будет невозможным для тебя, лошара.|W|character_paltos kek",
		"Тёмыч: Мне не привыкать. Рассказывай давай.",
		"Аполлонов: Ира Жарова, ученица 9-А класса, написала на Ищенко жалобу.|W|character_paltos default|START logic",
		"Тёмыч: Что? Серьезно?|W|---|---|REACT surprise",
		"Егорыч: Нет, этого не может быть.|W|character_egorich thinks",
		"Аполлонов: Чего?|W|character_paltos default",
		"Сейчас, Ира Жарова беременна на первом месяце.",
		"Она утверждает, что отец - Егор Ищенко.",
		"Тёмыч: ...|W|character_egorich all_of_sudden|STOP all",
		"Егорыч: ...",
		"Тёмыч: ...",
		"Егорыч: ...",
		"Тёмыч: ...",
		"Егорыч: ...",
		"Тёмыч: Кх",
		"Кхх... кхх...",
		"...",
		"ХААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААА|W|charqacter_egorich laugh|---|REACT sith_slam",
		"ЕГОРЫЧ?|W|character_paltos suspects",
		"С НЕЙ?!",
		"Какая-то ОНА с ЕГОГОРЫЧЕМ?",
		"ХА ХА ХА ХА ХА ХА ХА ХА ХААААААААААААААИИИИИИИИИИИИИИИИАААААААААААААААААААА",
		"Не, Палтос, это не смешно.",
		"Я бы понял, если бы Егорыч кастанул онгаку",
		"Или шмальнул бы по Титанаванне с настоящего глока",
		"Или взорвал бы школу",
		"Но спасть с драными тряпками вроде Жаровой?",
		"Егорыч: Она не в моём вкусе даже...|W|character_egorich rage",
		"Волосы, лицо, не то всё!",
		"К тому же, у меня есть кое-кто на примете",
		"А, знаешь ли, заниматься сексом с кем-то, кто не твой краш, тяжеловато...",
		"Тёмыч: Ну и объективено, для кого-то вроде Жаренной кто-то вроде Егорыча|W|character_paltos suspects",
		"Кто-то умный и воистинну сильный - телом и духом...",
		"Ей нравятся смазливые дрыщи с ипхоном",
		"И чтобы по ночам в клубах её развлекал.",
		"А Егорыч максимум нашей лодкой развлечь может",
		"Аполлонов: Мне пофиг, что у вас там за катера, у меня задание доставить подозреваемого в учительскую.|W|character_paltos whatever",
		"И пока только одного. Тебя потом позовут.",
		"Тёмыч (Внегласное правило школы - адвоката выбирают во время следствия.)|B",
		"Хорошо, так тому и быть. Егорыч, встретимся позже.|W|character_egorich damage|---|REACT damage",
		"Егорыч: Я позвоню.",
		"...|W|character_egorich HIDE|STOP all",
		"Тёмыч: (Адвокат Тьоха Тьохич: приступаю к работе!)|B|---|START investigation_op",
		"MAIN",
		"29 апреля. Около 13:30. Ларёк 'Физмат' рядом с Лицеем 99|G|character_egorich default",
		"Егорыч: Думаешь, тут кто-то из свидетелей есть?|W|character_egorich thinks|START investigation_op",
		"Тёмыч: Ну... кстати",
		"А что в нашем случае значит 'свидетель'?",
		"Егорыч: Действительно.|W|character_egorich suspects",
		"Если только она не тр*халась прилюдно, то свидетелей быть не может.",
		"Тёмыч: Я могу предположить, что аптекарь из АНЦ или кассир из АТБ, в теории, вспомнит, как Жаренная или её парень покупали зимнюю резину",
		"Но учитывая то, что мы щас в такой ситуации, то вряд ли зимняя резина имеет место быть.",
		"Егорыч: Вообще, какова наша цель и почему мы не можем дождаться рождения ребенка, чтобы протестить меня на отцовство?|W|character_egorich thinks",
		"Тёмыч: Потому что если щас мы не сделаем этого, то 333 подружки Жаренной сами судилище устроят и на всю школу тебя заклеймят козлом",
		"А когда проведется тест на отцовство, то всем уже будет пофиг",
		"...",
		"Егорыч: Ясно.|W|character_egorich default",
		"Тёмыч: Другой вопрос - как доказать здесь и сейчас, что ты - не батя?",
		"Егорыч: Расколоть Жарову или найти её настоящего парня!|W|character_egorich yee",
		"Тёмыч: Последний вопрос - насколько это реально?",
		"Я, конечно, творил дичь круче, но у меня нет третьего глаза",
		"Егорыч: Но ты часто говоришь о том, что у тебя есть третий глаз|W|character_egorich suspects",
		"Тёмыч: Я также часто прикалываюсь, ирод окаянный, так что грех принимать каждый мой прикол всерьёз.",
		"???: Эй.|P|---|STOP all|REACT surprise",
		"Тёмыч: Ох, Егорыч, я забегу в 'Физмат', а ты пока загляни в столовку. Я думаю, что мы там что-то найдём.|W",
		"Егорыч: Еще лучше, я зайду в 320-й. Там у Радыча урок будет, он-то точно что-то про Жарову расскажет.|W|character_egorich yee",
		"Тёмыч: Ну вот и правильно! Ладно, увидимся.",
		"...|W|character_egorich HIDE",
		"Соня: Привет|P|character_sonya default|START peaceful_spring|REACT surprise",
		"Тёмыч: 'Очень' давно не виделись.",
		"Соня: ...|P|character_sonya order67|START investigation_op",
		"MAIN",
		"Соня: Как дела?|P|character_sonya uh",
		"Тёмыч: У нас были сокращенные уроки. Слишком сокращенные",
		"У нас было вроде 4 урока.",
		"Соня: Чертила...|P|character_sonya death",
		"И в честь чего вас халтурить отпустили?|P|character_sonya uh",
		"Тёмыч: У одного из наших ковид нашли.",
		"Соня: Повезло...",
		"Тёмыч: Я переболел этим прям неделю назад, так что я хоть и заразный, но мне всё-равно.",
		"Соня: Я сама кое-кого заразила. Нас тогда вообще закрыли на неделю.|P|character_sonya order67",
		"Тёмыч: Соня Виноградова - крыша дистанционки",
		"Соня: Чумной доктор|P|character_sonya death",
		"MAIN",
		"Соня: Я только что из школы вышла.|P|character_sonya uh",
		"Аполлонов громко обсуждал с другом, как Егорыч переспал с Жаровой Ирой, которая два года назад чуть коней не двинула",
		"И что она теперь беременна.",
		"Это правда?",
		"Тёмыч: А вот это нам предстоит выяснить. Я не думаю, что Егорыч бы стал с ней спаць.",
		"Но дело хотят довести до школьного суда.",
		"Я даже вернулся в адвокатуру, потому что Егогорыч же.",
		"Соня: М-да, обвинять лучшего друга своего парня будет неприятно...|P|character_sonya wtfbruh",
		"Тёмыч: Ну, что поделать. В конце-концов, должен на суде быть прокурор, чтобы совместными усилиями поднять на поверхность все факты.",
		"К тому же, кто, если не ты? Какой-нибудь Грощук, который вступительную речь еле состряпывает?",
		"Или Дашкерин, который купит себе безусловную победу запугиванием свидетелей и подменой улик?",
		"Соня: Неужели, у нас больше нет прокуроров в школе...|W|character_sonya anyways",
		"Что ж, тогда надо поискать свидетелей...|P|character_sonya uh",
		"Тёмыч: Кстати о свидетелях, есть один кадр, который может что-то знать.",
		"Соня: М?",
		"Тёмыч: Её зовут Эквинокс Прайм.",
		"Ой, то есть, Лера. Или Лена. Как-то так, короче.",
		"Фамилию не знаю, но это и необязательно. На ней фиолетово-жёлтое платье. И такая же прическа. И даже глаза.",
		"Соня: Даже глаза?",
		"Тёмыч: Вот ты её за километр увидишь.",
		"А то и за два. Или три. Увидишь, в общем.",
		"Соня: Да ну?|P|character_sonya order67",
		"Тёмыч: Поверь мне.",
		"Соня: Ну ладно.",
		"Тёмыч: Единственное что, ты вряд ли её разговоришь.",
		"Она непробиваемая, мы с Егорычем уже пытались.",
		"Соня: Ну-ну...|P|character_sonya death",
		"Тёмыч: Хорошая моя, нам надо допросить её",
		"А не возбудить в ней инстинкт самосохранения.",
		"Соня: ...",
		"Кстати, 'Лена видимая за километр'?|P|character_sonya uh",
		"Она случайно не говорит гнусаво-писклявым голосом?",
		"Тёмыч: Ну... Допустим.",
		"Соня: Передай ей, что Миша Игнатов на неё запал.",
		"Тёмыч: А кто такой Миша Игнатов?",
		"Соня: С 11-го какой-то чел, я мимо него с его друзьями проходила однажды",
		"Они с неё рофлили, мол, 'малолетка на тебя запала, Мих'. Или че-то такое",
		"Скажешь, что если она не будет с тобой говорить, то Аполлонов подставит его в грабеже, Виноградова его посадит, а ты поможешь.|P|character_sonya order67",
		"И не увидит она его никогда.",
		"Тёмыч: Злая ты.",
		"Соня: Ты хотел сказать 'эффективная'?",
		"Тёмыч: (Хотел сказать 'эффектная', особенно дома в пижаме.)|B",
		"Соня: План действий ясен?|P|character_sonya uh",
		"Тёмыч: Угу.",
		"(Бедная Лена/Лера)|B",
		"MAIN",
		"Тёмыч: Смотри, птичка!|P|character_sonya default|---|REACT surprise",
		"Соня: ...?",
		"Аааа!|P|character_sonya wtfbruh|---|REACT damage",
		"Блин!",
		"Глаза",
		"Мои глаза",
		"Я ничего не вижу!",
		"Тёмыч: А вот я в сторону солнца смотрю всё время.",
		"Мучаюсь",
		"А тебе норм",
		"Соня: Сочувствую.",
		"MAIN",
		"Тёмыч: Магазин 'Физмат.'|P|character_sonya default",
		"Мы с Егорычем предположили, что если в него зайдёт завуч после третьего урока",
		"Полшколы сляжет героями.|P|character_sonya uh",
		"Соня: А если завуч зайдет в 7 вечера",
		"То половина от оставшихся в живых людей просто исчезнет|P|character_sonya death|---|REACT frustration",
		"Тёмыч: А если она зайдёт сюда в--",
		"Соня: Могу представить, что произойдёт.|P|character_sonya whatever",
		"Тёмыч: (Ну да, ну да...)|B|character_sonya orded67",
		"MAIN",
		"Соня: Что это?|P|character_sonya default",
		"Тёмыч: Очень важная улика, имхо.",
		"Соня: Я одолжу у тебя?|P|character_sonya uh",
		"Тёмыч: Разве что дам сделать копию.",
		"Соня: Ууу, жадина.|P|character_sonya death",
		"SKIP_THIS|W|character_sonya default",
		"MAIN",
		"Соня: О, я тебя как раз таки ищу.|P|character_sonya death|---|REACT surprise",
		"Егорыч: О, привет.|W|character_egorich yee",
		"Соня: ...|W|character_sonya death|---|REACT frustration",
		"Тёмыч: Да, привет.|W|---|START theme_of_sith",
		"Егорыч: Кстати, ты знаешь, что Тёмыч вернулся в адвокатуру и сейчас--|W|character_egorich thinks",
		"Соня: Да.|Y|character_sonya death",
		"Тёмыч: Пока ты искал вулканца, мы с ней пересеклись и все обсудили.|W|character_egorich thinks",
		"Знакомься - ирод окаянный, который будет обвинять тебя во всех грехах человечества.|W|character_sonya death",
		"Егорыч: ...|W|character_egorich suspects|---|REACT frustration",
		"Тёмыч: Так, что ж... Какие-нибудь новости?|W|character_sonya death",
		"Соня: ...",
		"Тёмыч: Никаких зацепок?",
		"Соня: ...",
		"Егорыч: Это бесполезно, Тьоха.|W|character_egorich thinks",
		"*пинг*|G|character_egorich all_of_sudden|---|REACT surprise",
		"Тёмыч: Мне пришла ссылка на инсту.|W|character_sonya death",
		"Что тут?",
		"Соня: Ну открой, посмотри.|P",
		"Тёмыч: Открою и посмотрю.|W",
		"Хмм, по всей видимости, это страничка в инсте, принадлежащая...",
		"Чё?|W|---|STOP all|REACT surprise",
		"Фильмоновой? Этой стерве?",
		"Егорыч: Давно я не слышал этой фамилии. Какой из?|W|character_egorich suspects|START suspense",
		"Тёмыч: Большая которая. Смотри, какая-то фотка месячной давности.",
		"'На вписоне у подружки. У них там жарко.'|W|photo_with_filmonova1",
		"Егорыч: Ниче се... Она покрасилась? Смотри, в этом же посту второе фото.",
		"'Накупили бухла, щас будем зажигать.'|W|photo_with_filmonova2",
		"На этой фотке уже есть Кирова. Какая из них сделана раньше?",
		"Тёмыч: Хмм. Смотри, инста отметила даты загрузки. Групповая фото с Кировой выложена раньше.",
		"SKIP_THIS|W|default",
		"Егорыч: Надо дедржать эти фотки во внимании.|W|character_egorich thinks",
		"~~~ Фото Фильмоновой, Жаровой, Кировой и Лены сохранено.|B|---|---|REACT fanfare_newev|2512|footage_spec1;Фото Махи, Иры, Одо и Лены;Нажмите 'подробнее' для описания;Дата публикации: 25.03.2020 - 21:00. Подпись - 'Накупили бухла, щас будем зажигать.'.",
		"~~~ Фото Фильмоновой и Лены сохранено.|B|---|---|REACT fanfare_newev|2512|footage_spec2;Фото Махи и Лены;Нажмите 'подробнее' для описания;Дата публикации: 25.03.2020 - 22:20. Подпись - 'У них там жарко...'. Предположительно, во время съёмки происходило преступление, поэтому Жаровой на ней нет. Почему на ней нет Ады Кировой - надо выяснить.",
		"Егорыч: Ага. Учитывая, что это - наши единственные улики.|W|character_egorich laughs|---|REACT frustration",
		"Че ржёшь, чертила?|W|character_egorich all_of_sudden|---|REACT damage",
		"Соня: ...|W|character_sonya death",
		"Я пойду. Увидимся.|P",
		"Тёмыч: Угу.|W",
		"Егорыч: 'Угу'?|W|character_egorich thinks",
		"Тёмыч: Эээ, нет, тебе послышалось.",
		"(Ну конечно, ирод окаянный нас не слышит. Нас никто не слышит.)|B",
		"(Телепатия во всей своей красе... 'телепатия')",
		"...|W|character_egorich HIDE",
		"Егорыч: Что же, напомню, что Ада Кирова все еще существует и, вроде, должна быть в столовке.|W|character_egorich yee|STOP all",
		"Тёмыч: ....Точно.",
		"Ладно, пойдём её нагоним",
		"SKIP_THIS|W|character_egorich HIDE|START investigation_op",
		"MAIN",
	]
	if loc_file.get_value("Special","Met_Liena","") == "1":
		check_for_read_chats = false
		read_chats = [false,false,false,false]
		Shows = [
			"a 123",
		]
		Chats = [
			"Соня Виноградова;267",
			"Ситуация с Егорычем;279",
			"",
			"",
		]
		NoShow = 346
		$POIs/poi_1.text = "325"
		$POIs/poi_2.text = "337"
		$POIs/poi_3.free()
		$POIs/poi_4.free()
		$POIs/poi_5.free()
		if loc_file.get_value("Special","Met_Sonya_After_Liena","") == "1":
			if loc_file.get_value("Secrets","res://scenes/case_4/invest_4/amesshall_day1.tscn","") != "1":
				if loc_file.get_value("Special","Discussed_Odo_Psychelocks_with_Sonya","") == "1":
					goto_when_was = 399
				else:
					loc_file.set_value("Special","Discussed_Odo_Psychelocks_with_Sonya","1")
					loc_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
					goto_when_was = 353
				Chats = [
					"",
					"",
					"",
					"",
				]
			else:
				goto_when_was = 265
		else:
			goto_when_was = 239
			loc_file.set_value("Special","Met_Sonya_After_Liena","1")
			loc_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
	else:
		if loc_file.get_value("Locations","res://scenes/case_4/invest_4/aappendix_day1.tscn","") == "1" and loc_file.get_value("Locations","res://scenes/case_4/invest_4/ametod_day1.tscn","") == "1":
			if loc_file.get_value("Special","Fizmat_reached_stage_2","") == "1":
				goto_when_was = 237
			else:
				goto_when_was = 147
			loc_file.set_value("Special","Fizmat_reached_stage_2","1")
			loc_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
			$POIs.free()
			Chats = [
				"",
				"",
				"",
				"",
			]
			check_for_read_chats = false
			read_chats = [false,false,false,false]
		else:
			goto_when_was = 51
			print("Stage 1 of this scene")
			print("Chats")
			Shows = [
				"badge 110",
			]
			Chats = [
				"Ира Жарова;54",
				"Мореплаватель;65",
				"Адвокатство;78",
				"",
			]
			check_for_read_chats = false
			read_chats = [false,false,false,false]
	Moves = [
		"Методкабинет;res://scenes/case_4/invest_4/ametod_day1.tscn",
		"",
		"",
		"",
	]
	if $investigation_screen/ArcBG/Label.text[-1] == "B":
		Dialogue[93] = "И даже тот суд не всех переубедил."
		Dialogue[99] = "(Единственная, кто всерьез воспринимает мою невиновность в той краже.)|B"
		Dialogue[250] = "Как меня за то дело с деньгой"
		print("Swapping dialogue line for arc B")
		Chats[3] = "3-й кейс;101"
	print($investigation_screen/ArcBG/Label.text[-1])


func _on_investigation_screen_next():
	if $investigation_screen.Cur == 320:
		loc_file.set_value("Special","Sonya_Chatted","1")
		loc_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
