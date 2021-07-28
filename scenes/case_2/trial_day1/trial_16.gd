extends Node2D
var Anims
var Dialogue
var Ev
var Music
var loc_file = ConfigFile.new()
var Cast
func _ready():
	Music = [
		"",
		"START logic character_temich wonder Тёмыч: Свидетель, я не стану ходить долго вокруг да около. POS def",
		"character_wit2 hmm Радомир: Я на это и не рассчитывал, в принципе. POS wit",
		"REACT slam character_temich deskslam Тёмыч: Ваша Честь! Свидетель говорит, что мимо проходящая компашка бухариков не обратила внимания на мордобой между жертвой и подозреваемой. POS def",
		"character_temich kekk Однако! Кто, если не кто-то из той ОПГ снял это видео? POS def",
		"character_lentoln default Е. Анатольевна: Протест принимается, свидетелю следует объяснить это POS jud",
		"REACT frustration character_wit2 surprise Радомир: Эмм... POS wit",
		"character_wit2 default ...Ну, на самом деле, я видел, как кто-то из тех людей все-таки сидит в телефоне...",
		"Но я не думал, что этот человек именно ведет съемку...",
		"REACT surprise character_temich yee Тёмыч: ...Идея. POS def",
		"REACT slam character_temich deskslam Ваша Честь, разрешите задать самый наводящий вопрос за всю историю нашей школьной юриспроденции",
		"character_temich kekk Ответ на который будет буквально взрывоопасным",
		"character_egorich suspects Егорыч: *The bomb has been planted* R POS hld",
		"character_temich wonder Тёмыч: Тувок... W POS def",
		"Кто был в среди этих людей?",
		"character_wit2 hmm Радомир: Эмм, ну... Я не знал никого из них. POS wit",
		"character_temich thonker Тёмыч: Эмм, немножечко отойду от темы... Но - по теме. POS def",
		"character_temich yee (Такую дичь сейчас нагородил я только что, оооооооооооооооой) B",
		"character_temich thonker Кхм, то есть, задам дополнительный вопрос W",
		"character_temich paper Ты знаешь Башима Дашкерина?",
		"character_wit2 surprise Радомир: Эм, да, знаю отлично. POS wit",
		"Этот... тип...",
		"У него отец - депутат,",
		"Или кто-то такой.",
		"REACT frustration character_wit2 damage Плюс, вы же помните тот инцидент? R",
		"REACT damage character_sonya damage Соня: ... POS pro",
		"REACT frustration character_temich damn Тёмыч: ... 'Тот' инцидент? POS def",
		"character_wit2 surprise Радомир: Да, 'тот' инцидент W POS wit",
		"character_lentoln hmm Е. Анатольевна: Конкретнее, свидетель. POS jud",
		"character_lentoln sigh Хотя, я думаю, знаю, куда это идет. POS jud",
		"character_lentoln rage По этому я немедленно прекращу эту линию допроса",
		"Защита, вы получили ответ. Продолжайте главную линию допроса.",
		"character_egorich suspects Егорыч: В смысле 'то' дело? POS hld",
		"Тёмыч: Я потом расскажу.",
		"character_sonya death (Соня выглядит убитой) B POS pro",
		"character_temich yee Ваша Честь, теперь, свяжите две линии допроса. W POS def",
		"character_temich paper Ответом на вопрос 'Ты знал кого либо из той группы, которая типа не обратила внимания на драку в сквере' стало 'Нет, ни разу'",
		"character_temich wonder Ответом на вопрос 'За Башню шаришь?' стало 'Да'",
		"character_temich kekk А Башим Дашкерин сказал, что он, вроде как, засвидетельствовал события, находясь среди тех самых людей.",
		"STOP Вывод?",
		"START omen character_temich deskslam Свидетель Башим Дашкерин *солгал в суде*! R", # omen
		"REACT damage character_lentoln rage Е. Анатольевна: ...Без сомнений, это именно так! W POS jud",
		"REACT frustration character_sonya death Соня: ... POS pro",
		"character_lentoln hmm Е. Анатольевна: Но зачем ему 'лгать'? POS jud",
		"character_lentoln case2diag3 Я имею ввиду, что он гуляет по восточной части места преступления, между сквером и парком", # диаграмма 3
		"character_lentoln case2diag4 Что здесь", # диаграмма 4
		"Какая разница?",
		"Тёмыч: ...Вы хотите узнать, почему?",
		"Давайте сначала кое-что уточним.",
		"Я крайне сомневаюсь, что он был либо тут, либо здесь.",
		"Е. Анатольевна: Как? В смысле?",
		"В таком случае, где был Башим Дашкерин?",
		"Тёмыч: Я отвечу, Ваша Честь...", # миниигра
		"Тёмыч: Здесь.",
		"character_sonya death Соня: ... POS pro",
		"Интересно. Y",
		"character_temich dadada Тёмыч: ...Что именно тебе интересно? W POS def",
		"character_sonya death Дело обещало стать интереснее. Y POS pro",
		"Но нет.",
		"character_temich rage Тёмыч: Эмм...? W POS def",
		"character_lentoln sigh Е. Анатольевна: ...Нет, это как-то не вяжется. POS jud",
		"Не верю.",
		"character_temich damn Тёмыч: ...Ну ё-маё! POS def",
		"Ладно, можно попробовать еще?",
		"character_lentoln kek Е. Анатольевна: Ну попробуй... POS jud",
		"",
		"JUMP 48",
		"character_temich objection_1 Тёмыч: Внимание, здесь! POS def", 
		"STOP character_lentoln wut Е. Анатольевна: Что?! POS jud", # STOP
		"character_sonya death Соня: ... POS pro",
		"Неверно. Y",
		"character_temich wonder Тёмыч: Почему же, позвольте спросить? W POS def",
		"character_sonya death Соня: Это - место преступления Y POS pro",
		"Делая такие заявления, это все равно, что прямо обвинить человека",
		"START pursuit_slow character_temich yee Тёмыч: Да. W POS def",
		"character_wit ignore Дашкерин: Мне надоело сидеть за прилавком. POS wit",
		"character_wit wtf Что это значит?",
		"Объясняйся сейчас же.",
		"character_temich picard Тёмыч: Эх, Ирод Окаянный... POS def",
		"character_temich paper Называю факты: во-первых, тебя не было в той абстрактной компашке, которая проходила по тропинке между парком и сквером",
		"character_temich thonker Потому что ты дал ошибочные показания, возможные только, если наблюдать за ситуацией с другой стороны",
		"character_temich kekk И потому что Радомир тебя не видел там, где ты нам говорил",
		"character_temich paper Во-вторых, ты дал нам понять, что то, что у Махи есть шансы на оправдательный приговор, шло бы против твоих планов.",
		"character_temich deskslam В-третьих, я еще раз сделаю акцент на том, что ты солгал нам по поводу того, где ты был во время совершения преступления",
		"character_temich kekk А почему? Если бы ты сказал, что ты был в окружении братанов... POS def",
		"... то ты бы таким образом заделал бы себе неплохое, кхм-кхм, *алиби*, кхм-кхм.",
		"character_wit wtf Дашкерин: Бред, я не хочу это слышать POS wit",
		"character_wit ignore Просто булшит",
		"STOP character_temich wonder Следовательно, свидетель, я вполне нормально POS def",
		"START pursuit character_temich deskslam Обвиняю именно Вас в совершении преступления, вменяемого Марии Фильмоновой",
		"REACT intro_woosh character_temich objection_1 Что Вы скажете в Ваше оправдание?",
		"character_wit wtf Дашкерин: ... Х*йня собачья, не хочу это слышать. POS wit",
		"character_wit default Я ухожу.",
		"character_temich rage Тёмыч: Не так быстро POS def",
		"character_wit HIDE Дашкерин: Покаааааааа, лузеры! POS wit",
		"character_lentoln rage Е. Анатольевна: Свидетель, вернитесь сейчас же! POS jud",
		"Вер, лови!",
		"character_lentoln wut Дашкерин: Руки прочь!",
		"STOP В. Юрьевна: Лен, ушел...",
		"REACT frustration character_lentoln sigh Е. Анатольевна: ...Ну, думаю, что нужно отложить текущее заседание на день",
		"character_lentoln hmm У нас завтра на 12:00 экскурсия по городу назначена, правда.",
		"По этому надо собраться как можно раньше.",
		"character_lentoln kek Боюсь что даже на 8:00 придётся",
		"character_temich deskslam Тёмыч: Черт! POS def",
		"character_temich picard АаааААААА",
		"character_temich deskslam Из-за этого, эмм, Ирода Окаянного, нам придется растягивать всю эту историю! POS def",
		"character_temich picard Казалось бы, зачем?",
		"character_lentoln hmm Е. Анатольевна: У меня есть план, как вынудить его прийти на заседание и сидеть до конца. POS jud",
		"Скажем так...",
		"START omen character_lentoln kek Занавески повесили.",
		"character_temich damn Тёмыч: О нет... POS def",
		"Это... крайне радикально, если честно",
		"STOP character_lentoln sigh Е. Анатольевна: Не радикальнее хлора. POS jud",
		"character_temich thonker Тёмыч: (М, шутки про химию...) B POS def",
		"character_temich kekk (Не то что мои заезженные приколы про цезий.)",
		"START trial character_lentoln default Е. Анатольевна: Перехожу к вердикту, всем внимание. W POS jud",
		"Так как остались открытыми важные вопросы, на которые прямо сейчас ответить невозможно,",
		"Слушание откладывается на завтра. Время проведения следующего заседания - 8 часов утра.",
		"STOP Все свободны.",
		"OUT ",
	]
	Anims = [
		"",
		"character_temich wonder Тёмыч: Свидетель, я не стану ходить долго вокруг да около. POS def",
		"character_wit2 hmm Радомир: Я на это и не рассчитывал, в принципе. POS wit",
		"character_temich deskslam Тёмыч: Ваша Честь! Свидетель говорит, что мимо проходящая компашка бухариков не обратила внимания на мордобой между жертвой и подозреваемой. POS def",
		"character_temich kekk Однако! Кто, если не кто-то из той ОПГ снял это видео? POS def",
		"character_lentoln default Е. Анатольевна: Протест принимается, свидетелю следует объяснить это POS jud",
		"character_wit2 surprise Радомир: Эмм... POS wit",
		"character_wit2 default ...Ну, на самом деле, я видел, как кто-то из тех людей все-таки сидит в телефоне...",
		"Но я не думал, что этот человек именно ведет съемку...",
		"character_temich yee Тёмыч: ...Идея. POS def",
		"character_temich deskslam Ваша Честь, разрешите задать самый наводящий вопрос за всю историю нашей школьной юриспроденции",
		"character_temich kekk Ответ на который будет буквально взрывоопасным",
		"character_egorich suspects Егорыч: *The bomb has been planted* R POS hld",
		"character_temich wonder Тёмыч: Тувок... W POS def",
		"Кто был в среди этих людей?",
		"character_wit2 hmm Радомир: Эмм, ну... Я не знал никого из них. POS wit",
		"character_temich thonker Тёмыч: Эмм, немножечко отойду от темы... Но - по теме. POS def",
		"character_temich yee (Такую дичь сейчас нагородил я только что, оооооооооооооооой) B",
		"character_temich thonker Кхм, то есть, задам дополнительный вопрос W",
		"character_temich paper Ты знаешь Башима Дашкерина?",
		"character_wit2 surprise Радомир: Эм, да, знаю отлично. POS wit",
		"Этот... тип...",
		"У него отец - депутат,",
		"Или кто-то такой.",
		"character_wit2 damage Плюс, вы же помните тот инцидент? R",
		"character_sonya damage Соня: ... POS pro",
		"character_temich damn Тёмыч: ... 'Тот' инцидент? POS def",
		"character_wit2 surprise Радомир: Да, 'тот' инцидент W POS wit",
		"character_lentoln hmm Е. Анатольевна: Конкретнее, свидетель. POS jud",
		"character_lentoln sigh Хотя, я думаю, знаю, куда это идет. POS jud",
		"character_lentoln rage По этому я немедленно прекращу эту линию допроса",
		"Защита, вы получили ответ. Продолжайте главную линию допроса.",
		"character_egorich suspects Егорыч: В смысле 'то' дело? POS hld",
		"Тёмыч: Я потом расскажу.",
		"character_sonya death (Соня выглядит убитой) B POS pro",
		"character_temich yee Ваша Честь, теперь, свяжите две линии допроса. W POS def",
		"character_temich paper Ответом на вопрос 'Ты знал кого либо из той группы, которая типа не обратила внимания на драку в сквере' стало 'Нет, ни разу'",
		"character_temich wonder Ответом на вопрос 'За Башню шаришь?' стало 'Да'",
		"character_temich kekk А Башим Дашкерин сказал, что он, вроде как, засвидетельствовал события, находясь среди тех самых людей.",
		"Вывод?",
		"character_temich deskslam Свидетель Башим Дашкерин *солгал в суде*! R", # omen
		"character_lentoln rage Е. Анатольевна: ...Без сомнений, это именно так! W POS jud",
		"character_sonya death Соня: ... POS pro",
		"character_lentoln hmm Е. Анатольевна: Но зачем ему 'лгать'? POS jud",
		"character_lentoln case2diag3 Я имею ввиду, что он гуляет по восточной части места преступления, между сквером и парком", # диаграмма 3
		"character_lentoln case2diag4 Что здесь", # диаграмма 4
		"Какая разница?",
		"Тёмыч: ...Вы хотите узнать, почему?",
		"Давайте сначала кое-что уточним.",
		"Я крайне сомневаюсь, что он был либо тут, либо здесь.",
		"Е. Анатольевна: Как? В смысле?",
		"В таком случае, где был Башим Дашкерин?",
		"Тёмыч: Я отвечу, Ваша Честь...", # миниигра
		"Тёмыч: Здесь.",
		"character_sonya death Соня: ... POS pro",
		"Интересно. Y",
		"character_temich dadada Тёмыч: ...Что именно тебе интересно? W POS def",
		"character_sonya death Дело обещало стать интереснее. Y POS pro",
		"Но нет.",
		"character_temich rage Тёмыч: Эмм...? W POS def",
		"character_lentoln sigh Е. Анатольевна: ...Нет, это как-то не вяжется. POS jud",
		"Не верю.",
		"character_temich damn Тёмыч: ...Ну ё-маё! POS def",
		"Ладно, можно попробовать еще?",
		"character_lentoln kek Е. Анатольевна: Ну попробуй... POS jud",
		"",
		"JUMP 48",
		"character_temich objection_1 Тёмыч: Внимание, здесь! POS def", 
		"character_lentoln wut Е. Анатольевна: Что?! POS jud", # STOP
		"character_sonya death Соня: ... POS pro",
		"Неверно. Y",
		"character_temich wonder Тёмыч: Почему же, позвольте спросить? W POS def",
		"character_sonya death Соня: Это - место преступления Y POS pro",
		"Делая такие заявления, это все равно, что прямо обвинить человека",
		"character_temich yee Тёмыч: Да. W POS def",
		"character_wit ignore Дашкерин: Мне надоело сидеть за прилавком. POS wit",
		"character_wit wtf Что это значит?",
		"Объясняйся сейчас же.",
		"character_temich picard Тёмыч: Эх, Ирод Окаянный... POS def",
		"character_temich paper Называю факты: во-первых, тебя не было в той абстрактной компашке, которая проходила по тропинке между парком и сквером",
		"character_temich thonker Потому что ты дал ошибочные показания, возможные только, если наблюдать за ситуацией с другой стороны",
		"character_temich kekk И потому что Радомир тебя не видел там, где ты нам говорил",
		"character_temich paper Во-вторых, ты дал нам понять, что то, что у Махи есть шансы на оправдательный приговор, шло бы против твоих планов.",
		"character_temich deskslam В-третьих, я еще раз сделаю акцент на том, что ты солгал нам по поводу того, где ты был во время совершения преступления",
		"character_temich kekk А почему? Если бы ты сказал, что ты был в окружении братанов... POS def",
		"... то ты бы таким образом заделал бы себе неплохое, кхм-кхм, *алиби*, кхм-кхм.",
		"character_wit wtf Дашкерин: Бред, я не хочу это слышать POS wit",
		"character_wit ignore Просто булшит",
		"character_temich wonder Следовательно, свидетель, я вполне нормально POS def",
		"character_temich deskslam Обвиняю именно Вас в совершении преступления, вменяемого Марии Фильмоновой",
		"character_temich objection_1 Что Вы скажете в Ваше оправдание?",
		"character_wit wtf Дашкерин: ... Х*йня собачья, не хочу это слышать. POS wit",
		"character_wit default Я ухожу.",
		"character_temich rage Тёмыч: Не так быстро POS def",
		"character_wit HIDE Дашкерин: Покаааааааа, лузеры! POS wit",
		"character_lentoln rage Е. Анатольевна: Свидетель, вернитесь сейчас же! POS jud",
		"Вер, лови!",
		"character_lentoln wut Дашкерин: Руки прочь!",
		"В. Юрьевна: Лен, ушел...",
		"character_lentoln sigh Е. Анатольевна: ...Ну, думаю, что нужно отложить текущее заседание на день",
		"character_lentoln hmm У нас завтра на 12:00 экскурсия по городу назначена, правда.",
		"По этому надо собраться как можно раньше.",
		"character_lentoln kek Боюсь что даже на 8:00 придётся",
		"character_temich deskslam Тёмыч: Черт! POS def",
		"character_temich picard АаааААААА",
		"character_temich deskslam Из-за этого, эмм, Ирода Окаянного, нам придется растягивать всю эту историю! POS def",
		"character_temich picard Казалось бы, зачем?",
		"character_lentoln hmm Е. Анатольевна: У меня есть план, как вынудить его прийти на заседание и сидеть до конца. POS jud",
		"Скажем так...",
		"character_lentoln kek Занавески повесили.",
		"character_temich damn Тёмыч: О нет... POS def",
		"Это... крайне радикально, если честно",
		"character_lentoln sigh Е. Анатольевна: Не радикальнее хлора. POS jud",
		"character_temich thonker Тёмыч: (М, шутки про химию...) B POS def",
		"character_temich kekk (Не то что мои заезженные приколы про цезий.)",
		"character_lentoln default Е. Анатольевна: Перехожу к вердикту, всем внимание. W POS jud",
		"Так как остались открытыми важные вопросы, на которые прямо сейчас ответить невозможно,",
		"Слушание откладывается на завтра. Время проведения следующего заседания - 8 часов утра.",
		"Все свободны.",
		"OUT ",
	]
	Dialogue = [
		"",
		"Тёмыч: Свидетель, я не стану ходить долго вокруг да около.",
		"Радомир: Я на это и не рассчитывал, в принципе.",
		"Тёмыч: Ваша Честь! Свидетель говорит, что мимо проходящая компашка бухариков не обратила внимания на мордобой между жертвой и подозреваемой.",
		"Однако! Кто, если не кто-то из той ОПГ снял это видео?",
		"Е. Анатольевна: Протест принимается, свидетелю следует объяснить это",
		"Радомир: Эмм...",
		"...Ну, на самом деле, я видел, как кто-то из тех людей все-таки сидит в телефоне...",
		"Но я не думал, что этот человек именно ведет съемку...",
		"Тёмыч: ...Идея.",
		"Ваша Честь, разрешите задать самый наводящий вопрос за всю историю нашей школьной юриспроденции",
		"Ответ на который будет буквально взрывоопасным",
		"Егорыч: *The bomb has been planted* R",
		"Тёмыч: Тувок... W",
		"Кто был в среди этих людей?",
		"Радомир: Эмм, ну... Я не знал никого из них.",
		"Тёмыч: Эмм, немножечко отойду от темы... Но - по теме.",
		"(Такую дичь сейчас нагородил я только что, оооооооооооооооой) B",
		"Кхм, то есть, задам дополнительный вопрос W",
		"Ты знаешь Башима Дашкерина?",
		"Радомир: Эм, да, знаю отлично.",
		"Этот... тип...",
		"У него отец - депутат,",
		"Или кто-то такой.",
		"Плюс, вы же помните тот инцидент? R",
		"Соня: ...",
		"Тёмыч: ... 'Тот' инцидент?",
		"Радомир: Да, 'тот' инцидент W",
		"Е. Анатольевна: Конкретнее, свидетель.",
		"Хотя, я думаю, знаю, куда это идет.",
		"По этому я немедленно прекращу эту линию допроса",
		"Защита, вы получили ответ. Продолжайте главную линию допроса.",
		"Егорыч: В смысле 'то' дело?",
		"Тёмыч: Я потом расскажу.",
		"(Соня выглядит убитой) B",
		"Ваша Честь, теперь, свяжите две линии допроса. W",
		"Ответом на вопрос 'Ты знал кого либо из той группы, которая типа не обратила внимания на драку в сквере' стало 'Нет, ни разу'",
		"Ответом на вопрос 'За Башню шаришь?' стало 'Да'",
		"А Башим Дашкерин сказал, что он, вроде как, засвидетельствовал события, находясь среди тех самых людей.",
		"Вывод?",
		"Свидетель Башим Дашкерин *солгал в суде*! R",
		"Е. Анатольевна: ...Без сомнений, это именно так! W",
		"Соня: ...",
		"Е. Анатольевна: Но зачем ему 'лгать'?",
		"Я имею ввиду, что он гуляет по восточной части места преступления, между сквером и парком", # диаграмма 3
		"Что здесь", # диаграмма 4
		"Какая разница?",
		"Тёмыч: ...Вы хотите узнать, почему?",
		"Давайте сначала кое-что уточним.",
		"Я крайне сомневаюсь, что он был либо тут, либо здесь.",
		"Е. Анатольевна: Как? В смысле?",
		"В таком случае, где был Башим Дашкерин?",
		"Тёмыч: Я отвечу, Ваша Честь...", # миниигра
		"Тёмыч: Здесь.",
		"Соня: ...",
		"Интересно. Y",
		"Тёмыч: ...Что именно тебе интересно? W",
		"Дело обещало стать интереснее. Y",
		"Но нет.",
		"Тёмыч: Эмм...? W",
		"Е. Анатольевна: ...Нет, это как-то не вяжется.",
		"Не верю.",
		"Тёмыч: ...Ну ё-маё!",
		"Ладно, можно попробовать еще?",
		"Е. Анатольевна: Ну попробуй...",
		"",
		"JUMP 48",
		"Тёмыч: Внимание, здесь!",
		"Е. Анатольевна: Что?!",
		"Соня: ...",
		"Неверно. Y",
		"Тёмыч: Почему же, позвольте спросить? W",
		"Соня: Это - место преступления Y",
		"Делая такие заявления, это все равно, что прямо обвинить человека",
		"Тёмыч: Да. W",
		"Дашкерин: Мне надоело сидеть за прилавком.",
		"Что это значит?",
		"Объясняйся сейчас же.",
		"Тёмыч: Эх, Ирод Окаянный...",
		"Называю факты: во-первых, тебя не было в той абстрактной компашке, которая проходила по тропинке между парком и сквером",
		"Потому что ты дал ошибочные показания, возможные только, если наблюдать за ситуацией с другой стороны",
		"И потому что Радомир тебя не видел там, где ты нам говорил",
		"Во-вторых, ты дал нам понять, что то, что у Махи есть шансы на оправдательный приговор, шло бы против твоих планов.",
		"В-третьих, я еще раз сделаю акцент на том, что ты солгал нам по поводу того, где ты был во время совершения преступления",
		"А почему? Если бы ты сказал, что ты был в окружении братанов...",
		"... то ты бы таким образом заделал бы себе неплохое, кхм-кхм, *алиби*, кхм-кхм.",
		"Дашкерин: Бред, я не хочу это слышать",
		"Просто булшит",
		"Тёмыч: Следовательно, свидетель, я вполне нормально",
		"Обвиняю именно Вас в совершении преступления, вменяемого Марии Фильмоновой",
		"Что Вы скажете в Ваше оправдание?",
		"Дашкерин: ... Х*йня собачья, не хочу это слышать.",
		"Я ухожу.",
		"Тёмыч: Не так быстро",
		"Дашкерин: Покаааааааа, лузеры!",
		"Е. Анатольевна: Свидетель, вернитесь сейчас же!",
		"Вер, лови!",
		"Дашкерин: Руки прочь!",
		"В. Юрьевна: Лен, ушел...",
		"Е. Анатольевна: ...Ну, думаю, что нужно отложить текущее заседание на день",
		"У нас завтра на 12:00 экскурсия по городу назначена, правда.",
		"По этому надо собраться как можно раньше.",
		"Боюсь что даже на 8:00 придётся",
		"Тёмыч: Черт!",
		"АаааААААА",
		"Из-за этого, эмм, Ирода Окаянного, нам придется растягивать всю эту историю!",
		"Казалось бы, зачем?",
		"Е. Анатольевна: У меня есть план, как вынудить его прийти на заседание и сидеть до конца.",
		"Скажем так...",
		"Занавески повесили.",
		"Тёмыч: О нет...",
		"Это... крайне радикально, если честно",
		"Е. Анатольевна: Не радикальнее хлора.",
		"Тёмыч: (М, шутки про химию...) B",
		"(Не то что мои заезженные приколы про цезий.)",
		"Е. Анатольевна: Перехожу к вердикту, всем внимание. W",
		"Так как остались открытыми важные вопросы, на которые прямо сейчас ответить невозможно,",
		"Слушание откладывается на завтра. Время проведения следующего заседания - 8 часов утра.",
		"Все свободны.",
		"OUT res://scenes/case_2/invest_day2/court_lobby_day2.tscn",
	]
	loc_file.load("C:/Games/ddkg2.save")
	loc_file.set_value("Locations","Last",filename)
	loc_file.save("C:/Games/ddkg2.save")


func _process(_delta):
	if $Trial.Cur == 52: # миниигра ли
		$characters_all/character_lentoln/sprite.animation = "case2diag1"
		$characters_all/character_lentoln/question_box.show()
		$crosshair.show()
	else:
		$characters_all/character_lentoln/question_box.hide()
		$crosshair.hide()


func _input(event):
	if event is InputEventMouseMotion:
		$crosshair.position = event.position
	if $Trial.Cur == 52 and Input.is_action_just_pressed("lmb_click"):
		print(event.position)
		if $characters_all/character_lentoln/correct_select_1.get_global_rect().has_point(event.position):
			$Trial.Cur = 67
		else:
			$Trial.Cur = 53
		
		
