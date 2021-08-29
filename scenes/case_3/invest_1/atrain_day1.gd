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
		"6 октября. 10:30. В поезде|G|---|---|---", #"Проверка провалена|R|character_masha hey|START omen|REACT damage",
		"Егорыч: (Меня зовут Ищенко Егор, я - Тьохин друг с 5-го класса...)|B",
		"(Сейчас мы на школьной экскурсии по западной Украине.)|B",
		"(Едем из Винницы, где мы пробыли где-то два дня, во Львов.)|B",
		"(Едем как раз таки с экскурсии по городу. Видели и певучий фонтан, и музей Пирогова, и чего только в Виннице нету?)|B",
		"*БУМ*|R|---|---|REACT slam",
		"Егорыч: Ч-Что?!|W",
		"Что это было?!",
		"*скрип двери*|R",
		"Тёмыч: Егогорыч, эти двери скрипят громче, чем мои суставы после двух алгебр|W|character_temich comeon|---|REACT damage",
		"Егорыч: Тьоха, что это было? Поезд нехило тряхнуло...|W",
		"Тёмыч: Когда я выбрасывал фантики в тамбуре, в толкан зашел Гордон Фриман|W|character_temich wonder|---|REACT surprise",
		"Егорыч: Гордон Фримэн?|W",
		"Тёмыч: Потому что с мотыгой.|W|character_temich kekk|---|REACT frustration",
		"Эээ, не, точнее, с монтировкой, кхм.|W",
		"Егорыч: Кто-то зашел в туалет с монтировкой?|W",
		"Тёмыч: Да. И этот кто-то, видимо, вбросил монтировку в толкан|W",
		"Чуть не отправив нас в Зен|W",
		"Егорыч: (Ну и ну, чего только люди не придумают, лишь бы подвергнуть других опасности.)|B|---|START train1|---",
		"MAIN",
		"Егорыч: Тьоха, че ты там делаешь?|W|character_temich default|---|---", # 21 ноут
		"Тёмыч: Я делаю сверхкрутую программу по взлому пентагона|W|character_temich kekk|---|---",
		"Егорыч: А если серьезно?",
		"Тёмыч: ...",
		"if(output == 'a'){",
		"return 'a';",
		"}elseif(output == 'b'){",
		"return 'b';",
		"}elseif...",
		"Егорыч: Эмм, я не понимаю?",
		"Тёмыч: Я делаю игру шестой год и пока что в ней есть только базовые механики|W|character_temich thonker|---|---",
		"Хочу стать богатым и известным|W|character_temich yee|---|---",
		"Егорыч: Я слабо представляю как это возможно",
		"Тёмыч: Один человек так уже сделал|W|character_temich wonder|---|---",
		"Так что у меня есть все шансы",
		"Егорыч: (Ну и ну.)|B",
		"MAIN",
		"Егорыч: У! Внезапная кража чипсов!|W|character_temich default|---|REACT surprise", # 38 еда
		"Тёмыч: ...|W|character_temich deskslam|---|REACT slam",
		"Егорыч: Ну, или...",
		"Тёмыч: Конечно, бери!|W|character_temich kekk|---|---",
		"Егорыч: Эээ, да, спасибо...",
		"(Тьоха со своими приколами)|B",
		"(Доприкалывается)|B|character_temich wonder|---|---",
		"Тёмыч: *буль буль буль буль буль*|R",
		"Пока Ироды Окаяные пьют пиво|W|character_temich kekk|---|---",
		"Адвокат от 8-В Тьоха бухает квасом.|W|character_temich yee|---|---",
		"MAIN",
		"Егорыч: Кто на полке спать будет?|W|character_temich thonker|---|---", # 49 полка
		"Тёмыч: Ну, я собирался спать на полке, а не на полу.|W|character_temich kekk|---|---",
		"Егорыч: Я имею ввиду, на верхнюю полку кто полезет? Я уже был на верхней полке, так что твоя очередь.",
		"Тёмыч: Окц.|W|character_temich default|---|---",
		"Егорыч: Хм? Ты быстро сдался...",
		"(Не к добру это)|B",
		"Тёмыч: *лезет*|R|character_temich HIDE|---|---",
		"Егорыч: Тьоха? Тебе там норм?|W",
		"Тёмыч: Эхехехехехехеххехехеехе",
		"Егорыч: Э! Э! Э! Куда ты меня тащишь?!",
		"ААА!",
		"АПУТИ!!!",
		"Тёмыч: Это я гравитационное поле создал вокруг себя своим весом|W|character_temich HIDE|---|REACT surprose",
		"Ух.|W|character_temich kekk|---|REACT frustration",
		"Егорыч: А с другой стороны, мы же через пару часов приедем, где-то вечером уже...",
		"Не стоит делить полок пока что.",
		"Тёмыч: Мало нас как-то, раз уж эта 'ячейка' свободна|W|character_temich thonker|---|REACT frustration",
		"Так бы нам как раз таки пришлось 'делить шконки'|W|character_temich kekk|---|---",
		"Егорыч: (Я не говорил 'шконки')|B",
		"MAIN", 
		"Тёмыч: Весьма вдохновляет вид прикарпатья|W|character_temich wonder|---|---", # 69 пейзаж
		"В нашем славном Запоре, все, что можно увидеть, это бесконечные плантации, огороды|W|character_temich comeon|---|---",
		"А тут холмы, прям горы практически|W|character_temich thonker|---|---",
		"Обрывы...",
		"Каплиці, ммм...",
		"Егорыч: Ага... Давно не было такого, что ты смотришь в окно",
		"И видишь что-то концептуально новое",
		"Тёмыч: Скажи, мой славный друг,|W|character_temich wonder|---|---",
		"Ирод Окаянный,",
		"Егорыч: (Мой славный друг, Ирод Окаянный)|B",
		"(Лучший подбор слов, Тьоха)",
		"Тёмыч: Как ты думаешь, какие пейзажи откроются нам на Карпатах? В Закарпатье?|W",
		"Егорыч: Мне-то откуда знать?",
		"Тёмыч: Действительно.",
		"MAIN",
		"Егорыч: Как экскурсия, Тьоха?|W|character_temich thonker|---|---", # 84 Как экскурсия
		"Тёмыч: Я не сильно обращал внимание на что-либо, кроме Порошенковского фонтана|W|character_temich no|---|REACT surprise",
		"Егорыч: А чё так-то? Было вроде интересно...",
		"Да и в телефоне ты вроде бы не сидел особо...",
		"Только, разве что ты с Со--",
		"Тёмыч: Я и раньше видел, как на воду проектируют изображение|W|character_temich wonder|---|REACT surprise",
		"Но чтоб с лазерами? Ну и ну...|W|character_temich deskslam|---|---",
		"Егорыч: Эм, да, фонтан с лазерами был крутой|W|character_temich kekk|---|REACT frustration",
		"(Он всю экскурсию мотался вместе с...)|B",
		"(Виноградовой!)",
		"(Только он никогда не позволит мне это сказать вслух, наверняка.)",
		"Тёмыч: Да... Световой фонтан был крутым|W|character_temich thonker|---|---",
		"MAIN",
		"Егорыч: Тёмыч, что ты думаешь о Виноградовой?|W|character_temich kekk|---|---", # 97 Соня
		"Тёмыч: В английском языке есть слово|W|character_temich wonder|---|---",
		"Intimidation|W|character_temich thonker|---|REACT frustration",
		"Егорыч: Тобиж 'Напряжение'?",
		"Тёмыч: Наверное.|W|character_temich kekk|---|---",
		"У меня уже часто бывает такое, что я знаю больше английских слов, чем русских.",
		"Что со мной не так? Ух...|W|character_temich comeon|---|REACT surprise",
		"Егорыч: А почему именно 'напряжение?'",
		"Тёмыч: Егогорыч, посмотри на её глаза.|W|character_temich default|---|---",
		"На эти жёлтые глаза|W|character_temich wonder|---|---",
		"Егорыч: Они желтые?",
		"Я никогда не замечал.",
		"Тёмыч: Может потому, что тебе было неприятно смотреть ей|W|character_temich default|---|---",
		"Прямо в глаза?|W|character_temich wonder|---|REACT surprise",
		"Егорыч: Эмм... Проехали",
		"Не, ну ты на экскурсии с ней достаточно повеселился, как мне кажется.",
		"Тёмыч: В смысле?|W|character_temich rage|---|---",
		"Егорыч: Вы ходили вместе и о чём то разговаривали.",
		"Тёмыч: Не знаю, что ты себе придумал|W|character_temich picard|---|---",
		"Но ты определенно опять утрировал... в какой-то степени.|W|character_temich dadada|---|---",
		"Егорыч: Ладно.",
		"Тёмыч: ...|W|character_temich wonder|---|---",
		"В определенных позах, под её весьма неуместно большой кофтой, вырисовываются неплохие формы.|W|character_temich kekk|---|---",
		"Егорыч: Ты видел? ОооОООО",
		"Тёмыч: *БОНЬК*",
		"Мы не обсуждаем девушек вне их присутствия.",
		"Егорыч: ...Она сидит в соседней ячейке, кстати.|W|---|---|REACT surprise",
		"Тёмыч: Азаза, какая шуууутка.|W|character_temich damn|---|REACT frustration",
		"Егорыч: Ей эта шайтан-машина не мешает, кстати?",
		"Тёмыч: Егорыч, ты сам виноват в том, что синтезатор голоса ударил тебя током.|W|character_temich paper|---|---",
		"Кто знал что ты будешь с ним башню мыть?|W|character_temich picard|---|---",
		"Она достаточно умная чтобы не позволять контакта электроники с водой.|W|character_temich annoyed|---|---",
		"Егорыч: Тьоха, это была дистилированная вода",
		"Тёмыч: То есть ты моешь башню в дистилированной воде?|W|character_temich kekk|---|---",
		"Егорыч: (Ты много чего о мне не знаешь...)|B",
		"MAIN",
		"Егорыч: Тёмыч, во время последнего дела, свидетель Радомир упомянул какое-то определенное дело.|W|---|---|---", # 133 Кейс
		"Тёмыч: Я не думал, что я снова услышу упоминание о нем!|W|character_temich yee|---|REACT surprise",
		"Егорыч: Пролей свет!",
		"Тёмыч: Оно было достаточно страшным и тёмным, на самом деле.|W|character_temich paper|---|---",
		"Тогда изменилась планировка школы!|W|character_temich dadada|---|REACT damage",
		"Егорыч: Да, я помню.",
		"Нет, вообще, я то знаю, что однажды случилось преступление в нашей школе",
		"И из-за него изменилась планировка",
		"Но детали? Оно было закрытым от публики",
		"Тёмыч: Вообще, если я сейчас тебе скажу, ты ведь никому не расскажешь?",
		"Егорыч: Постараюсь. Но ведь кто-то из наших 'соседей' услышит?",
		"Тёмыч: Кому-то из наших 'соседей' наверняка всё равно",
		"Правило №228|W|character_temich wonder|---|---",
		"Люди игнорируют много чего.",
		"Да и тем более та история, которую я тебе расскажу, настолько абсурдная, что никто наверняка мне не поверит|W|character_temich thonker|---|---",
		"Егорыч: (Стоит ли мне слушать?)|B|split:Да:Нет:152:149",
		"Егорыч: Эм, нет, Тьоха, оставим это на потом.|W",
		"Тёмыч: Ок-ц.|W|character_temich kekk|---|---",
		"MAIN",
		"Егорыч: Выкладывай, что уж...|W|---|STOP|---",
		"Тёмыч: Егогорыч, перепланировка в школе случилась, чтобы запечатать место преступления|W|character_temich wonder|START examination-moderato|---",
		"Егорыч: Да, я знаю, но что за преступление то?",
		"(Он постоянно отходит от темы, задолбал уже!)|B",
		"(Хочется его промотать.)",
		"Тёмыч: Четверо шестиклассниц стали жертвами, по всей видимости, группового 'пускания по кругу'|W|character_temich rage|---|REACT damage",
		"Егорыч: Них--",
		"Кхм, то есть, неужели это всё?",
		"Почему это дело настолько, как ты сказал, тёмное?",
		"Точнее, я понимаю, 'групповое пускание по кругу' это КРАЙНЕ серьезное преступление, как для школы",
		"Да и на законодательстве Украины, тебе могут дать за это дело больше, чем за убийство человека",
		"Но... перепланировка школы?",
		"Тёмыч: И не только. Они все были переведены на домашнее обучение *принудительно*",
		"Их заставили покинуть школу, Ирод Окаянный.",
		"Егорыч: В смысле? Я имею ввиду, у нас на районе один такой случай был вроде",
		"Поймали гада, но жертва вроде продолжила себе спокойно жить... относительно.",
		"Если 'спокойно жить' тут применимо",
		"Тёмыч: Да потому что у каждой из жертв наблюдались тяжелейшие психические последствия после этого",
		"Да и тем более, там не просто 'всех посмотрели'",
		"Я, как человек достаточно посвященный, могу сказать, что каждая из жертв была травмирована физически",
		"Одну из них даже обожгли кислотой, взятой из препараторской",
		"Смешали что-то с чем-то, либо просто где-то нашли электролит.",
		"У этой жертвы даже за день до слушания случилась амнезия",
		"И она не могла дать показаний ни на школьном суде, ни на районном суде.",
		"Егорыч: Не может быть...",
		"А кого обвинили в преступлении?",
		"Тёмыч: А вон тут - самое интересное|W|character_temich thonker|---|---",
		"Обвиняемого... не было",
		"Егорыч: А как тогда провели суд?",
		"Тёмыч: Ну, как сказать.",
		"Специально для такого случая, как сейчас, личность обвиняемого была скрыта от нас всех.",
		"И от Палтоса, и от меня.",
		"Иначе, я бы тебе сейчас проболтался.",
		"Егорыч: То есть, какие-то уроды 'воспользовались' четырьмя шестиклассницами, попутно нанося им *физический урон* и подливая на одну из них *кислоту*?",
		"Тёмыч: Я сейчас это рассказывал и чувствовал себя ненормальным.|W|character_temich picard|---|---",
		"Да, Егогорыч. Это дело получило крайне громкий резонанс.",
		"После него я на два года забросил адвокатуру, потому что клиент был признан *виновным*|W|character_temich rekt|---|REACT damage",
		"Егорыч: Неужели...",
		"Тёмыч: Наверное, на районном суде его оправдали.",
		"Куда нам, школьникам, тягаться с юристами.",
		"Но факт есть факт, дело осталось не раскрытым.|W|character_temich wonder|---|---",
		"Жертвы не были допрошены нормально, одна потеряла память",
		"У каждой из них - шрамы как на теле, так и на душе.",
		"Ты можешь проходить мимо них в коридоре, стоять с ними в одной очереди в столовке|W|character_temich rage|---|---",
		"И не знать об этом!",
		"...Равно, как и я.|W|character_temich comeon|---|---",
		"Егорыч: А что ты сам думаешь об этом?",
		"Тёмыч: Башим Дашкерин мог быть замешан, раз уж Радомир напомнил.|W|character_temich paper|---|---",
		"Лично я подозревал, в какой то момент, его",
		"Но не по фактам, а по личному мнению.",
		"Егорыч: Ты знал Башима Дашкерина до нашего последнего дела?",
		"Тёмыч: Не совсем.",
		"Ты часто смотришь на депутата и думаешь",
		"'Ух, бес триклятый, страну разворовал!'|W|character_temich rage|---|REACT damage",
		"Вот точно также я смотрел на Башима и думал|W|character_temich wonder|---|---",
		"'Это наверняка он!'",
		"Егорыч: Ясно...",
		"Как ты думаешь, у этого дела есть шансы на то, чтобы быть раскрытым, в итоге?",
		"Тёмыч: Всё тайное становится явным.|W|character_temich kekk|---|REACT surprise",
		"За рассветом всегда наступает закат.",
		"Егорыч: (Немного неуместна эта линия, но в то же время, такая подходящая...)|B",
		"Тёмыч: Может быть, Егорыч|W",
		"Другой вопрос - а доживем ли мы?",
		"И будет ли это нас колыхать в будующем?",
		"Мы можем узнать правду через секунду",
		"Можем спустя десятки лет",
		"Или наши потомки узнают спустя поколения?",
		"Для меня пока перспектив в этом плане нет...|W|character_temich comeon|---|---",
		"Егорыч: А каковы были улики?",
		"Тёмыч: Я помню... ничего.|W|character_temich thonker|---|---",
		"Я не помню тогдашние записи суда.",
		"Хотя, я помню один документ.|W|character_temich kekk|---|---",
		"Медицинская справка, зацензуренная в стиле SCP",
		"Медицинская справка одной из жертв.",
		"Егорыч: Какой из?",
		"Тёмыч: Все имена и упоминания личности жертвы, аля все детали, по которым можно было бы узнать, кто жертва,",
		"Были замазаны перманентным маркером.",
		"Егорыч: (Другими словами, он не знает.)|B",
		"Тёмыч: Эта улика служила доком отягащяющего обстоятельства.|W",
		"Потому что в документе было указано, что жертва, в итоге, начала страдать потерями памяти.",
		"Судмедэкспертиза, аля санитары из дурки, постановили, что эта амнезия была вызвана травмирующими воспоминаниями",
		"Или чем-то таким, я особо не вникал.",
		"Времени не было.|W|character_temich wonder|---|---",
		"Егорыч: На расследование?",
		"Тёмыч: На всё.",
		"Школьный суд провели за пять минут. Минута на вступление Палтоса, 2 минуты на дебаты, 1 минута ничегонеделания и оставшееся время - вердикт.",
		"Егорыч: Ну, оно понятно...",
		"Почему вы вообще занялись этим делом?",
		"Тёмыч: Ну, школьный суд организовался в форме триады.|W|character_temich thonker|---|---",
		"Егорыч: 'Триады'? Что это такое?",
		"Тёмыч: Лентольны не было. Был 'смотрящий' чел, следивший за порядком. Один из друзей Дашкерина, если не ошибаюсь!",
		"Нейтральный юрист,",
		"Обвинитель,",
		"Защитник.",
		"Прокурор, защита и нейтральный юрист 'голосуют'",
		"И знаешь, почему я бросил тогда дела адвокатские?|character_temich kekk|---|---",
		"Егорыч: Без понятия. Когда ты сказал, что больше не будешь адвокатом, ты никогда даже не намекал на причины.",
		"(Он сказал, что 'потерял веру во всё'. Это была его последняя сентиментальная фраза, после которой он здорово изменился...)|B",
		"(Тьоха всегда был общительным, любил гулять, мы с ним часто в скайпе сидели...)",
		"(Но потом он резко стал... агрессивным, шипастым.)",
		"(Неужели это связано с этим делом?)",
		"Тёмыч: Егорыч, адвокат должен верить своему поручителю.|W",
		"Но я не поверил.",
		"Одна из главных причин, почему заседание закончилось молниеносно, это то, что я проголосовал за *обвинительный* вердикт самым первым.",
		"Егорыч: Что? Зачем?|W|---|---|REACT slam",
		"Тёмыч: Ууу, черт позорный, когда ты не знаешь, кто твой клиент, даже не видел его, не имел с ним дел, у тебя нет сострадания к нему",
		"Егорыч: Ну, остальных своих клиентов ты, взачастую, тоже не знал.",
		"Тёмыч: Но я знал как минимум как они выглядят. Я знал, за что бороться.",
		"Плюс, тогда не было нормальных улик. Типичная улика могла выглядеть как 'Нож, оружие [ЗАСЕКРЕЧЕНО] примененный против [ЖЕРТВЫ №1]'|W|character_temich kekk|---|---",
		"Улики как будто специально были составлены так, чтобы можно было обвинить только безликого некто",
		"Моим планом было - зарашить заседание, чтобы передав материалы в полицию, полиция просто подумала, что школьники тупо не разобрались",
		"Потому что в противном случае, Палтос мог вполне спокойно попоказывать улик свидетелям и всё, все голосуют за 'вину' уже на хоть каких-то основаниях.",
		"Егорыч: Эмм, если я правильно понял...",
		"Тёмыч: Уже в *настоящем* суде, где все улики представлены в оригинальном виде обеим сторонам, у человека было намного больше шансов на оправдательный вердикт. Как минимум 50%.|W|character_temich deskslam|---|REACT slam",
		"Я, скажем так, спас этого человека, обвинив его вместе с остальными, сделав школьный суд безразличным настоящему суду.",
		"Но предал свои приниципы, тем не менее...|W|character_temich rekt|---|---",
		"Егорыч: ...А как вы получили улики, если Лентольна не была замешана?",
		"Тёмыч: Друг Дашкерина. Дашкерин батя по просьбе Башима по просьбе друга Башима получил улики.|W|character_temich default|---|---",
		"Егорыч: Капец многоходовочка.",
		"Но почему Дашкерин в этом случае помог?",
		"Тёмыч: Я, конечно, часто шучу про третий глаз...|W|character_temich kekk|---|REACT surprise",
		"Но я похож на пугало из 'Битвы Экстрасенсов'?",
		"Егорыч: (То есть, он не знает.)|B",
		"Ну и ну...|W",
		"Тёмыч: Я опять уйду в аут.|W|character_temich objection_1|---|REACT intro_woosh",
		"Егорыч: (Куда на этот раз? Опять фантики выбрасывать в тамбур?)|B",
		"(Или он к кому-то пошел?)",
		"Ну ок.|W",
		"(И он свалил.)|B",
		"(Я до сих пор сомневаюсь, что это 'дело' вообще могло произойти и быть рассмотрено у нас.)",
		"(Это же абсурд! 'Тягать' и пытать 4-х девушек это...)",
		"(Невероятно.)",
		"(Мы приезжаем через час, если верить картам и моим рассчетам.)",
		"(Поиграем в Cold Waters, благо, Тьоха оставил свой ноут без присмотра.)",
		"OUT ",
		"Егорыч: Ты не один такой крутой, Тьоха!|W|---|---|---",
		"Тёмыч: Ты хочешь меряться значками? Ууу, зря...!|W|character_temich deskslam|---|REACT slam|show:badge",
		"Только так как ты помощник адвоката, а я адвокат, так что мой значок уже круче|W|character_temich wonder|---|---",
		"Егорыч: За то у моего ремешок круче!",
		"Тёмыч: !|W|character_temich rage|---|REACT damage",
		"MAIN",
		"Егорыч: Тьоха, а ты слышал про то, что у нас в Запорожье есть школа|W|---|---|---",
		"Которая называется 'ЗМЛ№99'?",
		"Тёмыч: Угу. Однажды, папа меня подвозил к школе|W|character_temich wonder|---|---",
		"И подвез к этому 'ЗМЛ№99'",
		"Егорыч: Удивительно, как в одном городе есть две школы",
		"С практически идентичным названием",
		"'Лицей 99' и 'ЗМЛ№99'",
		"Тёмыч: Л значит 'Лицей', а З и М?",
		"Егорыч: Без понятия.",
		"Говорят, там даже своя Лентольна есть!",
		"Тёмыч: Ну и ну...",
		"MAIN",
		"",
	]
# СУКА БЛЯТЬ НЕ ТРОГАЙ ЭТО ГАНДОН НЕДОШТОПАННЫЙ АААААААААААААААААААААААА!!!!!!!!!!!!!!!!!!!!!!!
	loc_file.load("C:/Games/ddkg2.save")
	Chats = [
		"Как экскурсия? 84",
		"Соня 97",
		"'Некое дело' 133",
		"ЗМЛ 99 293",
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
	for i in range(1,5):
		if Chats[i-1] != "":
			get_node("chat_"+str(i)).text = Chats[i-1].left(Chats[i-1].length()-3)
	for i in range(1,5):
		if Moves[i-1] != "":
			get_node("move_"+str(i)).text = Moves[i-1].left(Moves[i-1].length()-Moves[i-1].split(" ")[-1].length())
	print(Chats[0].split(" ")[-1])
	$investigation_screen/frame_record/record_theme.color = Color(0.5,1,0.5)
	EvCount = 4

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
	loc_file.save("C:/Games/ddkg2.save")
