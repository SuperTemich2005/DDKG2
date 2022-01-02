extends Node2D
var Dialogue
var BoxColor
var Roles
func _ready():
	BoxColor = Color(0.5,1,0.5,1)
	Roles = [
		"character_egorich def",
		"character_lentoln jud",
		#"character_temich hld",
		"character_sonya pro",
		"character_sewa wit",
		"character_temich wit",
		"character_tuvok wit",
		"character_msis wit",
	]
	Dialogue = [ # диалоги. 
		"Егорыч: Секунду... Я понял!",
		"Елена Анатольевна, я всё понял.|W|character_egorich all_of_sudden|START omen",
		"На 3 тысячи невозможно никого выкупить, но всё будет сходиться, если переосмыслить мотивы.",
		"Е. Анатольевна: И как же?|W|character_lentoln hmm",
		"Егорыч: Вчера в 2 часа ночи, в тамбуре, трое неизвестных вели беседу касательно последних событий.|W|character_egorich paper",
		"Соня: И?|Y|character_sonya death",
		"Егорыч: Башим Дашкерин собственной персоной хвалил Жеку и третье лицо, кое вероятно является Беркутом, за 'проделанную работу' и подарил ему 'гонорар'|W|character_egorich suspects",
		"Беркут: Ложь, пизд*ж и провокация.|W|character_sewa kaef",
		"Соня: У тебя есть улики, что этот разговор произошел?|Y|character_sonya death",
		"Егорыч: Да. В тот вечер, Башим Дашкерин курил сигарету.|W|character_egorich default|STOP all|---|show cig",
		"Окурок прилагается.|W|character_egorich default|STOP all|---|show cig",
		"Соня: ...|W|character_sonya forceslam|START pursuit_slow|REACT sith_slam",
		"Беркут: Ч-Что?! Этот придурок--|W|character_sewa rage",
		"...|W|character_sewa oi",
		"Егорыч: Беркут не украл 3,250 гривень для того, чтобы выкупить свою девушку из семьи тирана.|W|character_egorich idk",
		"Он украл их, чтобы подставить Тьоху. Специально для Башима Дашкерина!|W|character_egorich slam",
		"Потому что Башим Дашкерин видит в Тьохе угрозу!",
		"Беркут: Да это всё х*йня!|W|character_sewa rage",
		"Как ты это всё докажешь? Выйди из своего маня-мирка!",
		"Егорыч: Башим Дашкерин сбросил тебе 'гонорар' на карту.|W|character_egorich slam|---|REACT slam",
		"Беркут: И как ты докажешь?|W|character_sewa oi",
		"Егорыч: (Хмм, единственный способ узнать наверняка, это заставить его проверить приложение своего банка. Монобанк или Приват24, что-то такое...)|B|character_egorich suspects",
		"(Но я не могу быть уверен, что у него есть такое на телефоне...)|B|character_egorich suspects",
		"(Что же, придётся применить так называемый Тёмычем 'PSI Блеф Ω'!)|B|character_egorich yee",
		"(Но как?)|B|character_egorich thinks",
		"(Идея!)|B|character_egorich yee",
		"Егорыч: Нет, мой друг, докажешь ты.|W|character_egorich thinks",
		"Беркут: Что? Пх, нет!|W|character_sewa kaef",
		"Егорыч: В вчерашнем разговоре, Дашкерин сказал, что деньги тебе перевел. Ты же ответил, что проверил банкинг и деньги тебе дошли.|W|character_egorich suspects",
		"Беркут: Что? Не говорил я такого.|W|character_sewa kaef",
		"Егорыч: GOT 'EM!|R|character_egorich slam|STOP all|REACT slam",
		"Тёмыч: GOT 'EM!|R|character_temich deskslam|---|REACT slam",
		"Соня: ...|W|character_sonya forceslam|---|REACT sith_slam",
		"Беркут: Ч-Что? Я ничего ему не ответил!|W|character_sewa oi|START pursuit",
		"Егорыч: Просто если бы ты реально вчера не контактировал с Дашкериным|W|character_egorich default",
		"То ты бы сказал, что спал или что-то подобное!",
		"Тёмыч: К тому же, ты не сказал, что у тебя нет приложения банковского на телефоне.|W|character_temich kekk",
		"Ты классно спалился.",
		"Егорыч: Елена Анатольевна, защита Тьохи, да и Тьоха наверное тоже, требует, чтобы Всеволод Беркут показал нам свой телефон и свои последние транзакции!|W|character_egorich slam|---|REACT slam",
		"Мы должны найти крупный платёж среди последних транзакций!",
		"Тёмыч: Эм, нет, на самом деле, нам нужны платежи, сделанные вчера в 2 часа ночи.|W|character_temich yee",
		"Е. Анатольевна: Требование обосновано. Всеволод Беркут, разблокируй телефон. Соня, наблюдай. Нам не нужно нарушение приватности или что-то подобное.|W|character_lentoln hmm",
		"Беркут: ДА ИДИТЕ НАХ*Й!|W|character_sewa rage",
		"Я никогда не дам вам, менты продажные, трогать МОЙ телефон!|W|character_sewa rage",
		"Соня: Тактика защиты предполагает, что у Беркута должен быть сообщник - Жека Фильмонова.|Y|character_sonya death",
		"Так что я требую доказательств того, что Жека Фильмонова устроила маскарад в панской хате.",
		"Жека: Можете не утруждаться, вы никогда этого не сделаете.|W|character_msis hmm",
		"Я всё это время была в кругу свидетелей.",
		"Егорыч: В кругу своего бывшего парня, да?|W|character_egorich thinks",
		"Жека: Бывшего?|W|character_msis ugh",
		"Егорыч: Проехали...|W|character_egorich suspects",
		"Жека: Нет. На самом деле, я всё это время была с...|W|character_msis hmm",
		"Вами!|W|character_msis lmfao|STOP all|REACT surprise",
		"--- Вы - мои свидетели. ---|R|character_msis default|---|REACT intro_woosh",
		"Жека: Радик, Тёмыч, Ты, Жека и Я. Мы все сидели за одним столом и пили сок.|W|character_msis lmfao|START examination-allegro",
		"Жека: Выпили по стакашке, разговаривали про разное.",
		"Жека: Самое удивительное, что произошло за это время, это появление рядом с нами человека в хиджабе.|W|character_msis what",
		"Жека: Может, меня обокрали как раз-таки тогда?",
		"Егорыч: Ч-Что?!|W|character_egorich all_of_sudden|STOP all|REACT damage",
		"Т-Тебя не было с нами! Ты нагло лжёшь!|W|character_egorich slam|---|REACT slam",
		"Тёмыч: *шёпот*|W|character_temich yee",
		"Радомир: Ч-Что?|W|character_tuvok surprise",
		"Тёмыч: *шёпот-шёпот*|W|character_temich yee",
		"Радомир: *шёпот*|W|character_temich surprise",
		"Тёмыч: Ну так. *шёпот*|W|character_temich kekk",
		"Радомир: Ааа!|W|character_tuvok surprise",
		"Егорыч: (Что они там обсуждают?)|B|character_egorich suspects",
		"Тёмыч: На самом деле, я не могу сказать, что её не было рядом.|W|character_temich comeon|START suspense|REACT surprise",
		"Егорыч: В смысле?!|W|character_egorich all_of_sudden",
		"Радомир: Я тоже. Извини, Егор.|W|character_tuvok default",
		"Жека: Ч-Что?!|W|character_msis ugh",
		"То есть... Да, вот видишь, ты не можешь доказать, что меня с вами не было! А я там была и видела всё то же, что и вы!|W|character_msis lmfao",
		"Егорыч: (Тьоха, блин!)|B|character_egorich slam|---|REACT slam",
		"(Нет, но ведь он зачем-то подговорил Тувока, чтобы не помешать Жеке соврать!)|B|character_egorich suspects",
		"(Стоп, может, он сделал это специально для того, чтобы я сам раскрыл её ложь?)|B|character_egorich thinks",
		"(Действительно, если трое заинтересованных лиц будет утверждать, что её с нами не было, нам никто не поверит)",
		"(И может даже не разрешат провести допрос!)",
		"Егорыч: Хорошо, я лично свергну тебя и уничтожу твою репутацию|W|character_egorich objection|---|REACT intro_woosh",
		"Жека: Ну попробуй...|W|character_msis lmfao",
		"OUT res://scenes/case_3/trial_1/arc_a/trial_13a_interogate.tscn",
	]
