extends Node2D
var Anims
var Dialogue
var Ev
var Music
var loc_file = ConfigFile.new()
var Cast
func _ready():
	Dialogue = [ # диалоги. 
		"",
		"Е. Анатольевна: Все готовы?",
		"*стук*",
		"Судебное заседание по делу Марии Фильмоновой объявляется открытым!",
		"Стороны готовы?",
		"Тёмыч: Да, Ваша Честь!",
		"Соня: ...",
		"Тёмыч: (Ну же...) B",
		"(Я не хочу, чтобы эта байда крашнулась прямо сейчас...) B",
		"(Иначе это может подорвать её отношение ко мне.) B",
		"(Не то, чтобы я слишком сильно по этому поводу волновался, но...) B",
		"(...)",
		"Соня: ... W",
		"Да. Y",
		"Егорыч: Ого, она умеет разговаривать? W",
		"Стоять, это... Это же...",
		"Это же та херня, которая меня ударила током!",
		"Тёмыч: Шшш.",
		"(Не шухeри мне всю малину) B",
		"Е. Анатольевна: Ого, интересно... Я не думала, что ты будешь сегодня разговаривать. Это Артём помог? Очень, очень, ммм, интересно... W",
		"Ладно. В таком случае прошу изложить суть обвинения, Виноградова",
		"Тёмыч: (Блин, я не из тех, кто постоянно придирается к именам-фамилиям, но...) B",
		"(Я очень сильно хочу сделать из неё вино)",
		"(Это желание не покидало меня с тех пор, как я услышал её имя)",
		"(Что со мной не так???)",
		"Соня: Жертва - Ира Жарова. Y",
		"Подозревается Мария Фильмонова.",
		"Обвинение - нанесение телесных повреждений",
		"Мотив - ревность",
		"Тёмыч: Немногословно, а? W",
		"Соня: ...",
		"Е. Анатольевна: Нам достаточно, думаю.",
		"Соня: Улики: Y",
		"~~~ Медкнижка Жаровой добавлена в записи суда.",
		"~~~ Видеозапись добавлена в записи суда.",
		"Тёмыч: Вау, на этой карточке - видео? W",
		"Е. Анатольевна: Да, на ней так и написано. Это определенно видео.",
		"Или у тебя еще остались сомнения?",
		"Егорыч: А что, если это не видео?",
		"Е. Анатольевна: Ч-Что?",
		"Это ВИДЕОЗАПИСЬ",
		"И это ФАКТ",
		"Артём, ты можешь включить эту запись?",
		"Тёмыч: Да, наверняка.",
		"Егорыч: Вау, это действительно видеозапись",
		"Е. Анатольевна: На карточке написано 'Видеозапись'",
		"В записях суда эта карточка числится как видеозапись",
		"Я сама просмотрела эту запись и на моих глазах Аполлонов записал эту видеозапись на эту карточку для этого заседания.",
		"Но у Ищенко Егора все равно сомнения...",
		"Тёмыч: (Это ироничное молчание было крайне ироничным.) B",
		"Е. Анатольевна: Что же, попрошу первого свидетеля к трибуне. W",
		"Соня: ...",
		"Ищейка. Y",
		"Тёмыч: БАНКОВСКАЯ ЯЧЕЙКА!!! W",
		"АААААА, ШУУУУУТКАААААА-ЮЮЮЮЮМООООООР ПОДОСПЕЕЕЕЕЕЕЛ",
		"Е. Анатольевна: ?",
		"Егорыч: ?",
		"Соня: ?",
		"Тёмыч: ... Это было как-то неуместно, да?",
		"Е. Анатольевна: ............",
		"Тёмыч: (Это молчание давит на меня... Нужно следить за юмором своим.) B",
		"Эмм, ладно, давайте этого вашего следователя... W",
		"Соня: ...",
		"Егорыч: Кстати, Тьоха... Ты помнишь, что вчера Лентольна сказала, когда уликами делилась, что их нашел Аполлонов?",
		"Тёмыч: Да. И я сейчас не удивлюсь, если Палтос выйдет...",
		"???: Всем здравствуйте.",
		"Тёмыч: Ну да, не удивлюсь... Действительно",
		"(Это Аполлонов. До какого-то момента, мы были хорошими друзьями) B",
		"(Но у него случилась беда с башкой и, да...)",
		"Соня: Анкета Y",
		"Аполлонов: Что? W",
		"Тёмыч: Она просит назвать имя и фамилию.",
		"И что там еще.",
		"Тебе ли не знать, Ирод Окаянный, что прокуроры требуют от каждого свида.",
		"Аполлонов: Тебя не спрашивали.",
		"Тёмыч: *вздох* как скажешь.",
		"(В следующий раз, когда он что-то спросит у неё, я включу секундомер) B",
		"(Посмотрим, на сколько его хватит...)",
		"Аполлонов: Ладно, что касается преступления... W",
		"Соня: ...",
		"Анкета. Y",
		"Аполлонов: А, что? W",
		"Тёмыч: *вздох*",
		"(Это надолго...) B",
		"Соня: ... W",
		"Аполлонов: ...",
		"Что ты от меня хочешь?",
		"Е. Анатольевна: Имя и профессия, свидетель... *вздох*",
		"Аполлонов: Это реально так важно?",
		"Тёмыч: Внатуре, ну легче уже этот шаг пропустить.",
		"Е. Анатольевна: Ладно.",
		"Соня: ...",
		"Е. Анатольевна: Следователь, докладывайте материалы дела",
		"Аполлонов: Так я следователь, или свидетель?",
		"Тёмыч: ........",
		"OUT res://scenes/case_2/trial_day1/trial_2.tscn",
		"",
	]
	Music = [
		"",
		"Е. Анатольевна: Все готовы?",
		"*стук*",
		"START trial Судебное заседание по делу Марии Фильмоновой объявляется открытым!",
		"Стороны готовы?",
		"Тёмыч: Да, Ваша Честь!",
		"Соня: ...",
		"Тёмыч: (Ну же...) B",
		"(Я не хочу, чтобы эта байда крашнулась прямо сейчас...) B",
		"(Иначе это может подорвать её отношение ко мне.) B",
		"(Не то, чтобы я слишком сильно по этому поводу волновался, но...) B",
		"(...)",
		"Соня: ... W",
		"REACT surprise Да. Y",
		"Егорыч: Ого, она умеет разговаривать? W",
		"Стоять, это... Это же...",
		"REACT damage Это же та херня, которая меня ударила током!",
		"Тёмыч: Шшш.",
		"(Не шухeри мне всю малину) B",
		"Е. Анатольевна: Ого, интересно... W",
		"Ладно. В таком случае прошу изложить суть обвинения, Виноградова",
		"Тёмыч: (Блин, я не из тех, кто постоянно придирается к именам-фамилиям, но...) B",
		"(Я очень сильно хочу сделать из неё вино)",
		"(Это желание не покидало меня с тех пор, как я услышал её имя)",
		"STOP (Что со мной не так???)",
		"START logic Соня: Жертва - Ира Жарова. Y",
		"Подозревается Мария Фильмонова.",
		"Обвинение - нанесение телесных повреждений",
		"Мотив - ревность",
		"Тёмыч: Немногословно, а? W",
		"Соня: ...",
		"Е. Анатольевна: Нам достаточно, думаю.",
		"Соня: Улики: Y",
		"~~~ Медкнижка Жаровой добавлена в записи суда.",
		"~~~ Видеозапись добавлена в записи суда.",
		"Тёмыч: Вау, на этой карточке - видео? W",
		"Е. Анатольевна: Да, на ней так и написано. Это определенно видео.",
		"Или у тебя еще остались сомнения?",
		"Егорыч: А что, если это не видео?",
		"Е. Анатольевна: Ч-Что?",
		"Это ВИДЕОЗАПИСЬ",
		"И это ФАКТ",
		"Артём, ты можешь включить эту запись?",
		"Тёмыч: Да, наверняка.",
		"Егорыч: Вау, это действительно видеозапись",
		"Е. Анатольевна: На карточке написано 'Видеозапись'",
		"В записях суда эта карточка числится как видеозапись",
		"Я сама просмотрела эту запись и на моих глазах Аполлонов записал её",
		"Но у Ищенко Егора все равно сомнения..............",
		"REACT surprise Тёмыч: (Это ироничное молчание было крайне ироничным.) B",
		"Е. Анатольевна: Что же, попрошу первого свидетеля к трибуне. W",
		"Соня: ...",
		"Ищейка. Y",
		"REACT damage Тёмыч: БАНКОВСКАЯ ЯЧЕЙКА!!! W",
		"STOP АААААА, ШУУУУУТКАААААА-ЮЮЮЮЮМООООООР ПОДОСПЕЕЕЕЕЕЕЛ",
		"REACT surprise Е. Анатольевна: ?",
		"REACT surprise Егорыч: ?",
		"REACT surprise Соня: ?",
		"Тёмыч: ... Это было как-то неуместно, да?",
		"Е. Анатольевна: ............",
		"Тёмыч: (Это молчание давит на меня... Нужно следить за юмором своим.) B",
		"Эмм, ладно, давайте этого вашего следователя... W",
		"Соня: ...",
		"START logic Егорыч: Кстати, Тьоха... Ты помнишь, что вчера Лентольна сказала, когда уликами делилась, что их нашел Аполлонов?",
		"Тёмыч: Да. И я сейчас не удивлюсь, если Палтос выйдет...",
		"STOP ???: Всем здравствуйте.",
		"Тёмыч: Ну да, не удивлюсь... Действительно",
		"START enterwit (Это Аполлонов. До какого-то момента, мы были хорошими друзьями) B",
		"(Но у него случилась беда с башкой и, да...)",
		"Соня: Анкета Y",
		"Аполлонов: Что? W",
		"Тёмыч: Она просит назвать имя и фамилию.",
		"И что там еще.",
		"Тебе ли не знать, Ирод Окаянный, что прокуроры требуют от каждого свида.",
		"Аполлонов: Тебя не спрашивали.",
		"Тёмыч: *вздох* как скажешь.",
		"(В следующий раз, когда он что-то спросит у неё, я включу секундомер) B",
		"(Посмотрим, на сколько его хватит...)",
		"Аполлонов: Ладно, что касается преступления... W",
		"Соня: ...",
		"Анкета. Y",
		"Аполлонов: А, что? W",
		"Тёмыч: *вздох*",
		"(Это надолго...) B",
		"Соня: ... W",
		"Аполлонов: ...",
		"Что ты от меня хочешь?",
		"Е. Анатольевна: Имя и профессия, свидетель... *вздох*",
		"Аполлонов: Это реально так важно?",
		"REACT slam Тёмыч: Внатуре, ну легче уже этот шаг пропустить.",
		"Е. Анатольевна: Ладно.",
		"Соня: ...",
		"Е. Анатольевна: Следователь, докладывайте материалы дела",
		"Аполлонов: Так я следователь, или свидетель?",
		"Тёмыч: ........",
		"OUT",
		"",
	]
	Anims = [ # массив, в котором 1 слово это перс, а 2 - его анимка
		"",
		"character_lentoln SHOW тольевна: Все готовы?",
		"*стук*",
		"START trial Судебное заседание по делу Марии Фильмоновой объявляется открытым!",
		"Стороны готовы?",
		"character_temich SHOW Тёмыч: Да, Ваша Честь! POS def",
		"character_sonya SHOW : ... POS pro",
		"character_temich SHOW Тёмыч: (Ну же...) POS def",
		"character_temich comeon (Я не хочу, чтобы эта байда крашнулась прямо сейчас...) B",
		"(Иначе это может подорвать её отношение ко мне.) B",
		"character_temich thonker (Не то, чтобы я слишком сильно по этому поводу волновался, но...) B",
		"(...)",
		"character_sonya SHOW : ... POS pro",
		"REACT surprise Да.",
		"character_egorich SHOW Ого, она умеет разговаривать? W POS hld",
		"character_egorich all_of_sudden Стоять, это... Это же...",
		"character_egorich rage Это же та херня, которая меня ударила током!",
		"character_temich SHOW Тёмыч: Шшш. POS def",
		"character_temich comeon (Не шухeри мне всю малину) B",
		"character_lentoln SHOW тольевна: Ого, интересно... W POS jud",
		"Ладно. В таком случае прошу изложить суть обвинения, Виноградова",
		"character_temich SHOW : (Блин, я не из тех, кто постоянно придирается к именам-фамилиям, но...) B POS def",
		"(Я очень сильно хочу сделать из неё вино)",
		"(Это желание не покидало меня с тех пор, как я услышал её имя)",
		"(Что со мной не так???)",
		"character_sonya phone : Жертва - Ира Жарова. Y POS pro",
		"Подозревается Мария Фильмонова.",
		"Обвинение - нанесение телесных повреждений",
		"character_sonya death Мотив - ревность",
		"character_temich SHOW : Немногословно, а? W POS def",
		"character_sonya default : ... POS pro",
		"character_lentoln SHOW тольевна: Нам достаточно, думаю. POS jud",
		"character_sonya phone : Улики: Y POS pro",
		"~~~ Медкнижка Жаровой добавлена в записи суда.",
		"~~~ Видеозапись добавлена в записи суда.",
		"character_temich SHOW : Вау, на этой карточке - видео? W POS def",
		"character_lentoln SHOW тольевна: Да, на ней так и написано. Это определенно видео. POS jud",
		"Или у тебя еще остались сомнения?",
		"character_egorich suspects А что, если это не видео? POS hld",
		"character_lentoln SHOW тольевна: Ч-Что? POS jud",
		"Это ВИДЕОЗАПИСЬ",
		"И это ФАКТ",
		"Артём, ты можешь включить эту запись?",
		"character_temich thonker : Да, наверняка. POS def",
		"character_egorich all_of_sudden Вау, это действительно видеозапись POS hld",
		"character_lentoln SHOW тольевна: На карточке написано 'Видеозапись' POS jud",
		"В записях суда эта карточка числится как видеозапись",
		"Я сама просмотрела эту запись и на моих глазах Аполлонов записал её",
		"Но у Ищенко Егора все равно сомнения..............",
		"character_temich default : (Это ироничное молчание было крайне ироничным.) B POS def",
		"character_lentoln SHOW тольевна: Что же, попрошу первого свидетеля к трибуне. W POS jud",
		"character_sonya SHOW : ... POS pro",
		"Ищейка. Y",
		"character_temich yee : БАНКОВСКАЯ ЯЧЕЙКА!!! W POS def",
		"АААААА, ШУУУУУТКАААААА-ЮЮЮЮЮМООООООР ПОДОСПЕЕЕЕЕЕЕЛ",
		"character_lentoln SHOW тольевна: ? POS jud",
		"character_egorich thinks ? POS hld",
		"character_sonya death : ? POS pro",
		"character_temich comeon : ... Это было как-то неуместно, да? POS def",
		"character_lentoln SHOW тольевна: ............ POS jud",
		"character_temich rage : (Это молчание давит на меня... Нужно следить за юмором своим.) B POS def",
		"character_temich thonker Эмм, ладно, давайте этого вашего следователя... W",
		"character_sonya SHOW : ... POS pro",
		"character_egorich thinks Кстати, Тьоха... Ты помнишь, что вчера Лентольна сказала, когда уликами делилась, что их нашел Аполлонов? POS hld",
		" : Да. И я сейчас не удивлюсь, если Палтос выйдет... POS def",
		"character_wit SHOW ???: Всем здравствуйте. POS wit",
		"character_temich SHOW : Ну да, не удивлюсь... Действительно POS def",
		"character_temich thinks (Это Аполлонов. До какого-то момента, мы были хорошими друзьями) B",
		"(Но у него случилась беда с башкой и, да...)",
		"character_sonya SHOW : Анкета Y POS pro",
		"character_wit SHOW  Что? W POS wit",
		"character_temich SHOW : Она просит назвать имя и фамилию. POS def",
		"И что там еще.",
		"Тебе ли не знать, Ирод Окаянный, что прокуроры требуют от каждого свида.",
		"character_wit hmpf  Тебя не спрашивали. POS wit",
		"character_temich thonker : *вздох* как скажешь. POS def",
		"character_temich kekk (В следующий раз, когда он что-то спросит у неё, я включу секундомер) B",
		"(Посмотрим, на сколько его хватит...)",
		"character_wit default  Ладно, что касается преступления... W POS wit",
		"character_sonya death : ... POS pro",
		"Анкета. Y",
		"character_wit hmm  А, что? W POS wit",
		"character_temich no : *вздох* POS def",
		"(Это надолго...) B",
		"character_sonya SHOW : ... W POS pro",
		"character_wit SHOW  ... POS wit",
		"character_wit rage Что ты от меня хочешь?",
		"character_lentoln SHOW тольевна: Имя и профессия, свидетель... *вздох* POS jud",
		"character_wit objection  Это реально так важно? POS wit",
		"character_temich deskslam : Внатуре, ну легче уже этот шаг пропустить. POS def",
		"character_lentoln SHOW тольевна: Ладно. POS jud",
		"character_sonya death : ... POS pro",
		"character_lentoln SHOW тольевна: Следователь, докладывайте материалы дела POS jud",
		"character_wit hmm  Так я следователь, или свидетель? POS wit",
		"character_temich no : ........ POS def",
		"OUT",
		"",
	]
	Ev = [
		"",
		"Е. Анатольевна: Все готовы?",
		"*стук*",
		"START trial Судебное заседание по делу Марии Фильмоновой объявляется открытым!",
		"Стороны готовы?",
		"Тёмыч: Да, Ваша Честь!",
		"Соня: ...",
		"Тёмыч: (Ну же...) B",
		"(Я не хочу, чтобы эта байда крашнулась прямо сейчас...) B",
		"(Иначе это может подорвать её отношение ко мне.) B",
		"(Не то, чтобы я слишком сильно по этому поводу волновался, но...) B",
		"(...)",
		"Соня: ... W",
		"REACT surprise Да. Y",
		"character_egorich SHOW Ого, она умеет разговаривать? W",
		"Стоять, это... Это же...",
		"Это же та херня, которая меня ударила током!",
		"Тёмыч: Шшш.",
		"(Не шухeри мне всю малину) B",
		"Е. Анатольевна: Ого, интересно... W",
		"Ладно. В таком случае прошу изложить суть обвинения, Виноградова",
		"Тёмыч: (Блин, я не из тех, кто постоянно придирается к именам-фамилиям, но...) B",
		"(Я очень сильно хочу сделать из неё вино)",
		"(Это желание не покидало меня с тех пор, как я услышал её имя)",
		"(Что со мной не так???)",
		"Соня: Жертва - Ира Жарова. Y",
		"Подозревается Мария Фильмонова.",
		"Обвинение - нанесение телесных повреждений",
		"Мотив - ревность",
		"Тёмыч: Немногословно, а? W",
		"Соня: ...",
		"Е. Анатольевна: Нам достаточно, думаю.",
		"Соня: Улики: Y",
		"5/autopsy/Отчет о вскрытии. Травмы - синяки по телу, переломы костей и ребер, колотое ранение в грудь, сотрясение мозга./0",
		"6/footage/Видеозапись. Снята свидетелем с игровой площадки. На ней видно, как Ира и Маша ссорятся, потом вступают в драку./0",
		"Тёмыч: Вау, на этой карточке - видео? W",
		"Е. Анатольевна: Да, на ней так и написано. Это определенно видео.",
		"Или у тебя еще остались сомнения?",
		"character_egorich SHOW А что, если это не видео?",
		"Е. Анатольевна: Ч-Что?",
		"Это ВИДЕОЗАПИСЬ",
		"И это ФАКТ",
		"Артём, ты можешь включить эту запись?",
		"Тёмыч: Да, наверняка.",
		"character_egorich SHOW Вау, это действительно видеозапись",
		"Е. Анатольевна: На карточке написано 'Видеозапись'",
		"В записях суда эта карточка числится как видеозапись",
		"Я сама просмотрела эту запись и на моих глазах Аполлонов записал её",
		"Но у Ищенко Егора все равно сомнения..............",
		"Тёмыч: (Это ироничное молчание было крайне ироничным.) B",
		"Е. Анатольевна: Что же, попрошу первого свидетеля к трибуне. W",
		"Соня: ...",
		"Ищейка. Y",
		"Тёмыч: БАНКОВСКАЯ ЯЧЕЙКА!!! W",
		"АААААА, ШУУУУУТКАААААА-ЮЮЮЮЮМООООООР ПОДОСПЕЕЕЕЕЕЕЛ",
		"Е. Анатольевна: ?",
		"character_egorich SHOW ?",
		"Соня: ?",
		"Тёмыч: ... Это было как-то неуместно, да?",
		"Е. Анатольевна: ............",
		"Тёмыч: (Это молчание давит на меня... Нужно следить за юмором своим.) B",
		"Эмм, ладно, давайте этого вашего следователя... W",
		"Соня: ...",
		"character_egorich SHOW Кстати, Тьоха... Ты помнишь, что вчера Лентольна сказала, когда уликами делилась, что их нашел Аполлонов?",
		"Тёмыч: Да. И я сейчас не удивлюсь, если Палтос выйдет...",
		"???: Всем здравствуйте.",
		"Тёмыч: Ну да, не удивлюсь... Действительно",
		"(Это Аполлонов. До какого-то момента, мы были хорошими друзьями) B",
		"(Но у него случилась беда с башкой и, да...)",
		"Соня: Анкета Y",
		"Аполлонов: Что? W",
		"Тёмыч: Она просит назвать имя и фамилию.",
		"И что там еще.",
		"Тебе ли не знать, Ирод Окаянный, что прокуроры требуют от каждого свида.",
		"Аполлонов: Тебя не спрашивали.",
		"Тёмыч: *вздох* как скажешь.",
		"(В следующий раз, когда он что-то спросит у неё, я включу секундомер) B",
		"(Посмотрим, на сколько его хватит...)",
		"Аполлонов: Ладно, что касается преступления... W",
		"Соня: ...",
		"Анкета. Y",
		"Аполлонов: А, что? W",
		"Тёмыч: *вздох*",
		"(Это надолго...) B",
		"Соня: ... W",
		"Аполлонов: ...",
		"Что ты от меня хочешь?",
		"Е. Анатольевна: Имя и профессия, свидетель... *вздох*",
		"Аполлонов: Это реально так важно?",
		"Тёмыч: Внатуре, ну легче уже этот шаг пропустить.",
		"Е. Анатольевна: Ладно.",
		"Соня: ...",
		"Е. Анатольевна: Следователь, докладывайте материалы дела",
		"Аполлонов: Так я следователь, или свидетель?",
		"Тёмыч: ........",
		"OUT",
		"",
	]
	loc_file.load("C:/Games/ddkg2.save")
	loc_file.set_value("Locations","Last",filename)
	loc_file.save("C:/Games/ddkg2.save")
