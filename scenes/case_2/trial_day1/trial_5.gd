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
		"Тёмыч: ПРОТЕСТУЮ!",
		"А, я это уже сказал, да?",
		"И тем не менее, я таки ПРОТЕСТУЮ!",
		"Соня: ...",
		"Аполлонов: Все уже поняли, мы не такие тупые, как ты.",
		"Е. Анатольевна: Что такое, защита?",
		"Тёмыч: (Вы коснулись мяча рукой, теперь вашей команде сулит пенальти) B",
		"(...НЕ-НЕ-НЕ-НЕ-НЕ! Не время для таких шуток!)",
		"Ваша Честь, свидетель сказал, что сия улика, коей является кастет, есы купленным из магазину W",
		"Егорыч: ...",
		"Соня: ...",
		"Аполлонов: ...",
		"Е. Анатольевна: ...",
		"Тёмыч: ...Что, не поняли, что то я сказал?",
		"А теперь представьте, как нам, бренным школьникам, приходится учить сії високі скали,",
		"Громи канонад, що розвіяли в прах...",
		"В багнетах, що в тьмі пробивали нам шлях...",
		"Панські Петро для чинів тре кутки...",
		"Вы вот понимаете? И я не понимаю.",
		"Но вы нам это задаете, господа-учителя",
		"Е. Анатольевна: Эмм, но я вам химию преподаю только.",
		"Тёмыч: Все, что я сказал, при возможности, передайте Александре Андреевне, угу...",
		"Аполлонов: Шо ты несешь, ё-маё...",
		"Соня: К теме. Y",
		"Тёмыч: Ваша Честь, что касается таки противоречия, в конце-концов. W",
		"Я просто хочу указать на одну крайне важную деталь об этом кастете.",
		"Это, определенно точно, напечатанный на специальном принтере предмет.",
		"Е. Анатольевна: Каковы Ваши доказательства?",
		"Тёмыч: Прошу обратить внимание, что на этом кастете нет спаек. Обычно, дешевые китайские пластмассовые игрушки выдавливаются, причем этот процесс делается для двух половинок",
		"Потом, эти половинки паяются друг с другом.",
		"Но тут нет спаек, плюс тут есть отчетливый дефект, пресущий конкретно 3D принтерам:",
		"Сдвиг по вертикальной оси, что вызывается отсутствием должного обслуживания 3D принтера, либо неправильной настройкой.",
		"Как мы, черти пластмассовые, изредка говорим - ось Z 'перетянута'",
		"На китайских игрушках такого дефекта никогда не встречается... обычно.",
		"Соня: И что? Y",
		"Тёмыч: Эмм, в смысле? W",
		"Соня: ...",
		"Соня: Связь. Y",
		"Тёмыч: (Спасибо за грамотно и детально изложенные вопросы, со всеми уточнениями. Я прекрасно его понял и сейчас на него отвечу... ё-маё.) B",
		"Е. Анатольевна: Действительно. Ну, даже если и так, то что это нам дает? W",
		"Мне кажется, что от проявления этого факта, позиция обвинения не меняется.",
		"Даже если его изо льда выточили, то это все равно кастет, оружие преступления.",
		"Он жёсткий такой, ну не самый мягкий разумеется. Во, как стучит, я могу его в качестве молотка своего использовать.",
		"Тёмыч: Действительно, как-то не совсем подумал...",
		"(Хмм, а хотя...) B",
		"Стойте, а чего я туплю. W",
		"Я имею ввиду, то, о чем я говорю, определенно точно доказывает то, что G",
		"SPLIT:Владелец обязан иметь 3D принтер:У владельца должен быть доступ к 3D печати.:3:49",
		"", #
		"фыв",
		"",
	]
	Music = [
		"",
		"Тёмыч: ПРОТЕСТУЮ!",
		"А, я это уже сказал, да?",
		"И тем не менее, я таки ПРОТЕСТУЮ!",
		"Соня: ...",
		"Аполлонов: Все уже поняли, мы не такие тупые, как ты.",
		"Е. Анатольевна: Что такое, защита?",
		"Тёмыч: (Вы коснулись мяча рукой, теперь вашей команде сулит пенальти) B",
		"(...НЕ-НЕ-НЕ-НЕ-НЕ! Не время для таких шуток!)",
		"Ваша Честь, свидетель сказал, что сия улика, коей является кастет, есы купленным из магазину W",
		"Егорыч: ...",
		"Соня: ...",
		"Аполлонов: ...",
		"Е. Анатольевна: ...",
		"Тёмыч: ...Что, не поняли, что то я сказал?",
		"А теперь представьте, как нам, бренным школьникам, приходится учить сії високі скали,",
		"Громи канонад, що розвіяли в прах...",
		"В багнетах, що в тьмі пробивали нам шлях...",
		"Панські Петро для чинів тре кутки...",
		"Вы вот понимаете? И я не понимаю.",
		"Но вы нам это задаете, господа-учителя",
		"Е. Анатольевна: Эмм, но я вам химию преподаю только.",
		"Тёмыч: Все, что я сказал, при возможности, передайте Александре Андреевне, угу...",
		"Аполлонов: Шо ты несешь, ё-маё...",
		"Соня: К теме. Y",
		"Тёмыч: Ваша Честь, что касается таки противоречия, в конце-концов. W",
		"Я просто хочу указать на одну крайне важную деталь об этом кастете.",
		"Это, определенно точно, напечатанный на специальном принтере предмет.",
		"Е. Анатольевна: Каковы Ваши доказательства?",
		"Тёмыч: Прошу обратить внимание, что на этом кастете нет спаек. Обычно, дешевые китайские пластмассовые игрушки выдавливаются, причем этот процесс делается для двух половинок",
		"Потом, эти половинки паяются друг с другом.",
		"Но тут нет спаек, плюс тут есть отчетливый дефект, пресущий конкретно 3D принтерам:",
		"Сдвиг по вертикальной оси, что вызывается отсутствием должного обслуживания 3D принтера, либо неправильной настройкой.",
		"Как мы, черти пластмассовые, изредка говорим - ось Z 'перетянута'",
		"На китайских игрушках такого дефекта никогда не встречается... обычно.",
		"Соня: И что? Y",
		"Тёмыч: Эмм, в смысле? W",
		"Соня: ...",
		"Соня: Связь. Y",
		"Тёмыч: (Спасибо за грамотно и детально изложенные вопросы, со всеми уточнениями. Я прекрасно его понял и сейчас на него отвечу... ё-маё.) B",
		"Е. Анатольевна: Действительно. Ну, даже если и так, то что это нам дает? W",
		"Мне кажется, что от проявления этого факта, позиция обвинения не меняется.",
		"Даже если его изо льда выточили, то это все равно кастет, оружие преступления.",
		"Он жёсткий такой, ну не самый мягкий разумеется. Во, как стучит, я могу его в качестве молотка своего использовать.",
		"Тёмыч: Действительно, как-то не совсем подумал...",
		"(Хмм, а хотя...) B",
		"Стойте, а чего я туплю. W",
		"Я имею ввиду, то, о чем я говорю, определенно точно доказывает то, что G",
		"SPLIT:Владелец обязан иметь 3D принтер:У владельца должен быть доступ к 3D печати.:3:49",
		"", #
		"фыв",
		"",
	]
	Anims = [ # массив, в котором 1 слово это перс, а 2 - его анимка
		"",
		"Тёмыч: ПРОТЕСТУЮ!",
		"А, я это уже сказал, да?",
		"И тем не менее, я таки ПРОТЕСТУЮ!",
		"Соня: ...",
		"Аполлонов: Все уже поняли, мы не такие тупые, как ты.",
		"Е. Анатольевна: Что такое, защита?",
		"Тёмыч: (Вы коснулись мяча рукой, теперь вашей команде сулит пенальти) B",
		"(...НЕ-НЕ-НЕ-НЕ-НЕ! Не время для таких шуток!)",
		"Ваша Честь, свидетель сказал, что сия улика, коей является кастет, есы купленным из магазину W",
		"Егорыч: ...",
		"Соня: ...",
		"Аполлонов: ...",
		"Е. Анатольевна: ...",
		"Тёмыч: ...Что, не поняли, что то я сказал?",
		"А теперь представьте, как нам, бренным школьникам, приходится учить сії високі скали,",
		"Громи канонад, що розвіяли в прах...",
		"В багнетах, що в тьмі пробивали нам шлях...",
		"Панські Петро для чинів тре кутки...",
		"Вы вот понимаете? И я не понимаю.",
		"Но вы нам это задаете, господа-учителя",
		"Е. Анатольевна: Эмм, но я вам химию преподаю только.",
		"Тёмыч: Все, что я сказал, при возможности, передайте Александре Андреевне, угу...",
		"Аполлонов: Шо ты несешь, ё-маё...",
		"Соня: К теме. Y",
		"Тёмыч: Ваша Честь, что касается таки противоречия, в конце-концов. W",
		"Я просто хочу указать на одну крайне важную деталь об этом кастете.",
		"Это, определенно точно, напечатанный на специальном принтере предмет.",
		"Е. Анатольевна: Каковы Ваши доказательства?",
		"Тёмыч: Прошу обратить внимание, что на этом кастете нет спаек. Обычно, дешевые китайские пластмассовые игрушки выдавливаются, причем этот процесс делается для двух половинок",
		"Потом, эти половинки паяются друг с другом.",
		"Но тут нет спаек, плюс тут есть отчетливый дефект, пресущий конкретно 3D принтерам:",
		"Сдвиг по вертикальной оси, что вызывается отсутствием должного обслуживания 3D принтера, либо неправильной настройкой.",
		"Как мы, черти пластмассовые, изредка говорим - ось Z 'перетянута'",
		"На китайских игрушках такого дефекта никогда не встречается... обычно.",
		"Соня: И что? Y",
		"Тёмыч: Эмм, в смысле? W",
		"Соня: ...",
		"Соня: Связь. Y",
		"Тёмыч: (Спасибо за грамотно и детально изложенные вопросы, со всеми уточнениями. Я прекрасно его понял и сейчас на него отвечу... ё-маё.) B",
		"Е. Анатольевна: Действительно. Ну, даже если и так, то что это нам дает? W",
		"Мне кажется, что от проявления этого факта, позиция обвинения не меняется.",
		"Даже если его изо льда выточили, то это все равно кастет, оружие преступления.",
		"Он жёсткий такой, ну не самый мягкий разумеется. Во, как стучит, я могу его в качестве молотка своего использовать.",
		"Тёмыч: Действительно, как-то не совсем подумал...",
		"(Хмм, а хотя...) B",
		"Стойте, а чего я туплю. W",
		"Я имею ввиду, то, о чем я говорю, определенно точно доказывает то, что G",
		"SPLIT:Владелец обязан иметь 3D принтер:У владельца должен быть доступ к 3D печати.:3:49",
		"asd", #
		"фыв",
		"",
	]
	Ev = [
		"",
		"Тёмыч: ПРОТЕСТУЮ!",
		"А, я это уже сказал, да?",
		"И тем не менее, я таки ПРОТЕСТУЮ!",
		"Соня: ...",
		"Аполлонов: Все уже поняли, мы не такие тупые, как ты.",
		"Е. Анатольевна: Что такое, защита?",
		"Тёмыч: (Вы коснулись мяча рукой, теперь вашей команде сулит пенальти) B",
		"(...НЕ-НЕ-НЕ-НЕ-НЕ! Не время для таких шуток!)",
		"Ваша Честь, свидетель сказал, что сия улика, коей является кастет, есы купленным из магазину W",
		"Егорыч: ...",
		"Соня: ...",
		"Аполлонов: ...",
		"Е. Анатольевна: ...",
		"Тёмыч: ...Что, не поняли, что то я сказал?",
		"А теперь представьте, как нам, бренным школьникам, приходится учить сії високі скали,",
		"Громи канонад, що розвіяли в прах...",
		"В багнетах, що в тьмі пробивали нам шлях...",
		"Панські Петро для чинів тре кутки...",
		"Вы вот понимаете? И я не понимаю.",
		"Но вы нам это задаете, господа-учителя",
		"Е. Анатольевна: Эмм, но я вам химию преподаю только.",
		"Тёмыч: Все, что я сказал, при возможности, передайте Александре Андреевне, угу...",
		"Аполлонов: Шо ты несешь, ё-маё...",
		"Соня: К теме. Y",
		"Тёмыч: Ваша Честь, что касается таки противоречия, в конце-концов. W",
		"Я просто хочу указать на одну крайне важную деталь об этом кастете.",
		"Это, определенно точно, напечатанный на специальном принтере предмет.",
		"Е. Анатольевна: Каковы Ваши доказательства?",
		"Тёмыч: Прошу обратить внимание, что на этом кастете нет спаек. Обычно, дешевые китайские пластмассовые игрушки выдавливаются, причем этот процесс делается для двух половинок",
		"Потом, эти половинки паяются друг с другом.",
		"Но тут нет спаек, плюс тут есть отчетливый дефект, пресущий конкретно 3D принтерам:",
		"Сдвиг по вертикальной оси, что вызывается отсутствием должного обслуживания 3D принтера, либо неправильной настройкой.",
		"Как мы, черти пластмассовые, изредка говорим - ось Z 'перетянута'",
		"На китайских игрушках такого дефекта никогда не встречается... обычно.",
		"Соня: И что? Y",
		"Тёмыч: Эмм, в смысле? W",
		"Соня: ...",
		"Соня: Связь. Y",
		"Тёмыч: (Спасибо за грамотно и детально изложенные вопросы, со всеми уточнениями. Я прекрасно его понял и сейчас на него отвечу... ё-маё.) B",
		"Е. Анатольевна: Действительно. Ну, даже если и так, то что это нам дает? W",
		"Мне кажется, что от проявления этого факта, позиция обвинения не меняется.",
		"Даже если его изо льда выточили, то это все равно кастет, оружие преступления.",
		"Он жёсткий такой, ну не самый мягкий разумеется. Во, как стучит, я могу его в качестве молотка своего использовать.",
		"Тёмыч: Действительно, как-то не совсем подумал...",
		"(Хмм, а хотя...) B",
		"Стойте, а чего я туплю. W",
		"Я имею ввиду, то, о чем я говорю, определенно точно доказывает то, что G",
		"SPLIT:Владелец обязан иметь 3D принтер:У владельца должен быть доступ к 3D печати.:3:50",
		"asd", #
		"фыв",
		"",
	]
	loc_file.load("C:/Games/ddkg2.save")
	loc_file.set_value("Locations","Last",filename)
	loc_file.save("C:/Games/ddkg2.save")
