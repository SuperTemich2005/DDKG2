extends Node2D
var Anims
var Dialogue
var Ev
var Music
var loc_file = ConfigFile.new()
var Cast
func _ready():
	Ev = [ # диалоги. 
		"",
		"--- Что я видел --- R",
		"Дашкерин: Короче, иду я по парку с братанами W",
		"Неожиданно, я вижу, как эти две клуши дерутся, хах!",
		"Я даже записал это на камеру",
		"...",
		"Тёмыч: Кхххххх",
		"Мааахааа, ты слышала? Он назвал тебя клушей!",
		"Дашкерин: Э, ты че крысишь",
		"Тёмыч: Та не ссы, квакуха, её здесь нет... сейчас.",
		"Дашкерин: Ты это, не пугай меня.",
		"Тёмыч: Хорошо, не буду.",
		"Егорыч, кстати, ты же щас стрим пишешь? Маха его видит, как думаешь?",
		"Дашкерин: ЧТО?! Какой стрим?!",
		"Бл*ть, если она увидит, она меня порвет не смотря ни на что!",
		"Тёмыч: Эххехехехехехехеххехехехехехехех",
		"Развели еврея",
		"Дашкерин: Это опять прикол был? Ты начинаешь мне надоедать...",
		"Егорыч: А, что, какой стрим?",
		"Ты о чем?",
		"Тёмыч: Забей, Ирод Окаянный.",
		"Так, возвращаясь к этому, как его там...",
		"...А, к показаниям, точно.",
		"Я требую подробностей.",
		"Что за запись?",
		"Дашкерин: Да, я выложил запись в инсту еще, вот ссылка.",
		"Записывайте",
		"7/footage/Запись мордобоя. На ней видно, как две фигуры дерутся друг с другом. Видно лицо только Маши Фильмоновой. По всей видимости, запись шла со стороны парка./1",
		"Тёмыч: (Как бы опечатку не допустить здесь...) B",
		"(Это как-то знакомо...)",
		"Итак... W",
		"~~~ Запись мордобоя добавлена в записи суда",
		"Соня: Стоял в стороне? Y",
		"Дашкерин: А? Она че-то сказала? W",
		"Тёмыч: Да, она уточняет, неужели ты просто стоял в стороне и наблюдал, как девки бьются?",
		"Дашкерин: Ну а че я должен был делать?",
		"Тёмыч: Действительно, на самом деле, тут мало что мог сделать человек",
		"Если б Башня вмешалась, девки б его зашухерили",
		"Дашкерин: Во-первых, я не башня. Во-вторых, меня так просто не запугать",
		"Тёмыч: (Зашухерить, это 'прогнать', но ладно.) B",
		"Ну короче да, так что тут его угнетать за то, что он 'не вмешался'... W",
		"Если бы я петушился с Егогорычем, а ты бы проходила мимо",
		"Ты что, попыталась бы 'вмешаться'?",
		"Соня: ...",
		"Тёмыч: О чем я и говорю.",
		"Соня: Они - пара. Y",
		"Тёмыч: Стоп, что? W",
		"Соня: Он её парень. Y",
		"Тёмыч: ... W",
		"Забираю свои слова обратно.",
		"Осуждаю, Чёрт Позорный...",
		"Дашкерин: ... В любом случае.",
		"OUT",
		"",
	]
	Dialogue = [ # диалоги. 
		"",
		"--- Что я видел --- R",
		"Дашкерин: Короче, иду я по парку с братанами W",
		"Неожиданно, я вижу, как эти две клуши дерутся, хах!",
		"Я даже записал это на камеру",
		"...",
		"Тёмыч: Кхххххх",
		"Мааахааа, ты слышала? Он назвал тебя клушей!",
		"Дашкерин: Э, ты че крысишь",
		"Тёмыч: Та не ссы, квакуха, её здесь нет... сейчас.",
		"Дашкерин: Ты это, не пугай меня.",
		"Тёмыч: Хорошо, не буду.",
		"Егорыч, кстати, ты же щас стрим пишешь? Маха его видит, как думаешь?",
		"Дашкерин: ЧТО?! Какой стрим?!",
		"Бл*ть, если она увидит, она меня порвет не смотря ни на что!",
		"Тёмыч: Эххехехехехехехеххехехехехехехех",
		"Развели еврея",
		"Дашкерин: Это опять прикол был? Ты начинаешь мне надоедать...",
		"Егорыч: А, что, какой стрим?",
		"Ты о чем?",
		"Тёмыч: Забей, Ирод Окаянный.",
		"Так, возвращаясь к этому, как его там...",
		"...А, к показаниям, точно.",
		"Я требую подробностей.",
		"Что за запись?",
		"Дашкерин: Да, я выложил запись в инсту еще, вот ссылка.",
		"Записывайте",
		"https://www.youtube.com/watch?v=dQw4w9WgXcQ",
		"Тёмыч: (Как бы опечатку не допустить здесь...) B",
		"(Это как-то знакомо...)",
		"Итак... W",
		"~~~ Запись мордобоя добавлена в записи суда",
		"Соня: Стоял в стороне? Y",
		"Дашкерин: А? Она че-то сказала? W",
		"Тёмыч: Да, она уточняет, неужели ты просто стоял в стороне и наблюдал, как девки бьются?",
		"Дашкерин: Ну а че я должен был делать?",
		"Тёмыч: Действительно, на самом деле, тут мало что мог сделать человек",
		"Если б Башня вмешалась, девки б его зашухерили",
		"Дашкерин: Во-первых, я не башня. Во-вторых, меня так просто не запугать",
		"Тёмыч: (Зашухерить, это 'прогнать', но ладно.) B",
		"Ну короче да, так что тут его угнетать за то, что он 'не вмешался'... W",
		"Если бы я петушился с Егогорычем, а ты бы проходила мимо",
		"Ты что, попыталась бы 'вмешаться'?",
		"Соня: ...",
		"Тёмыч: О чем я и говорю.",
		"Соня: Они - пара. Y",
		"Тёмыч: Стоп, что? W",
		"Соня: Он её парень. Y",
		"Тёмыч: ... W",
		"Забираю свои слова обратно.",
		"Осуждаю, Чёрт Позорный...",
		"Дашкерин: ... В любом случае.",
		"OUT",
		"",
	]
	Anims = [ # диалоги. 
		"",
		"character_wit SHOW --- Что я видел --- R POS wit",
		"character_wit yee START examination-moderato Дашкерин: Короче, иду я по парку с братанами W",
		"character_wit zomg Неожиданно, я вижу, как эти две клуши дерутся, хах!",
		"character_wit yee Я даже записал это на камеру",
		"character_wit default STOP ...",
		"character_temich dadada START logic Тёмыч: Кхххххх POS def",
		"character_temich kekk REACT surprise Мааахааа, ты слышала? Он назвал тебя клушей!",
		"character_wit zomg REACT damage Дашкерин: Э, ты че крысишь POS wit",
		"character_temich kekk Тёмыч: Та не ссы, квакуха, её здесь нет... сейчас. POS def",
		"character_wit hmpf REACT frustration Дашкерин: Ты это, не пугай меня.",
		"character_temich wonder Тёмыч: Хорошо, не буду. POS def",
		"character_temich thonker Егорыч, кстати, ты же щас стрим пишешь? Маха его видит, как думаешь? POS def",
		"character_wit zomg REACT damage Дашкерин: ЧТО?! Какой стрим?! POS wit",
		"Бл*ть, если она увидит, она меня порвет не смотря ни на что!",
		"character_temich paper Тёмыч: Эххехехехехехехеххехехехехехехех POS def",
		"Развели еврея",
		"character_wit hmpf Дашкерин: Это опять прикол был? Ты начинаешь мне надоедать... POS wit",
		"character_egorich thinks Егорыч: А, что, какой стрим? POS hld",
		"Ты о чем?",
		"Тёмыч: Забей, Ирод Окаянный.",
		"character_temich thonker Так, возвращаясь к этому, как его там... POS def",
		"character_temich yee ...А, к показаниям, точно.",
		"character_temich wonder Я требую подробностей.",
		"character_temich dadada Что за запись? POS def",
		"character_wit yee Дашкерин: Да, я выложил запись в инсту еще, вот ссылка. POS wit",
		"Записывайте",
		"https://www.youtube.com/watch?v=dQw4w9WgXcQ R",
		"character_temich paper Тёмыч: (Как бы опечатку не допустить здесь...) B POS def",
		"character_temich comeon (Это как-то знакомо...)",
		"character_temich paper Итак... W",
		"~~~ Запись мордобоя добавлена в записи суда",
		"character_sonya death Соня: Стоял в стороне? Y POS pro",
		"character_wit zomg Дашкерин: А? Она че-то сказала? W POS wit",
		"character_temich kekk Тёмыч: Да, она уточняет, неужели ты просто стоял в стороне и наблюдал, как девки бьются? POS def",
		"character_wit hmpf Дашкерин: Ну а че я должен был делать? POS wit",
		"character_temich comeon Тёмыч: Действительно, на самом деле, тут мало что мог сделать человек POS def",
		"character_temich kekk Если б Башня вмешалась, девки б его зашухерили",
		"character_wit hmpf Дашкерин: Во-первых, я не башня. Во-вторых, меня так просто не запугать POS wit",
		"character_temich picard Тёмыч: (Зашухерить, это 'прогнать', но ладно.) B POS def",
		"character_temich wonder Ну короче да, так что тут его угнетать за то, что он 'не вмешался'... W",
		"Если бы я петушился с Егогорычем, а ты бы проходила мимо",
		"character_temich kekk Ты что, попыталась бы 'вмешаться'?",
		"character_sonya death Соня: ... POS pro",
		"character_temich no Тёмыч: О чем я и говорю. POS def",
		"character_sonya order66 STOP Соня: Они - пара. Y POS pro",
		"character_temich damn REACT damage Тёмыч: Стоп, что? W POS def",
		"character_sonya phone REACT frustration Соня: Он её парень. Y POS pro",
		"character_temich damn Тёмыч: ... W POS def",
		"character_temich picard Забираю свои слова обратно.",
		"character_temich rage Осуждаю, Чёрт Позорный...",
		"character_wit hmpf Дашкерин: ... В любом случае. POS wit",
		"OUT",
		"",
	]
	Music = [ # диалоги. 
		"",
		"--- Что я видел --- R",
		"START examination-moderato Дашкерин: Короче, иду я по парку с братанами W",
		"Неожиданно, я вижу, как эти две клуши дерутся, хах!",
		"Я даже записал это на камеру",
		"STOP ...",
		"START logic Тёмыч: Кхххххх",
		"REACT surprise Мааахааа, ты слышала? Он назвал тебя клушей!",
		"REACT damage Дашкерин: Э, ты че крысишь",
		"Тёмыч: Та не ссы, квакуха, её здесь нет... сейчас.",
		"REACT frustration Дашкерин: Ты это, не пугай меня.",
		"Тёмыч: Хорошо, не буду.",
		"Егорыч, кстати, ты же щас стрим пишешь? Маха его видит, как думаешь?",
		"REACT damage Дашкерин: ЧТО?! Какой стрим?!",
		"Бл*ть, если она увидит, она меня порвет не смотря ни на что!",
		"Тёмыч: Эххехехехехехехеххехехехехехехех",
		"Развели еврея",
		"Дашкерин: Это опять прикол был? Ты начинаешь мне надоедать...",
		"Егорыч: А, что, какой стрим?",
		"Ты о чем?",
		"Тёмыч: Забей, Ирод Окаянный.",
		"Так, возвращаясь к этому, как его там...",
		"...А, к показаниям, точно.",
		"Я требую подробностей.",
		"Что за запись?",
		"Дашкерин: Да, я выложил запись в инсту еще, вот ссылка.",
		"Записывайте",
		"https://www.youtube.com/watch?v=dQw4w9WgXcQ",
		"Тёмыч: (Как бы опечатку не допустить здесь...) B",
		"(Это как-то знакомо...)",
		"Итак... W",
		"~~~ Запись мордобоя добавлена в записи суда",
		"Соня: Стоял в стороне? Y",
		"Дашкерин: А? Она че-то сказала? W",
		"Тёмыч: Да, она уточняет, неужели ты просто стоял в стороне и наблюдал, как девки бьются?",
		"Дашкерин: Ну а че я должен был делать?",
		"Тёмыч: Действительно, на самом деле, тут мало что мог сделать человек",
		"Если б Башня вмешалась, девки б его зашухерили",
		"Дашкерин: Во-первых, я не башня. Во-вторых, меня так просто не запугать",
		"Тёмыч: (Зашухерить, это 'прогнать', но ладно.) B",
		"Ну короче да, так что тут его угнетать за то, что он 'не вмешался'... W",
		"Если бы я петушился с Егогорычем, а ты бы проходила мимо",
		"Ты что, попыталась бы 'вмешаться'?",
		"Соня: ...",
		"Тёмыч: О чем я и говорю.",
		"STOP Соня: Они - пара. Y",
		"REACT damage Тёмыч: Стоп, что? W",
		"REACT frustration Соня: Он её парень. Y",
		"Тёмыч: ... W",
		"Забираю свои слова обратно.",
		"Осуждаю, Чёрт Позорный...",
		"Дашкерин: ... В любом случае.",
		"OUT",
		"",
	]
	loc_file.load("C:/Games/ddkg2.save")
	loc_file.set_value("Locations","Last",filename)
	loc_file.save("C:/Games/ddkg2.save")

