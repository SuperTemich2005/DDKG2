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
	Dialogue = [ # диалоги. 
		"",
		"--- Что я видел --- R",
		"Дашкерин: Короче, иду я по парку с братанами G I7",
		"Неожиданно, я вижу, как эти две клуши дерутся, хах! G I32",
		"Я даже записал это на камеру G I49",
		"",
		"EJUMP 59",
		"Тёмыч: Че вы там творили, черти?",
		"Соня: ...",
		"Дашкерин: Ну, просто гуляли...",
		"Соня: Нет. Y",
		"Дашкерин: В смысле? W",
		"Соня: Запись Y",
		"Тёмыч: Хмм... W",
		"Кек",
		"Этот чел выбросил коробку от бубльгума?",
		"Дашкерин: Что? Что такое бубльгум?",
		"Тёмыч: Да вот, на 04:33, какой то чел, крайний справа, выбросил на траву пачку от сиг.",
		"Дашкерин: Ч-Что? Да к-как вы вообще заметили это?!",
		"Тёмыч: Но вы вряд ли бы стали курить, по этому это, скорее всего, стилизованные под сигареты жвачки 'Бубльгум'",
		"Дашкерин: А-Ах, да, точно, конечно, это именно жвачки.",
		"Тёмыч: Хотя, когда я спросил про бубльгум, ты резко замешкался.",
		"Как будто не знал, что такое бубльгум.",
		"Следовательно...",
		"Соня: Он просто замешкался. Y",
		"Не стал бы такой... мальчик... порить себе легкие?",
		"Дашкерин: Да, конечно, это именно жвачки. W",
		"Закрыли тему.",
		"Тёмыч: (Это был самый забавный случай допроса первого пункта показаний.) B",
		"(Жалко, что он не стал 'самым полезным' за все это время)",
		"",
		"JUMP 2",
		"Тёмыч: ВСЕМ ВНИМАНИЕ, БАШИМ НАЗВАЛ ДЕВОЧЕК КЛУШАМИ.",
		"Соня: ...",
		"Дашкерин: Эй, не надо всем это громко оглашать...",
		"Тёмыч: Соню боишься?",
		"Соня: ...",
		"Дашкерин: ... Брр!",
		"Тёмыч: Правильно...",
		"И как же они дрались?",
		"Дашкерин: Ну, я разглядел Ирку... Она отбивалась от кого-то, вроде от Маши.",
		"Тёмыч: Так, стойте, давайте проясним, господа,",
		"Ты точно видел Иру Жаркую, но не видел Маху-Росомаху?",
		"Соня: ...",
		"Дашкерин: Ну да, вроде так.",
		"Тёмыч: Ну и ну...",
		"OUT res://scenes/case_2/trial_day1/trial_12.tscn",
		"",
		"JUMP 3",
		"Тёмыч: М, а че за камера?",
		"Дашкерин: Это мобила. Айфон 12, самый новый...",
		"Тёмыч: Странно, ведь сейчас существует только одиннадцатый.",
		"12-й, следуя эплевской закономерности, должен появиться только в следующем году...",
		"Дашкерин: Ну, не знаю... Но, короче, да, вы поняли...",
		"А-А-А... Апчхи!",
		"Тёмыч: Будь здорова, собака.",
		"Дашкерин: Я не собака, смерт.",
		"",
		"JUMP 4",
		"Тёмыч: Не густо он показаний накидал...",
		"Егорыч: Ты слушал показания всяко короче.",
		"Чего стоил тот допрос попугая...",
		"Тёмыч: Попугай - это из AA1",
		"Но вот где-то два года назад я заявил протест на первом пункте показаний",
		"Когда там всего один пункт и был",
		"Да, один гений понял, что он может дать показания из одного единственного пункта показаний",
		"Но я все равно заявил протест",
		"Егорыч: Да, и ты проиграл это дело.",
		"Тёмыч: Егогорыч, ты это так сказал, как будто бы мы не доказали, что этот чел виновен.",
		"Егорыч: Два месяца спустя.",
		"Тёмыч: Лучше позже, чем никогда",
		"JUMP 2",
		"Тёмыч: Эта улика всяко весомее того что ты сказал, Башня",
		"Е. Анатольевна: Неужели тут вообще есть что-то, против чего можно протестовать?",
		"Соня: ...",
		"Е. Анатольевна: Ну, ты понял...",
		"Тёмыч: (Да ёптель-моптель, эти черти мне башню со свай сдвинут) B",
		"",
		"JUMP 2",
		"",
	]
	Music = [ # диалоги. 
		"",
		"REACT intro_woosh character_wit default --- Что я видел --- R POS wit",
		"START examination-moderato character_wit default Дашкерин: Короче, иду я по парку с братанами G I6",
		"character_wit zomg Неожиданно, я вижу, как эти две клуши дерутся, хах! G I31",
		"character_wit yee Я даже записал это на камеру G I48",
		"character_wit yee Я даже записал это на камеру G I48",
		"EJUMP N",
		"character_temich dadada Тёмыч: Че вы там творили, черти? POS def",
		"character_sonya death Соня: ... POS pro",
		"character_wit hmpf Дашкерин: Ну, просто гуляли... POS wit",
		"character_sonya death Соня: Нет. Y POS pro",
		"character_wit zomg Дашкерин: В смысле? W POS wit",
		"character_sonya phone Соня: Запись Y POS pro",
		"character_temich paper Тёмыч: Хмм... W POS def",
		"character_temich kekk ек",
		"character_temich dadada Этот чел выбросил коробку от бубльгума?",
		"character_wit zomg Дашкерин: Что? Что такое бубльгум? POS wit",
		"character_temich paper Тёмыч: Да вот, на 04:33, какой то чел, крайний справа, выбросил на траву пачку от сиг. POS def",
		"character_wit wtf Дашкерин: Ч-Что? Да к-как вы вообще заметили это?! POS wit",
		"character_temich comeon Тёмыч: Но вы вряд ли бы стали курить, по этому это, скорее всего, стилизованные под сигареты жвачки 'Бубльгум' POS def",
		"character_wit yee Дашкерин: А-Ах, да, точно, конечно, это именно жвачки. POS wit",
		"character_temich wonder Тёмыч: Хотя, когда я спросил про бубльгум, ты резко замешкался. POS def",
		"character_temich thonker Как будто не знал, что такое бубльгум. POS def",
		"character_temich kekk Следовательно...",
		"character_sonya order99 Соня: Он просто замешкался. Y POS pro",
		"Не стал бы такой... мальчик... порить себе легкие?",
		"character_wit uh Дашкерин: Да, конечно, это именно жвачки. W POS wit",
		"character_wit default Закрыли тему.",
		"character_temich thonker Тёмыч: (Это был самый забавный случай допроса первого пункта показаний.) B POS def",
		"character_temich comeon (Жалко, что он не стал 'самым полезным' за все это время)",
		"",
		"JUMP 2",
		"REACT slam character_temich deskslam Тёмыч: ВСЕМ ВНИМАНИЕ, БАШИМ НАЗВАЛ ДЕВОЧЕК КЛУШАМИ. POS def", # REACT slam
		"character_sonya death Соня: ... POS pro",
		"character_wit wtf Дашкерин: Эй, не надо всем это громко оглашать... POS wit",
		"character_temich dadada Тёмыч: Соню боишься? POS def",
		"character_sonya default Соня: ... POS pro",
		"character_wit uh Дашкерин: ... Брр! POS wit",
		"character_temich wonder Тёмыч: Правильно... POS def",
		"character_temich kekk И как же они дрались?",
		"character_wit default Дашкерин: Ну, я разглядел Ирку... Она отбивалась от кого-то, вроде от Маши. POS wit",
		"character_temich rage Тёмыч: Так, стойте, давайте проясним, господа, POS def",
		"character_temich paper Ты точно видел Иру Жаркую, но не видел Маху-Росомаху?",
		"character_sonya death Соня: ... POS pro",
		"character_wit hmpf Дашкерин: Ну да, вроде так. POS wit",
		"character_temich kekk Тёмыч: Ну и ну... POS def",
		"OUT res://scenes/case_2/trial_day1/trial_12.tscn",
		"",
		"JUMP 3",
		"character_temich dadada Тёмыч: М, а че за камера? POS def",
		"character_wit default Дашкерин: Это мобила. Айфон 12, самый новый... POS wit",
		"character_temich wonder Тёмыч: Странно, ведь сейчас существует только одиннадцатый. POS def",
		"character_temich paper 12-й, следуя эплевской закономерности, должен появиться только в следующем году... POS def",
		"character_wit uh Дашкерин: Ну, не знаю... Но, короче, да, вы поняли... POS wit",
		"character_wit wtf А-А-А... Апчхи!",
		"character_temich damn Тёмыч: Будь здорова, собака. POS def",
		"character_wit wtf Дашкерин: Я не собака, смерт. POS wit",
		"",
		"JUMP 4",
		"character_temich comeon Тёмыч: Не густо он показаний накидал... POS def",
		"character_egorich thinks Егорыч: Ты слушал показания всяко короче. POS hld",
		"character_egorich laugh Чего стоил тот допрос попугая...",
		"Тёмыч: Попугай - это из AA1",
		"Но вот где-то два года назад я заявил протест на первом пункте показаний",
		"Когда там всего один пункт и был",
		"Да, один гений понял, что он может дать показания из одного единственного пункта показаний",
		"Но я все равно заявил протест",
		"character_egorich suspects Егорыч: Да, и ты проиграл это дело.",
		"Тёмыч: Егогорыч, ты это так сказал, как будто бы мы не доказали, что этот чел виновен.",
		"Егорыч: Два месяца спустя.",
		"Тёмыч: Лучше позже, чем никогда",
		"JUMP 2",
		"REACT slam character_temich deskslam Тёмыч: Эта улика всяко весомее того что ты сказал, Башня POS def", # дескслам
		"character_lentoln hmm Е. Анатольевна: Неужели тут вообще есть что-то, против чего можно протестовать? POS jud",
		"character_sonya death Соня: ... POS pro",
		"character_lentoln kek Е. Анатольевна: Ну, ты понял... POS jud",
		"character_temich damn Тёмыч: (Да ёптель-моптель, эти черти мне башню со свай сдвинут) B POS def",
		"",
		"JUMP 2",
		"",
	]
	Anims = [ # диалоги. 
		"",
		"character_wit default --- Что я видел --- R POS wit",
		"character_wit default Дашкерин: Короче, иду я по парку с братанами G I6 POS wit",
		"character_wit zomg Неожиданно, я вижу, как эти две клуши дерутся, хах! G I31 POS wit",
		"character_wit yee Я даже записал это на камеру G I48 POS wit",
		"character_wit yee Я даже записал это на камеру G I48 POS wit",
		"EJUMP N",
		"character_temich dadada Тёмыч: Че вы там творили, черти? POS def",
		"character_sonya death Соня: ... POS pro",
		"character_wit hmpf Дашкерин: Ну, просто гуляли... POS wit",
		"character_sonya death Соня: Нет. Y POS pro",
		"character_wit zomg Дашкерин: В смысле? W POS wit",
		"character_sonya phone Соня: Запись Y POS pro",
		"character_temich paper Тёмыч: Хмм... W POS def",
		"character_temich kekk ек",
		"character_temich dadada Этот чел выбросил коробку от бубльгума?",
		"character_wit zomg Дашкерин: Что? Что такое бубльгум? POS wit",
		"character_temich paper Тёмыч: Да вот, на 04:33, какой то чел, крайний справа, выбросил на траву пачку от сиг. POS def",
		"character_wit wtf Дашкерин: Ч-Что? Да к-как вы вообще заметили это?! POS wit",
		"character_temich comeon Тёмыч: Но вы вряд ли бы стали курить, по этому это, скорее всего, стилизованные под сигареты жвачки 'Бубльгум' POS def",
		"character_wit yee Дашкерин: А-Ах, да, точно, конечно, это именно жвачки. POS wit",
		"character_temich wonder Тёмыч: Хотя, когда я спросил про бубльгум, ты резко замешкался. POS def",
		"character_temich thonker Как будто не знал, что такое бубльгум. POS def",
		"character_temich kekk Следовательно...",
		"character_sonya order99 Соня: Он просто замешкался. Y POS pro",
		"Не стал бы такой... мальчик... порить себе легкие?",
		"character_wit uh Дашкерин: Да, конечно, это именно жвачки. W POS wit",
		"character_wit default Закрыли тему.",
		"character_temich thonker Тёмыч: (Это был самый забавный случай допроса первого пункта показаний.) B POS def",
		"character_temich comeon (Жалко, что он не стал 'самым полезным' за все это время)",
		"",
		"JUMP 2",
		"character_temich deskslam Тёмыч: ВСЕМ ВНИМАНИЕ, БАШИМ НАЗВАЛ ДЕВОЧЕК КЛУШАМИ. POS def", # REACT slam
		"character_sonya death Соня: ... POS pro",
		"character_wit wtf Дашкерин: Эй, не надо всем это громко оглашать... POS wit",
		"character_temich dadada Тёмыч: Соню боишься? POS def",
		"character_sonya default Соня: ... POS pro",
		"character_wit uh Дашкерин: ... Брр! POS wit",
		"character_temich wonder Тёмыч: Правильно... POS def",
		"character_temich kekk И как же они дрались?",
		"character_wit default Дашкерин: Ну, я разглядел Ирку... Она отбивалась от кого-то, вроде от Маши. POS wit",
		"character_temich rage Тёмыч: Так, стойте, давайте проясним, господа, POS def",
		"character_temich paper Ты точно видел Иру Жаркую, но не видел Маху-Росомаху?",
		"character_sonya death Соня: ... POS pro",
		"character_wit hmpf Дашкерин: Ну да, вроде так. POS wit",
		"character_temich kekk Тёмыч: Ну и ну... POS def",
		"OUT res://scenes/case_2/trial_day1/trial_12.tscn",
		"",
		"JUMP 3",
		"character_temich dadada Тёмыч: М, а че за камера? POS def",
		"character_wit default Дашкерин: Это мобила. Айфон 12, самый новый... POS wit",
		"character_temich wonder Тёмыч: Странно, ведь сейчас существует только одиннадцатый. POS def",
		"character_temich paper 12-й, следуя эплевской закономерности, должен появиться только в следующем году... POS def",
		"character_wit uh Дашкерин: Ну, не знаю... Но, короче, да, вы поняли... POS wit",
		"character_wit wtf А-А-А... Апчхи!",
		"character_temich damn Тёмыч: Будь здорова, собака. POS def",
		"character_wit wtf Дашкерин: Я не собака, смерт. POS wit",
		"",
		"JUMP 4",
		"character_temich comeon Тёмыч: Не густо он показаний накидал... POS def",
		"character_egorich thinks Егорыч: Ты слушал показания всяко короче. POS hld",
		"character_egorich laugh Чего стоил тот допрос попугая...",
		"Тёмыч: Попугай - это из AA1",
		"Но вот где-то два года назад я заявил протест на первом пункте показаний",
		"Когда там всего один пункт и был",
		"Да, один гений понял, что он может дать показания из одного единственного пункта показаний",
		"Но я все равно заявил протест",
		"character_egorich suspects Егорыч: Да, и ты проиграл это дело.",
		"Тёмыч: Егогорыч, ты это так сказал, как будто бы мы не доказали, что этот чел виновен.",
		"Егорыч: Два месяца спустя.",
		"Тёмыч: Лучше позже, чем никогда",
		"JUMP 2",
		"character_temich deskslam Тёмыч: Эта улика всяко весомее того что ты сказал, Башня POS def", # дескслам
		"character_lentoln hmm Е. Анатольевна: Неужели тут вообще есть что-то, против чего можно протестовать? POS jud",
		"character_sonya death Соня: ... POS pro",
		"character_lentoln kek Е. Анатольевна: Ну, ты понял... POS jud",
		"character_temich damn Тёмыч: (Да ёптель-моптель, эти черти мне башню со свай сдвинут) B POS def",
		"",
		"JUMP 2",
		"",
	]
	CorrectShow = "knuckasdfasdfasdfsadfasdflebuster 5"
	WrongShow = 72
	Out = "res://scenes/case_2/trial_day1/trial_12.tscn"
	loc_file.load(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")
	loc_file.set_value("Locations","Last",filename)
	loc_file.save(OS.get_system_dir(2)+"/AZIE Games/ddkg2.save")


func _process(delta):
	pass
