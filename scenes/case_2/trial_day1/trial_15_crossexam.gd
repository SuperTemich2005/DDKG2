extends Node2D
var Anims
var Dialogue
var Ev
var Music
var loc_file = ConfigFile.new()
var Cast
var CorrectShow
var WrongShow
var Pressed
var Out
func _ready():
	Dialogue = [
		"",
		"--- Что я видел --- R",
		"Радомир: Я сидел в парке с другом. G I8",
		"Радомир: Мы там сидели и ничего не делали. G I24",
		"Радомир: Внезапно, я увидел, как на одну девочку зверски бьёт и режет другая G32",
		"Радомир: Страшное зрелище G I57",
		"Радомир: Мимо нас проходило несколько человек, но вряд ли они это видели. G I82",
		"EJUMP 91",
		"Тёмыч: Что вы там делали?",
		"Точнее, я знаю, что в следующем пункте показаний ты скажешь, что вы 'ничего не делали'",
		"И тем не менее, не стали бы вы туда приходить и просто сидеть",
		"Радомир: Ну, да, в принципе, 'ничего не делали' - громко сказано",
		"Просто сидели, разговаривали",
		"Фигней страдали",
		"Соня: Много узнал? Y",
		"Тёмыч: Достаточно. W",
		"(Нифига се её на речь прорвало...) B",
		"(Неужели я к себе располагаю людей так... 'эффективно'?)",
		"(Помогите Тьохе выбрать подходящее слово)",
		"SPLIT:Эффективно:Круто:20:20",
		"(...Какая разница, кстати?)",
		"Тёмыч: Ладно, свидетель, продолжайте.",
		"",
		"JUMP 2",
		"Тёмыч: Вот прям-таки 'ничего'?",
		"Радомир: Ну, опять таки, мы там просто сидели",
		"Разговаривали",
		"И так далее",
		"Тёмыч: Происходило ли что-нибудь необычное?",
		"Радомир: Ну, что касается этого...",
		"",
		"JUMP 3",
		"Тёмыч: Важно уточнить - кого ты тогда видел?",
		"Радомир: Ну, я видел лицо тёмненькой девочки вот этой...",
		"Тёмыч: Это - Мария Фильмонова...",
		"(...Или 'Марина'?) B",
		"(Жора, короче.) B",
		"Радомир: Разве?",
		"Тёмыч: А что-то не так?",
		"Радомир: Просто, если Мария Фильмонова, это подозреваемая",
		"И вот эта тёмненькая девочка",
		"То тогда какое-то оружие я видел у жертвы!",
		"Тёмыч: Да ну?",
		"Радомир: Именно, я считаю, что вооружена была именно жертва.",
		"Тёмыч: Ну, это противоречие.",
		"Обвинение считает, что ветка - оружие преступления именно подозреваемой.",
		"Радомир: Ну, не знаю...",
		"Говорю, как есть.",
		"Соня: Во время боя, жертва могла выхватить эту ветку. Y",
		"Кто знает, как она передвигалась.",
		"Тёмыч: Ну... W",
		"Вероятно, так могло быть.",
		"(Чем больше она говорит) B",
		"(Тем больше я хочу, чтобы она снова замолчала)",
		"(ГААААААААААНС)",
		"",
		"JUMP 4",
		"Тёмыч: Что произошло, можно уточнить?",
		"Радомир: Ну, они дрались...",
		"Тёмыч: Да, но как?",
		"Радомир: Ну, они там толкались",
		"Потом пинались",
		"Потом дрались",
		"Потом, одна девочка взяла ветку",
		"И заколола другую!",
		"Тёмыч: ...Нам известно, что в деле был замешан кастет.",
		"Если верить Соничу, то Маха раздолбила Иру именно кастетом.",
		"Радомир: Ну, не знаю, я подобного ничего не видел.",
		"Но я и не отрицаю, что в этом деле был замешан этот ваш кастет",
		"С моей позиции, обзор на место преступления был достаточно открытым",
		"Но, опять же, само место преступления от меня было далеко",
		"Так что такие детали у меня спрашивать... Ну, можно, конечно",
		"Но 100% на них положится? Я бы не советовал.",
		"Не хочу случайно что-то не так сказать",
		"Тёмыч: Ну, понимаю это некое 'волнение'...",
		"Однако, если бы я спросил что-то, касающееся твоего ближнего окружения на тот момент",
		"Был бы ты более уверенным?",
		"Радомир: Ну, все, что от меня до тропинки близжайшей, я видел отлично",
		"Вот тут уже я могу уверенно давать показания, отвечать на вопросы.",
		"Тёмыч: Приму во внимание.",
		"",
		"JUMP 5",
		"Тёмыч: Они не обратили на это внимания?",
		"Радомир: Даааа, там шло сколько-то человек, гуляли, курили",
		"Пили...",
		"Им было не до той драки, которую я с другом видел",
		"Тёмыч: Действительно...",
		"Каждый день бабы бьются.",
		"Радомир: Угу...",
		"",
		"JUMP 6",
		"Тёмыч: Хмм, если верить вулканцу,",
		"Девки дрались в сквере, который видно с парка",
		"Мимо проходили черти, к которым себя причисляет Башим Дашкерин",
		"И проигнорировали их.",
		"Егорыч: Ну, в принципе",
		"Я бы тоже, может быть, не обратил бы на это особого внимания",
		"Типа, разные обстоятельства бывают?",
		"Кто-то заинтересуется",
		"Кто-то не заметит",
		"Кто-то побежит их разнимать",
		"Тёмыч: Просто, одна улика противоречит показаниям этого свидетеля",
		"Одним своим присутствием",
		"Егорыч: Такое бывает?",
		"Тёмыч: Ну, помнишь, как один чел сказал, что смог открыть кабинет химии и спрятать туда насвай",
		"А я сказал 'Так камера такого не записывала!'",
		"Он ответил 'Неужели твоя камера записала, как я *не проникал* в кабинет химии?'",
		"Я сказал 'Так прикол в том, что она в принципе ничего подобного не записала. А если бы ты говорил правду, то камера была бы доказательством против тебя'",
		"Егорыч: Я не помню такого дела...",
		"Тёмыч: Ты во время суда был у стоматолога",
		"По этому ты туда и не попал.",
		"Егорыч: ...Это опять был кейс про самооговор?",
		"Тёмыч: Да, причем обвиненного подкупил...",
		"Кто-то знакомый, на самом деле.",
		"Я бы сказал точно, если бы это дело не прервалось обвинительным приговором",
		"...Не, я, собственно, потом доказал невиновность этого чела.",
		"Там вообще такая развязка прикольная была",
		"От СБУ потом неделю прятался",
		"Но я сделал это...",
		"Ну, короче говоря, да, надо сейчас понимать",
		"Что улики могут противоречить не только своей сущностью",
		"Но и фактом своего существования",
		"И я собираюсь этим 'пониманием' воспользоваться",
		"Егорыч: Ну, удачи тебе, Тьоха.",
		"",
		"JUMP 2",
		"Тёмыч: Эта улика противоречит показаниям свидетеля!",
		"Е. Анатольевна: ...Каждый раз, когда ты начинаешь протест со слов 'Эта улика противоречит показаниям свидетеля'",
		"Я спрашиваю 'Каким образом'.",
		"И ты, внезапно, запинаешься",
		"Тёмыч: ...",
		"...",
		"...",
		"(Не у одного меня есть третий глаз, оказывается?) B",
		"Е. Анатольевна: Ну так? W",
		"Тёмыч: ...",
		"Можно я пересдам?",
		"Е. Анатольевна: Золотое правило химии",
		"Двойку нельзя пересдать",
		"Тёмыч: (Ёмаё) B",
		"",
		"JUMP 2",
		
		"",
	]
	Anims = [
		"",
		"character_wit2 default --- Что я видел --- R POS wit",
		"START examination-allegro Радомир: Я сидел в парке с другом. W POS wit",
		"character_wit2 bored Мы там сидели и ничего не делали. POS wit",
		"character_wit2 surprise Внезапно, я увидел, как на одну девочку зверски бьёт и режет другая POS wit",
		"character_wit2 damage Страшное зрелище POS wit",
		"character_wit2 default Мимо нас проходило несколько человек, они тоже это видели, наверное POS wit",
		"EJUMP 91",
		"character_temich dadada Тёмыч: Что вы там делали? POS def",
		"character_temich kekk Точнее, я знаю, что в следующем пункте показаний ты скажешь, что вы 'ничего не делали' POS def",
		"character_temich wonder И тем не менее, не стали бы вы туда приходить и просто сидеть POS def",
		"character_wit2 bored Радомир: Ну, да, в принципе, 'ничего не делали' - громко сказано POS wit",
		"character_wit2 default Просто сидели, разговаривали POS wit",
		"Фигней страдали",
		"character_sonya order66 Соня: Много узнал? Y POS pro",
		"character_temich thonker Тёмыч: Достаточно. W POS def",
		"character_temich paper (Нифига се её на речь прорвало...) B",
		"(Неужели я к себе располагаю людей так... 'эффективно'?)",
		"(Помогите Тьохе выбрать подходящее слово)",
		"SPLIT:Эффективно:Круто:20:20",
		"character_temich deskslam (...Какая разница, кстати?)",
		"character_temich objection_1 Тёмыч: Ладно, свидетель, продолжайте.",
		"",
		"JUMP 2",
		"character_temich kekk Тёмыч: Вот прям-таки 'ничего'? POS def",
		"character_wit2 bored Радомир: Ну, опять таки, мы там просто сидели POS wit",
		"Разговаривали",
		"character_wit2 default И так далее",
		"character_temich paper Тёмыч: Происходило ли что-нибудь необычное? POS def",
		"character_wit2 default Радомир: Ну, что касается этого...",
		"",
		"JUMP 3",
		"character_temich yee Тёмыч: Важно уточнить - кого ты тогда видел? POS def",
		"character_wit2 bored Радомир: Ну, я видел лицо тёмненькой девочки вот этой... POS wit",
		"character_temich paper Тёмыч: Это - Мария Фильмонова... POS def",
		"character_temich kekk (...Или 'Марина'?) B",
		"character_temich rage (Жора, короче.) B",
		"character_wit2 surprise Радомир: Разве? POS wit",
		"character_temich thonker Тёмыч: А что-то не так? POS def",
		"character_wit2 bored Радомир: Просто, если Мария Фильмонова, это подозреваемая POS wit",
		"И вот эта тёмненькая девочка",
		"character_temich surprise То тогда какое-то оружие я видел у жертвы! POS wit",
		"character_temich damn Тёмыч: Да ну? POS def",
		"character_wit2 default Радомир: Именно, я считаю, что вооружена была именно жертва. POS wit",
		"character_temich wonder Тёмыч: Ну, это противоречие. POS def",
		"character_temich paper Обвинение считает, что ветка - оружие преступления именно подозреваемой.",
		"character_wit2 bored Радомир: Ну, не знаю... POS wit",
		"Говорю, как есть.",
		"character_sonya default Соня: Во время боя, жертва могла выхватить эту ветку. Y POS pro",
		"character_sonya death Кто знает, как она передвигалась. POS pro",
		"character_temich comeon Тёмыч: Ну... W POS def",
		"character_temich wonder Вероятно, так могло быть.",
		"character_temich damn (Чем больше она говорит) B",
		"(Тем больше я хочу, чтобы она снова замолчала)",
		"character_temich deskslam (ГААААААААААНС)",
		"",
		"JUMP 4",
		"character_temich thonker Тёмыч: Что произошло, можно уточнить? POS def",
		"character_wit2 thought Радомир: Ну, они дрались... POS wit",
		"character_temich dadada Тёмыч: Да, но как? POS def",
		"character_wit2 bored Радомир: Ну, они там толкались POS wit",
		"Потом пинались",
		"Потом дрались",
		"character_wit2 surprise Потом, одна девочка взяла ветку",
		"character_wit2 damage И заколола другую!",
		"character_temich paper Тёмыч: ...Нам известно, что в деле был замешан кастет. POS def",
		"Если верить Соничу, то Маха раздолбила Иру именно кастетом.",
		"character_wit2 bored Радомир: Ну, не знаю, я подобного ничего не видел. POS wit",
		"character_wit2 default Но я и не отрицаю, что в этом деле был замешан этот ваш кастет POS wit",
		"С моей позиции, обзор на место преступления был достаточно открытым",
		"Но, опять же, само место преступления от меня было далеко",
		"Так что такие детали у меня спрашивать... Ну, можно, конечно",
		"character_wit2 bored Радомир: Ну, не знаю, я подобного ничего не видел. POS wit",
		"Не хочу случайно что-то не так сказать",
		"character_temich wonder Тёмыч: Ну, понимаю это некое 'волнение'... POS def",
		"Однако, если бы я спросил что-то, касающееся твоего ближнего окружения на тот момент",
		"character_temich thonker Был бы ты более уверенным?",
		"character_wit2 yee1 Радомир: Ну, все, что от меня до тропинки близжайшей, я видел отлично POS wit",
		"Вот тут уже я могу уверенно давать показания, отвечать на вопросы.",
		"character_temich wonder Тёмыч: Приму во внимание. POS def",
		"",
		"JUMP 5",
		"character_temich paper Тёмыч: Они не обратили на это внимания? POS def",
		"character_wit2 default Радомир: Даааа, там шло сколько-то человек, гуляли, курили POS wit",
		"Пили...",
		"character_wit2 bored Им было не до той драки, которую я с другом видел",
		"character_temich kekk Тёмыч: Действительно... POS def",
		"character_temich thonker Каждый день бабы бьются. POS def",
		"character_wit2 bored Им было не до той драки, которую я с другом видел",
		"",
		"JUMP 6",
		"character_egorich thinks asdasdasd asdasdasd asdasdasd POS hld",
		"Девки дрались в сквере, который видно с парка",
		"Мимо проходили черти, к которым себя причисляет Башим Дашкерин",
		"И проигнорировали их.",
		"character_egorich yee asd",
		"Я бы тоже, может быть, не обратил бы на это особого внимания",
		"character_egorich thinks Типа, разные обстоятельства бывают?",
		"character_egorich thinks Кто-то заинтересуется",
		"Кто-то не заметит",
		"Кто-то побежит их разнимать",
		"Тёмыч: Просто, одна улика противоречит показаниям этого свидетеля",
		"Одним своим присутствием",
		"character_egorich all_of_sudden Егорыч: Такое бывает?",
		"Тёмыч: Ну, помнишь, как один чел сказал, что смог открыть кабинет химии и спрятать туда насвай",
		"А я сказал 'Так камера такого не записывала!'",
		"Он ответил 'Неужели твоя камера записала, как я *не проникал* в кабинет химии?'",
		"Я сказал 'Так прикол в том, что она в принципе ничего подобного не записала. А если бы ты говорил правду, то камера была бы доказательством против тебя'",
		"character_egorich suspects Егорыч: Я не помню такого дела...",
		"Тёмыч: Ты во время суда был у стоматолога",
		"По этому ты туда и не попал.",
		"Егорыч: ...Это опять был кейс про самооговор?",
		"Тёмыч: Да, причем обвиненного подкупил...",
		"Кто-то знакомый, на самом деле.",
		"Я бы сказал точно, если бы это дело не прервалось обвинительным приговором",
		"...Не, я, собственно, потом доказал невиновность этого чела.",
		"Там вообще такая развязка прикольная была",
		"От СБУ потом неделю прятался",
		"Но я сделал это...",
		"Ну, короче говоря, да, надо сейчас понимать",
		"Что улики могут противоречить не только своей сущностью",
		"Но и фактом своего существования",
		"И я собираюсь этим 'пониманием' воспользоваться",
		"Егорыч: Ну, удачи тебе, Тьоха.",
		"",
		"JUMP 2",
		"character_temich objection_1 Тёмыч: Эта улика противоречит показаниям свидетеля! POS def",
		"character_lentoln sigh Е. Анатольевна: ...Каждый раз, когда ты начинаешь протест со слов 'Эта улика противоречит показаниям свидетеля' POS jud",
		"Я спрашиваю 'Каким образом'.",
		"character_lentoln kek И ты, внезапно, запинаешься",
		"character_temich damn Тёмыч: ... POS def",
		"...",
		"...",
		"(Не у одного меня есть третий глаз, оказывается?) B",
		"character_lentoln hmm Е. Анатольевна: Ну так? W POS jud",
		"character_temich damn asd POS def",
		"character_temich yee Можно я пересдам? POS def",
		"character_lentoln hmm Е. Анатольевна: Золотое правило химии POS jud",
		"character_lentoln kek Е. Анатольевна: Золотое правило химии POS jud",
		"character_temich damn Тёмыч: (Ёмаё) B",
		"",
		"JUMP 2",
		"",
	]
	Music = [
		"",
		"character_wit2 default --- Что я видел --- R POS wit",
		"START examination-allegro Радомир: Я сидел в парке с другом. W POS wit",
		"character_wit2 bored Мы там сидели и ничего не делали. POS wit",
		"REACT damage character_wit2 surprise Внезапно, я увидел, как на одну девочку зверски бьёт и режет другая POS wit",
		"character_wit2 damage Страшное зрелище POS wit",
		"character_wit2 default Мимо нас проходило несколько человек, они тоже это видели, наверное POS wit",
		"EJUMP 91",
		"character_temich dadada Тёмыч: Что вы там делали? POS def",
		"character_temich kekk Точнее, я знаю, что в следующем пункте показаний ты скажешь, что вы 'ничего не делали' POS def",
		"character_temich wonder И тем не менее, не стали бы вы туда приходить и просто сидеть POS def",
		"character_wit2 bored Радомир: Ну, да, в принципе, 'ничего не делали' - громко сказано POS wit",
		"character_wit2 default Просто сидели, разговаривали POS wit",
		"Фигней страдали",
		"REACT surprise character_sonya order66 Соня: Много узнал? Y POS pro",
		"character_temich thonker Тёмыч: Достаточно. W POS def",
		"character_temich paper (Нифига се её на речь прорвало...) B",
		"(Неужели я к себе располагаю людей так... 'эффективно'?)",
		"(Помогите Тьохе выбрать подходящее слово)",
		"SPLIT:Эффективно:Круто:20:20",
		"character_temich deskslam (...Какая разница, кстати?)",
		"REACT intro_woosh character_temich objection_1 Тёмыч: Ладно, свидетель, продолжайте.",
		"",
		"JUMP 2",
		"character_temich kekk Тёмыч: Вот прям-таки 'ничего'? POS def",
		"character_wit2 bored Радомир: Ну, опять таки, мы там просто сидели POS wit",
		"Разговаривали",
		"character_wit2 default И так далее",
		"character_temich paper Тёмыч: Происходило ли что-нибудь необычное? POS def",
		"character_wit2 default Радомир: Ну, что касается этого...",
		"",
		"JUMP 3",
		"character_temich yee Тёмыч: Важно уточнить - кого ты тогда видел? POS def",
		"character_wit2 bored Радомир: Ну, я видел лицо тёмненькой девочки вот этой... POS wit",
		"character_temich paper Тёмыч: Это - Мария Фильмонова... POS def",
		"character_temich kekk (...Или 'Марина'?) B",
		"character_temich rage (Жора, короче.) B",
		"character_wit2 surprise Радомир: Разве? POS wit",
		"character_temich thonker Тёмыч: А что-то не так? POS def",
		"character_wit2 bored Радомир: Просто, если Мария Фильмонова, это подозреваемая POS wit",
		"И вот эта тёмненькая девочка",
		"character_temich surprise То тогда какое-то оружие я видел у жертвы! POS wit",
		"character_temich damn Тёмыч: Да ну? POS def",
		"character_wit2 default Радомир: Именно, я считаю, что вооружена была именно жертва. POS wit",
		"character_temich wonder Тёмыч: Ну, это противоречие. POS def",
		"character_temich paper Обвинение считает, что ветка - оружие преступления именно подозреваемой.",
		"character_wit2 bored Радомир: Ну, не знаю... POS wit",
		"Говорю, как есть.",
		"character_sonya default Соня: Во время боя, жертва могла выхватить эту ветку. Y POS pro",
		"character_sonya death Кто знает, как она передвигалась. POS pro",
		"character_temich comeon Тёмыч: Ну... W POS def",
		"character_temich wonder Вероятно, так могло быть.",
		"character_temich damn (Чем больше она говорит) B",
		"(Тем больше я хочу, чтобы она снова замолчала)",
		"REACT slam character_temich deskslam (ГААААААААААНС)",
		"",
		"JUMP 4",
		"character_temich thonker Тёмыч: Что произошло, можно уточнить? POS def",
		"character_wit2 thought Радомир: Ну, они дрались... POS wit",
		"character_temich dadada Тёмыч: Да, но как? POS def",
		"character_wit2 bored Радомир: Ну, они там толкались POS wit",
		"Потом пинались",
		"Потом дрались",
		"character_wit2 surprise Потом, одна девочка взяла ветку",
		"REACT damage character_wit2 damage И заколола другую!",
		"character_temich paper Тёмыч: ...Нам известно, что в деле был замешан кастет. POS def",
		"Если верить Соничу, то Маха раздолбила Иру именно кастетом.",
		"character_wit2 bored Радомир: Ну, не знаю, я подобного ничего не видел. POS wit",
		"character_wit2 default Но я и не отрицаю, что в этом деле был замешан этот ваш кастет POS wit",
		"С моей позиции, обзор на место преступления был достаточно открытым",
		"Но, опять же, само место преступления от меня было далеко",
		"Так что такие детали у меня спрашивать... Ну, можно, конечно",
		"character_wit2 bored Радомир: Ну, не знаю, я подобного ничего не видел. POS wit",
		"Не хочу случайно что-то не так сказать",
		"character_temich wonder Тёмыч: Ну, понимаю это некое 'волнение'... POS def",
		"Однако, если бы я спросил что-то, касающееся твоего ближнего окружения на тот момент",
		"character_temich thonker Был бы ты более уверенным?",
		"character_wit2 yee1 Радомир: Ну, все, что от меня до тропинки близжайшей, я видел отлично POS wit",
		"Вот тут уже я могу уверенно давать показания, отвечать на вопросы.",
		"character_temich wonder Тёмыч: Приму во внимание. POS def",
		"",
		"JUMP 5",
		"character_temich paper Тёмыч: Они не обратили на это внимания? POS def",
		"character_wit2 default Радомир: Даааа, там шло сколько-то человек, гуляли, курили POS wit",
		"Пили...",
		"character_wit2 bored Им было не до той драки, которую я с другом видел",
		"REACT surprise character_temich kekk Тёмыч: Действительно... POS def",
		"character_temich thonker Каждый день бабы бьются. POS def",
		"character_wit2 bored Им было не до той драки, которую я с другом видел",
		"",
		"JUMP 6",
		"character_egorich thinks asdasdasd asdasdasd asdasdasd POS hld",
		"Девки дрались в сквере, который видно с парка",
		"Мимо проходили черти, к которым себя причисляет Башим Дашкерин",
		"И проигнорировали их.",
		"character_egorich yee asd",
		"Я бы тоже, может быть, не обратил бы на это особого внимания",
		"character_egorich thinks Типа, разные обстоятельства бывают?",
		"character_egorich thinks Кто-то заинтересуется",
		"Кто-то не заметит",
		"Кто-то побежит их разнимать",
		"Тёмыч: Просто, одна улика противоречит показаниям этого свидетеля",
		"Одним своим присутствием",
		"REACT surprise character_egorich all_of_sudden Егорыч: Такое бывает?",
		"Тёмыч: Ну, помнишь, как один чел сказал, что смог открыть кабинет химии и спрятать туда насвай",
		"А я сказал 'Так камера такого не записывала!'",
		"Он ответил 'Неужели твоя камера записала, как я *не проникал* в кабинет химии?'",
		"Я сказал 'Так прикол в том, что она в принципе ничего подобного не записала. А если бы ты говорил правду, то камера была бы доказательством против тебя'",
		"character_egorich suspects Егорыч: Я не помню такого дела...",
		"Тёмыч: Ты во время суда был у стоматолога",
		"По этому ты туда и не попал.",
		"Егорыч: ...Это опять был кейс про самооговор?",
		"Тёмыч: Да, причем обвиненного подкупил...",
		"Кто-то знакомый, на самом деле.",
		"Я бы сказал точно, если бы это дело не прервалось обвинительным приговором",
		"...Не, я, собственно, потом доказал невиновность этого чела.",
		"Там вообще такая развязка прикольная была",
		"От СБУ потом неделю прятался",
		"Но я сделал это...",
		"Ну, короче говоря, да, надо сейчас понимать",
		"Что улики могут противоречить не только своей сущностью",
		"Но и фактом своего существования",
		"И я собираюсь этим 'пониманием' воспользоваться",
		"Егорыч: Ну, удачи тебе, Тьоха.",
		"",
		"JUMP 2",
		"REACT intro_woosh character_temich objection_1 Тёмыч: Эта улика противоречит показаниям свидетеля! POS def",
		"character_lentoln sigh Е. Анатольевна: ...Каждый раз, когда ты начинаешь протест со слов 'Эта улика противоречит показаниям свидетеля' POS jud",
		"Я спрашиваю 'Каким образом'.",
		"character_lentoln kek И ты, внезапно, запинаешься",
		"REACT damage character_temich damn Тёмыч: ... POS def",
		"...",
		"...",
		"(Не у одного меня есть третий глаз, оказывается?) B",
		"character_lentoln hmm Е. Анатольевна: Ну так? W POS jud",
		"character_temich damn asd POS def",
		"character_temich yee Можно я пересдам? POS def",
		"character_lentoln hmm Е. Анатольевна: Золотое правило химии POS jud",
		"character_lentoln kek Е. Анатольевна: Золотое правило химии POS jud",
		"character_temich damn Тёмыч: (Ёмаё) B",
		"",
		"JUMP 2",
		"",
	]
	CorrectShow = "footage 6"
	WrongShow = 272
	Out = "res://scenes/case_2/trial_day1/trial_16.tscn"
	loc_file.load("C:/Games/ddkg2.save")
	loc_file.set_value("Locations","Last",filename)
	loc_file.save("C:/Games/ddkg2.save")
