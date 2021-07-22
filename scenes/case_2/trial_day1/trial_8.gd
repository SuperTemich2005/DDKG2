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
		"Тёмыч: Очень занимательно видеть то, как ты пытаешься себя выставить виновной в преступлении, которого ты не в состоянии была совершить",
		"Маша: Я виновна и доказывать обратное смысла нет.",
		"Отпустите меня уже... куда там нужно.",
		"Тёмыч: Ну ты же даже не правду сказала о том, как ты совершала противоречие. А пытаешься себя выставить.",
		"Маха-два-маха--",
		"Маша: Еще раз меня так назовешь и получишь двоечку.",
		"Тёмыч: Ой, у меня в табеле так много этих двоечек, что я в эту поездку уехал только чтобы мама с папой меня тут не достали",
		"Мне та двоечка до лампочки",
		"Маша: Ну-ну...",
		"Тёмыч: Так вот, чем ты, говоришь, Ирку-копирку грохнула?",
		"Маша: Ну, камнем.",
		"Тёмыч: Непраааааавильный ответ",
		"В ходе расследования места преступления стало ясно, что тупые травмы жертве были нанесены этим кастетом",
		"Тёмыч: Как ты объяснишь это противоречие?",
		"Маша: Ааа!",
		"Тёмыч: (Тум турурум турурум турурурум рум рум турурум тум туууум туууум) B",
		"(А я нашел противоречие)",
		"Маша: А, стойте, совсем забыла W",
		"Ну да, я использовала кастет, действительно.",
		"Ошиблась, да, но теперь вы знаете",
		"Е. Анатольевна: Не долго песенка играла, а?",
		"Соня: ...",
		"Тёмыч: Да ё-маё, ну вы серьезно?",
		"Ну и что у тебя был за кастет?",
		"Давай, опиши его, только попробуй!",
		"Маша: Э-Эмм...",
		"Почему так враждебно?",
		"Тёмыч: Ты меня, по факту, кинула",
		"Развела",
		"Если я и должен быть с кем то дружелюбным и ласковым, то точно не с тобой",
		"Повторяю, опиши мне этот кастет. И не нужно уворачиваться от ответа, пожалуйста",
		"Это расценится как уворот от ответа и твоя легенда про то, что ты что-то натворила начнет разваливаться",
		"А ты наверняка не хочешь чтобы кто то считал тебя не виновной, ты ведь хочешь за граты",
		"Ну так давай, что это за кастет, где купила, и так далее.",
		"Маша: Э-Эмм, ну л-ладно",
		"Егорыч: Тьоха, это то 'излишнее давление', о котором я говорил вчера",
		"Спокойнее",
		"Тёмыч: Ты часто был на моем месте? Сомневаюсь.",
		"Так что не нужно меня тут успокаивать",
		"Тут либо так либо никак. Мне интересно, что было на самом деле и если мы этого не узнаем сейчас",
		"То в попытках разобраться я либо перестал бы спать",
		"Либо начал бы играть в майнкрафт опять",
		"Так, я там про тебя не забыл. Что у тебя там за кастет",
		"Маша: Ну он самый обычный, игрушечный.",
		"Там, че... Ну да",
		"Тёмыч: И откуда ты его достала?",
		"Маша: Купила в магазине, ну а откуда же еще...",
		"Тёмыч: Ваша Честь, это...",
		"SPLIT:Неверно:Верно:69:60",
		"Тёмыч: Имеет смысл.",
		"Е. Анатольевна: Ну, вроде бы.",
		"Тёмыч: Можем заканчивать допрос.",
		"Е. Анатольевна: ...",
		"...",
		"...",
		"И заседание тоже",
		"Тёмыч: Эм, в смысле?",
		"Стоп, что я только что сказал?",
		"ЭЙ ЭЙ ЭЙ",
		"Егорыч: Дотрынделся.",
		"Е. Анатольевна: Ну и ну... У тебя был такой потенциал...",
		"А ты так глупо... оступился",
		"И зачем мне давать тебе второй шанс...?",
		"Тёмыч: ЭЙ!",
		"Я исправлюсь, честное-причестное.",
		"Е. Анатольевна: Я очень, очень, вот, на это надеюсь.",
		"Тёмыч: (Ну ёмаё... че мне так скудно везет...) B",
		"Кхм-кхм, возвращаясь к теме... Это, ни что иное, как W",
		"Тёмыч: Дичь несусветная.",
		"Я напоминаю всем, что этот кастет напечатан на 3D принтере.",
		"И в каком игрушечном магазине продают печатки?",
		"Маша: А?!",
		"Ой",
		"Ну, да, совсем забыла. У меня же самой есть... 3D принтер",
		"Папа его себе купил... да...",
		"Тёмыч: И он его долго настраивал?",
		"Маша: Ну...",
		"...",
		"Тёмыч: (Она ломается сильнее чем длинные чипсы от 'розумного выбора' в коробках по 4 гривны) B",
		"Маша: Та н-нет, *он* над ним особо не парился... Вроде. W",
		"Тёмыч: Опять неверно. Ваша Честь, я хочу заметить, что дефект, пресущий этому кастету, а именно сдвиг по оси Z, возможен только если неопытный человек прямо изменит конфигурацию принтера",
		"(Ну а если это эндер, то это типичное свойство для любой напечатанной безделушки, однако об этом я никому говорить не стану) B",
		"Маша: ААА! W",
		"Да... Черт!",
		"Просто, это я, всё, я совершила это преступление. Что не ясно?",
		"Тёмыч: Ну вот, Ваша честь, что и требовалось доказать.",
		"Этот кастет напечатан, как позже заявила подсудимая, и Маха охотно пытается нас убедить, что у нее есть такой инструмент...",
		"Но действительно ли вы верите в то, что у Маши есть нужное оборудование",
		"После стольких противоречий в её показаниях?",
		"И верите ли вы в то, что она - преступница, если она сама не знает, что сделала?",
		"Соня: Аффект? Y",
		"Тёмыч: (Почему на её защите стоит прокурорша, а я её обвиняю? Когда мы успели махнуться ролями?) B",
		"Нет, Маха преднамеренно, как она сказала, 'забила стрелу' W",
		"Ей ли не отдавать отчет своим действиям?",
		"Соня: ...",
		"Е. Анатольевна: Но не понятно мне, если это самооговор, то зачем?",
		"Тёмыч: ... ",
		"(И это самый главный вопрос на повестке дня, я думаю...) B",
		"Е. Анатольевна: ...Пока что, я не могу дать никакого вердикта, у кого-нибудь еще есть свидетели или улики? W",
		"Соня: ...",
		"Е. Анатольевна: Вызывай на ковер.",
		"Соня: ...",
		"OUT res://scenes/case_2/trial_day1/trial_9.tscn",
		"",
	]
	Anims = [ # диалоги. 
		"",
		"character_temich paper START logic Тёмыч: Очень занимательно видеть то, как ты пытаешься себя выставить виновной в преступлении, которого ты не в состоянии была совершить POS def",
		"character_masha default REACT frustration Маша: Я виновна и доказывать обратное смысла нет. POS wit",
		"character_masha uh Отпустите меня уже... куда там нужно.",
		"character_temich dadada Тёмыч: Ну ты же даже не правду сказала о том, как ты совершала противоречие. А пытаешься себя выставить. POS def",
		"character_temich kekk Маха-два-маха--",
		"character_masha hey REACT damage Маша: Еще раз меня так назовешь и получишь двоечку. POS wit",
		"character_temich wonder Тёмыч: Ой, у меня в табеле так много этих двоечек, что я в эту поездку уехал только чтобы мама с папой меня тут не достали POS def",
		"Мне та двоечка до лампочки",
		"character_masha default Маша: Ну-ну... POS wit",
		"character_temich thonker Тёмыч: Так вот, чем ты, говоришь, Ирку-копирку грохнула? POS def",
		"character_masha brr Маша: Ну, камнем. POS wit",
		"character_temich kekk REACT surprise Тёмыч: Непраааааавильный ответ POS def",
		"character_temich paper В ходе расследования места преступления стало ясно, что тупые травмы жертве были нанесены этим кастетом",
		"character_temich objection_1 STOP Тёмыч: Как ты объяснишь это противоречие?",
		"character_masha what REACT damage Маша: Ааа! POS wit",
		"character_temich kekk START objection_theme Тёмыч: (Тум турурум турурум турурурум рум рум турурум тум туууум туууум) B POS def",
		"(А я нашел противоречие)",
		"character_masha hey REACT surprise Маша: А, стойте, совсем забыла W P wit",
		" Ну да, я использовала кастет, действительно.",
		"character_masha uh Ошиблась, да, но теперь вы знаете",
		"character_lentoln hmm STOP Е. Анатольевна: Не долго песенка играла, а? POS jud",
		"character_sonya death START suspense Соня: ... POS pro",
		"character_temich damn Тёмыч: Да ё-маё, ну вы серьезно? POS def",
		"character_temich wonder Ну и что у тебя был за кастет?",
		"character_temich rage Давай, опиши его, только попробуй!",
		"character_masha brr Маша: Э-Эмм... POS wit",
		"Почему так враждебно?",
		"character_temich rage Тёмыч: Ты меня, по факту, кинула POS def",
		"character_temich deskslam Развела",
		"character_temich dadada Если я и должен быть с кем то дружелюбным и ласковым, то точно не с тобой",
		"character_temich paper Повторяю, опиши мне этот кастет. И не нужно уворачиваться от ответа, пожалуйста",
		"character_temich kekk Это расценится как уворот от ответа и твоя легенда про то, что ты что-то натворила начнет разваливаться",
		"character_temich thonker А ты наверняка не хочешь чтобы кто то считал тебя не виновной, ты ведь хочешь за граты",
		"character_temich paper Ну так давай, что это за кастет, где купила, и так далее.",
		"character_masha uh Маша: Э-Эмм, ну л-ладно POS wit",
		"character_egorich suspects Егорыч: Тьоха, это то 'излишнее давление', о котором я говорил вчера POS hld",
		"character_egorich default Спокойнее",
		"character_egorich all_of_sudden Тёмыч: Ты часто был на моем месте? Сомневаюсь.",
		"character_egorich thinks Так что не нужно меня тут успокаивать",
		"character_egorich idk Тут либо так либо никак. Мне интересно, что было на самом деле и если мы этого не узнаем сейчас",
		"То в попытках разобраться я либо перестал бы спать",
		"Либо начал бы играть в майнкрафт опять",
		"character_temich dadada Так, я там про тебя не забыл. Что у тебя там за кастет POS def",
		"character_masha uh Маша: Ну он самый обычный, игрушечный. POS wit",
		"Там, че... Ну да",
		"character_temich kekk Тёмыч: И откуда ты его достала? POS def",
		"character_masha brr Маша: Купила в магазине, ну а откуда же еще... POS wit",
		"character_temich paper Тёмыч: Ваша Честь, это... POS def",
		"SPLIT:Неверно:Верно:68:60",
		"character_temich damn Тёмыч: Имеет смысл. POS def",
		"character_lentoln hmm Е. Анатольевна: Ну, вроде бы. POS jud",
		"character_temich wonder Тёмыч: Можем заканчивать допрос. POS def",
		"character_lentoln sigh Е. Анатольевна: ... POS jud",
		"...",
		"...",
		"character_lentoln rage И заседание тоже",
		"character_temich damn Тёмыч: Эм, в смысле? POS def",
		"character_temich comeon Стоп, что я только что сказал?",
		"character_temich rage ЭЙ ЭЙ ЭЙ",
		"character_egorich laugh Егорыч: Дотрынделся. POS hld",
		"character_lentoln hmm Е. Анатольевна: Ну и ну... У тебя был такой потенциал... POS jud",
		"character_lentoln kek А ты так глупо... оступился",
		"character_lentoln sigh И зачем мне давать тебе второй шанс...?",
		"character_temich damn Тёмыч: ЭЙ! POS def",
		"character_temich yee Я исправлюсь, честное-причестное.",
		"character_lentoln rage Е. Анатольевна: Я очень, очень, вот, на это надеюсь. POS jud",
		"character_temich comeon Тёмыч: (Ну ёмаё... че мне так скудно везет...) B POS def",
		"character_temich default Кхм-кхм, возвращаясь к теме... Это, ни что иное, как W",
		"character_temich rage Тёмыч: Дичь несусветная. POS def",
		"character_temich paper STOP Я напоминаю всем, что этот кастет напечатан на 3D принтере.",
		"character_temich objection_1 START pursuit И в каком игрушечном магазине продают печатки?",
		"character_masha what Маша: А?! POS wit",
		"character_masha brr Ой",
		"character_masha uh Ну, да, совсем забыла. У меня же самой есть... 3D принтер",
		"Папа его себе купил... да...",
		"character_temich dadada Тёмыч: И он его долго настраивал? POS def",
		"character_masha uh Маша: Ну... POS wit",
		"...",
		"character_temich picard Тёмыч: (Она ломается сильнее чем длинные чипсы от 'розумного выбора' в коробках по 4 гривны) B POS def",
		"character_masha brr Маша: Та н-нет, *он* над ним особо не парился... Вроде. W POS wit",
		"character_temich paper Тёмыч: Опять неверно. Ваша Честь, я хочу заметить, что дефект, пресущий этому кастету, а именно сдвиг по оси Z, возможен только если неопытный человек прямо изменит конфигурацию принтера POS def",
		"character_temich wonder (Ну а если это эндер, то это типичное свойство для любой напечатанной безделушки, однако об этом я никому говорить не стану) B",
		"character_masha what Маша: ААА! W POS wit",
		"character_masha hey Да... Черт!",
		"character_masha brr Просто, это я, всё, я совершила это преступление. Что не ясно?",
		"character_temich objection_1 Тёмыч: Ну вот, Ваша честь, что и требовалось доказать. POS def",
		"character_temich thonker тот кастет напечатан и владелец должен владеть 3D принтером... POS def",
		"character_temich wonder ...Если владелец искренне хочет раскаяться, да так, чтобы ему поверили...",
		"Но если Маха-два-размаха действительно говорит, как она совершала это преступление...",
		"Допустила бы она столько противоречий в своих показаниях?",
		"character_sonya death Соня: Аффект? Y POS pro",
		"character_temich picard Тёмыч: (Почему на её защите стоит прокурорша, а я её обвиняю? Когда мы успели махнуться ролями?) B POS def",
		"character_temich paper Нет, Маха преднамеренно, как она сказала, 'забила стрелу' W",
		"Ей ли не отдавать отчет своим действиям?",
		"character_sonya death STOP Соня: ... POS pro",
		"character_lentoln hmm REACT frustration Е. Анатольевна: Но не понятно мне, если это самооговор, то зачем? POS jud",
		"character_temich dadada Тёмыч: ... POS def",
		"character_temich wonder START logic (И это самый главный вопрос на повестке дня, я думаю...) B",
		"character_lentoln sigh Е. Анатольевна: ...Пока что, я не могу дать никакого вердикта, у кого-нибудь еще есть свидетели или улики? W POS jud",
		"character_sonya death Соня: ... POS pro",
		"character_lentoln default Е. Анатольевна: Вызывай на ковер. POS jud",
		"character_sonya death Соня: ... POS pro",
		"OUT ",
		"",
	]
	Music = [ # диалоги. 
		"",
		"START logic Тёмыч: Очень занимательно видеть то, как ты пытаешься себя выставить виновной в преступлении, которого ты не в состоянии была совершить",
		"REACT frustration Маша: Я виновна и доказывать обратное смысла нет.",
		"Отпустите меня уже... куда там нужно.",
		"Тёмыч: Ну ты же даже не правду сказала о том, как ты совершала противоречие. А пытаешься себя выставить.",
		"Маха-два-маха--",
		"REACT damage Маша: Еще раз меня так назовешь и получишь двоечку.",
		"Тёмыч: Ой, у меня в табеле так много этих двоечек, что я в эту поездку уехал только чтобы мама с папой меня тут не достали",
		"Мне та двоечка до лампочки",
		"Маша: Ну-ну...",
		"Тёмыч: Так вот, чем ты, говоришь, Ирку-копирку грохнула?",
		"Маша: Ну, камнем.",
		"REACT surprise Тёмыч: Непраааааавильный ответ",
		"STOP В ходе расследования места преступления стало ясно, что тупые травмы жертве были нанесены этим кастетом",
		"REACT intro_woosh Тёмыч: Как ты объяснишь это противоречие?",
		"REACT damage Маша: Ааа!",
		"START objection_theme Тёмыч: (Тум турурум турурум турурурум рум рум турурум тум туууум туууум) B",
		"(А я нашел противоречие)",
		"REACT surprise Маша: А, стойте, совсем забыла W",
		" Ну да, я использовала кастет, действительно.",
		"Ошиблась, да, но теперь вы знаете",
		"STOP Е. Анатольевна: Не долго песенка играла, а?",
		"START suspense Соня: ...",
		"Тёмыч: Да ё-маё, ну вы серьезно?",
		"Ну и что у тебя был за кастет?",
		"Давай, опиши его, только попробуй!",
		"Маша: Э-Эмм...",
		"Почему так враждебно?",
		"Тёмыч: Ты меня, по факту, кинула",
		"REACT slam Развела",
		"Если я и должен быть с кем то дружелюбным и ласковым, то точно не с тобой",
		"Повторяю, опиши мне этот кастет. И не нужно уворачиваться от ответа, пожалуйста",
		"Это расценится как уворот от ответа и твоя легенда про то, что ты что-то натворила начнет разваливаться",
		"А ты наверняка не хочешь чтобы кто то считал тебя не виновной, ты ведь хочешь за граты",
		"Ну так давай, что это за кастет, где купила, и так далее.",
		"Маша: Э-Эмм, ну л-ладно",
		"Егорыч: Тьоха, это то 'излишнее давление', о котором я говорил вчера",
		"Спокойнее",
		"Тёмыч: Ты часто был на моем месте? Сомневаюсь.",
		"Так что не нужно меня тут успокаивать",
		"Тут либо так либо никак. Мне интересно, что было на самом деле и если мы этого не узнаем сейчас",
		"То в попытках разобраться я либо перестал бы спать",
		"Либо начал бы играть в майнкрафт опять",
		"Так, я там про тебя не забыл. Что у тебя там за кастет",
		"Маша: Ну он самый обычный, игрушечный.",
		"Там, че... Ну да",
		"Тёмыч: И откуда ты его достала?",
		"Маша: Купила в магазине, ну а откуда же еще...",
		"Тёмыч: Ваша Честь, это...",
		"SPLIT:Неверно:Верно:68:60",
		"Тёмыч: Имеет смысл.",
		"Е. Анатольевна: Ну, вроде бы.",
		"Тёмыч: Можем заканчивать допрос.",
		"Е. Анатольевна: ...",
		"...",
		"...",
		"И заседание тоже",
		"Тёмыч: Эм, в смысле?",
		"Стоп, что я только что сказал?",
		"ЭЙ ЭЙ ЭЙ",
		"Егорыч: Дотрынделся.",
		"Е. Анатольевна: Ну и ну... У тебя был такой потенциал...",
		"А ты так глупо... оступился",
		"И зачем мне давать тебе второй шанс...?",
		"Тёмыч: ЭЙ!",
		"Я исправлюсь, честное-причестное.",
		"Е. Анатольевна: Я очень, очень, вот, на это надеюсь.",
		"Тёмыч: (Ну ёмаё... че мне так скудно везет...) B",
		"Кхм-кхм, возвращаясь к теме... Это, ни что иное, как W",
		"Тёмыч: Дичь несусветная.",
		"STOP Я напоминаю всем, что этот кастет напечатан на 3D принтере.",
		"START pursuit И в каком игрушечном магазине продают печатки?",
		"Маша: А?!",
		"Ой",
		"Ну, да, совсем забыла. У меня же самой есть... 3D принтер",
		"Папа его себе купил... да...",
		"Тёмыч: И он его долго настраивал?",
		"Маша: Ну...",
		"...",
		"Тёмыч: (Она ломается сильнее чем длинные чипсы от 'розумного выбора' в коробках по 4 гривны) B",
		"Маша: Та н-нет, *он* над ним особо не парился... Вроде. W",
		"Тёмыч: Опять неверно. Ваша Честь, я хочу заметить, что дефект, пресущий этому кастету, а именно сдвиг по оси Z, возможен только если неопытный человек прямо изменит конфигурацию принтера",
		"(Ну а если это эндер, то это типичное свойство для любой напечатанной безделушки, однако об этом я никому говорить не стану) B",
		"Маша: ААА! W",
		"Да... Черт!",
		"Просто, это я, всё, я совершила это преступление. Что не ясно?",
		"Тёмыч: Ну вот, Ваша честь, что и требовалось доказать.",
		"Этот кастет напечатан и владелец должен владеть 3D принтером...",
		"...Если владелец искренне хочет раскаяться, да так, чтобы ему поверили...",
		"Но если Маха-два-размаха действительно говорит, как она совершала это преступление...",
		"Допустила бы она столько противоречий в своих показаниях?",
		"Соня: Аффект? Y",
		"Тёмыч: (Почему на её защите стоит прокурорша, а я её обвиняю? Когда мы успели махнуться ролями?) B",
		"Нет, Маха преднамеренно, как она сказала, 'забила стрелу' W",
		"Ей ли не отдавать отчет своим действиям?",
		"STOP Соня: ...",
		"REACT frustration Е. Анатольевна: Но не понятно мне, если это самооговор, то зачем?",
		"Тёмыч: ... ",
		"START logic (И это самый главный вопрос на повестке дня, я думаю...) B",
		"Е. Анатольевна: ...Пока что, я не могу дать никакого вердикта, у кого-нибудь еще есть свидетели или улики? W",
		"Соня: ...",
		"Е. Анатольевна: Вызывай на ковер.",
		"STOP Соня: ...",
		"OUT ",
		"",
	]
	loc_file.load("C:/Games/ddkg2.save")
	loc_file.set_value("Locations","Last",filename)
	loc_file.save("C:/Games/ddkg2.save")
