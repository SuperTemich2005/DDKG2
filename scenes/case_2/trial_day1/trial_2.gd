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
		"Егорыч: Тьоха, ты же знаешь, как *теперь* проводить перекрестные допросы?",
		"Тёмыч: Ну а что измениться могло за один день, Егогорыч?",
		"Егорыч: Ну, скажем так, вдруг ты не помнишь вчерашний день или свою практику два года назад?",
		"В конце концов, кто знает, а был ли ты морально и ментально вчера на кейсе...?",
		"Тёмыч: ...В смысле?",
		"Егорыч: Мы прекрасно знаем, насколько легко пропустить первый кейс.",
		"Так что я переспрошу: может, я всё-таки проведу некий туториал и сейчас?",
		"Тёмыч: ...",
		"(О чем он говорит?) B",
		"(Как я мог пропустить *первое дело*?)",
		"(И тем не менее, я должен дать ему какой-то ответ, иначе хрен он от меня отстанет.)",
		"(Какой ответ я дам ему?)",
		"SPLIT Да Нет 14 35",
		"Тёмыч: (В принципе, почему бы и нет.)",
		"Егорыч: Короче, слушай: W",
		"Сейчас, Аполлонов будет давать показания.",
		"Когда он закончит свой рассказ, начнется перекрестный допрос.",
		"Во время перекрестного допроса, Палтос будет повторять свои реплики до тех пор, пока не произойдет что-то ужасное",
		"Ты сможешь либо *допросить* его, либо показать улику, которая противоречит его показанию",
		"Тёмыч: (Я прекрасно понимаю, о чем он говорит. И всё же, надо дать какой-нибудь риторический ответ, вроде 'угу' или 'да-да-да'...) B",
		"Можешь привести пример? W",
		"Егорыч: Палтос может сказать, типа, 'Сегодня днем я ел блины с мясом'",
		"Ты можешь допросить его по поводу этой реплики, мол, 'Стойте! А вы уверены, что это были блины?'",
		"'А что за мясо было в этих блинах? Баранина? Свинина?'",
		"Ну и так далее.",
		"Потом, он скажет 'Фарш состоял из смеси баранины и свинины' и ты увидишь в *записях суда* рецепт блинов, спиз-- кхм, позаимствованный у шефа,",
		"В котором будет написано: 'Рецепт блинов: кошатина, собатина'. Эта улика *противоречит* показаниям Палтоса, по этому ты *предоставишь* эту улику, мол, 'Протестую! Мне достоверно известно, что свидетель лжет насчет состава блинов!'",
		"Тёмыч: (...Бедные кошечки-собачки.) B",
		"(Интересно, как там поживают Макс с Милкой...?)",
		"Егорыч: Но если ты предоставишь не ту улику, которую ты должен, то Елена Анатольевна обидится. W",
		"А когда она обижается, тебе становится плохо.",
		"Тёмыч: Да, мне ли не знать...",
		"",
		"JUMP 36",
		"Тёмыч: (Та нет, не надо вроде...)",
		"Егорыч: Как бы то ни было, вперед! Разбирайся с этим чертом. W",
		"Тёмыч: С удовольствием...",
		"OUT res://scenes/case_2/trial_day1/trial_3_testimony.tscn",
		"",
	]
	Music = [
		"",
		"START logic Егорыч: Тьоха, ты же знаешь, как *теперь* проводить перекрестные допросы?",
		"Тёмыч: Ну а что измениться могло за один день, Егогорыч?",
		"Егорыч: Ну, скажем так, вдруг ты не помнишь вчерашний день или свою практику два года назад?",
		"В конце концов, кто знает, а был ли ты морально и ментально вчера на кейсе...?",
		"Тёмыч: ...В смысле?",
		"Егорыч: Мы прекрасно знаем, насколько легко пропустить первый кейс.",
		"Так что я переспрошу: может, я всё-таки проведу некий туториал и сейчас?",
		"Тёмыч: ...",
		"(О чем он говорит?) B",
		"(Как я мог пропустить *первое дело*?)",
		"(И тем не менее, я должен дать ему какой-то ответ, иначе хрен он от меня отстанет.)",
		"(Какой ответ я дам ему?)",
		"SPLIT Да Нет 14 35",
		"Тёмыч: (В принципе, почему бы и нет.)",
		"Егорыч: Короче, слушай: W",
		"Сейчас, Аполлонов будет давать показания.",
		"Когда он закончит свой рассказ, начнется перекрестный допрос.",
		"Во время перекрестного допроса, Палтос будет повторять свои реплики до тех пор, пока не произойдет что-то ужасное",
		"Ты сможешь либо *допросить* его, либо показать улику, которая противоречит его показанию",
		"Тёмыч: (Я прекрасно понимаю, о чем он говорит. И всё же, надо дать какой-нибудь риторический ответ, вроде 'угу' или 'да-да-да'...) B",
		"Можешь привести пример? W",
		"Егорыч: Палтос может сказать, типа, 'Сегодня днем я ел блины с мясом'",
		"Ты можешь допросить его по поводу этой реплики, мол, 'Стойте! А вы уверены, что это были блины?'",
		"'А что за мясо было в этих блинах? Баранина? Свинина?'",
		"Ну и так далее.",
		"Потом, он скажет 'Фарш состоял из смеси баранины и свинины' и ты увидишь в *записях суда* рецепт блинов, спиз-- кхм, позаимствованный у шефа,",
		"В котором будет написано: 'Рецепт блинов: кошатина, собатина'. Эта улика *противоречит* показаниям Палтоса, по этому ты *предоставишь* эту улику, мол, 'Протестую! Мне достоверно известно, что свидетель лжет насчет состава блинов!'",
		"Тёмыч: (...Бедные кошечки-собачки.) B",
		"(Интересно, как там поживают Макс с Милкой...?)",
		"Егорыч: Но если ты предоставишь не ту улику, которую ты должен, то Елена Анатольевна обидится. W",
		"А когда она обижается, тебе становится плохо.",
		"Тёмыч: Да, мне ли не знать...",
		"",
		"JUMP 36",
		"Тёмыч: (Та нет, не надо вроде...)",
		"STOP Егорыч: Как бы то ни было, вперед! Разбирайся с этим чертом. W",
		"REACT slam Тёмыч: С удовольствием...",
		"OUT ",
		"",
	]
	Anims = [ # массив, в котором 1 слово это перс, а 2 - его анимка
		"",
		"character_egorich suspects Егорыч: Тьоха, ты же знаешь, как *теперь* проводить перекрестные допросы? POS hld",
		"character_temich kekk ч: Ну а что измениться могло за один день, Егогорыч? POS def",
		"character_egorich thinks Егорыч: Ну, скажем так, вдруг ты не помнишь вчерашний день или свою практику два года назад? POS hld",
		"В конце концов, кто знает, а был ли ты морально и ментально вчера на кейсе...?",
		"character_temich comeon Тёмыч: ...В смысле? POS def",
		"character_egorich default Егорыч: Мы прекрасно знаем, насколько легко пропустить первый кейс. POS hld",
		"Так что я переспрошу: может, я всё-таки проведу некий туториал и сейчас?",
		"character_temich default Тёмыч: ... POS def",
		"character_temich thonker (О чем он говорит?) B",
		"(Как я мог пропустить *первое дело*?)",
		"(И тем не менее, я должен дать ему какой-то ответ, иначе хрен он от меня отстанет.)",
		"(Какой ответ я дам ему?)",
		"SPLIT Да Нет 14 35",
		"Тёмыч: (В принципе, почему бы и нет.)",
		"character_egorich default Егорыч: Короче, слушай: W POS hld",
		"character_egorich thinks Сейчас, Аполлонов будет давать показания.",
		"character_wit hmm Когда он закончит свой рассказ, начнется перекрестный допрос. POS wit",
		"character_wit hmpf Во время перекрестного допроса, Палтос будет повторять свои реплики до тех пор, пока не произойдет что-то ужасное",
		"character_egorich suspects Ты сможешь либо *допросить* его, либо показать улику, которая противоречит его показанию POS hld",
		"Тёмыч: (Я прекрасно понимаю, о чем он говорит. И всё же, надо дать какой-нибудь риторический ответ, вроде 'угу' или 'да-да-да'...) B",
		"Можешь привести пример? W",
		"character_egorich thinks Егорыч: Палтос может сказать, типа, 'Сегодня днем я ел блины с мясом' POS hld",
		"character_egorich yee Ты можешь допросить его по поводу этой реплики, мол, 'Стойте! А вы уверены, что это были блины?'",
		"character_egorich suspects 'А что за мясо было в этих блинах? Баранина? Свинина?'",
		"character_egorich default Ну и так далее.",
		"character_egorich thinks Потом, он скажет 'Фарш состоял из смеси баранины и свинины' и ты увидишь в *записях суда* рецепт блинов, спиз-- кхм, позаимствованный у шефа,",
		"В котором будет написано: 'Рецепт блинов: кошатина, собатина'. Эта улика *противоречит* показаниям Палтоса, по этому ты *предоставишь* эту улику, мол, 'Протестую! Мне достоверно известно, что свидетель лжет насчет состава блинов!'",
		"character_temich comeon Тёмыч: (...Бедные кошечки-собачки.) B POS def",
		"character_temich thonker (Интересно, как там поживают Макс с Милкой...?)",
		"character_egorich rage Егорыч: Но если ты предоставишь не ту улику, которую ты должен, то Елена Анатольевна обидится. W POS hld",
		"character_egorich idk А когда она обижается, тебе становится плохо.",
		"character_temich comeon Тёмыч: Да, мне ли не знать... POS def",
		"",
		"JUMP 36",
		"character_temich no Тёмыч: (Та нет, не надо вроде...) POS def",
		"character_egorich yee Егорыч: Как бы то ни было, вперед! Разбирайся с этим чертом. W POS hld",
		"character_temich deskslam Тёмыч: С удовольствием... POS def",
		"OUT ",
		"",
	]
	Ev = [
		"",
		"Егорыч: Тьоха, ты же знаешь, как *теперь* проводить перекрестные допросы?",
		"Тёмыч: Ну а что измениться могло за один день, Егогорыч?",
		"Егорыч: Ну, скажем так, вдруг ты не помнишь вчерашний день или свою практику два года назад?",
		"В конце концов, кто знает, а был ли ты морально и ментально вчера на кейсе...?",
		"Тёмыч: ...В смысле?",
		"Егорыч: Мы прекрасно знаем, насколько легко пропустить первый кейс.",
		"Так что я переспрошу: может, я всё-таки проведу некий туториал и сейчас?",
		"Тёмыч: ...",
		"(О чем он говорит?) B",
		"(Как я мог пропустить *первое дело*?)",
		"(И тем не менее, я должен дать ему какой-то ответ, иначе хрен он от меня отстанет.)",
		"(Какой ответ я дам ему?)",
		"SPLIT Да Нет 14 35",
		"Тёмыч: (В принципе, почему бы и нет.)",
		"Егорыч: Короче, слушай: W",
		"Сейчас, Аполлонов будет давать показания.",
		"Когда он закончит свой рассказ, начнется перекрестный допрос.",
		"Во время перекрестного допроса, Палтос будет повторять свои реплики до тех пор, пока не произойдет что-то ужасное",
		"Ты сможешь либо *допросить* его, либо показать улику, которая противоречит его показанию",
		"Тёмыч: (Я прекрасно понимаю, о чем он говорит. И всё же, надо дать какой-нибудь риторический ответ, вроде 'угу' или 'да-да-да'...) B",
		"Можешь привести пример? W",
		"Егорыч: Палтос может сказать, типа, 'Сегодня днем я ел блины с мясом'",
		"Ты можешь допросить его по поводу этой реплики, мол, 'Стойте! А вы уверены, что это были блины?'",
		"'А что за мясо было в этих блинах? Баранина? Свинина?'",
		"Ну и так далее.",
		"Потом, он скажет 'Фарш состоял из смеси баранины и свинины' и ты увидишь в *записях суда* рецепт блинов, спиз-- кхм, позаимствованный у шефа,",
		"В котором будет написано: 'Рецепт блинов: кошатина, собатина'. Эта улика *противоречит* показаниям Палтоса, по этому ты *предоставишь* эту улику, мол, 'Протестую! Мне достоверно известно, что свидетель лжет насчет состава блинов!'",
		"Тёмыч: (...Бедные кошечки-собачки.) B",
		"(Интересно, как там поживают Макс с Милкой...?)",
		"Егорыч: Но если ты предоставишь не ту улику, которую ты должен, то Елена Анатольевна обидится. W",
		"А когда она обижается, тебе становится плохо.",
		"Тёмыч: Да, мне ли не знать...",
		"",
		"JUMP 36",
		"Тёмыч: (Та нет, не надо вроде...)",
		"Егорыч: Как бы то ни было, вперед! Разбирайся с этим чертом. W",
		"Тёмыч: С удовольствием...",
		"OUT ",
		"",
	]
	loc_file.load("C:/Games/ddkg2.save")
	loc_file.set_value("Locations","Last",filename)
	loc_file.save("C:/Games/ddkg2.save")
