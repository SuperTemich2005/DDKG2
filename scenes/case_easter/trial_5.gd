extends Node2D
var Dialogue
var BoxColor
var Roles
func _ready():
	BoxColor = Color(0.5,1,0.5,1)
	Roles = [
		"character_egorich pro",
		"character_swetlan jud",
		#"character_temich hld",
		"character_sonya pro",
		"character_lentoln wit",
		"character_temich def",
	]
	Dialogue = [ # диалоги. 
		"",
		"Егорыч: Светлана, эммм, Леонидовна!|W|character_egorich all_of_sudden|---|REACT surprise",
		"(Или как её там...)|B|character_egorich suspects",
		"Вы говорите, что наблюдали за нами в надежде, что вы с нами поздороваетесь...|W|character_egorich paper",
		"Но вас наверняка то, как с вами здороваются, не интересовало более, ...|W|character_egorich slam|---|REACT slam",
		"...чем какие-то шкеты за окном!|W|character_egorich objection|START egorich_objection|REACT intro_woosh",
		"Библиотекарша: Ааа!|W|character_lentoln omg",
		"Светланфёдрна: И что? Ну отвлекся человек, че тут такого...|W|character_swetlan wtf",
		"Егорыч: А то, что вполне возможно, каждый из нас с вами поздоровался,|W|character_egorich thinks",
		"А вы не заметили!",
		"Библиотекарша: Эмм, нуу, ойголовамоя...|W|character_lentoln sigh",
		"Да никто мне даже головой не кивнул!|W|character_lentoln rage|STOP all",
		"Тёмыч: Опять-двадцать-пять...|W|character_temich rage|START suspense",
		"Светланфёдрна: Вполне вохможно, что кто-то и кивнул, так а 'здрасте' никто не сказал нормально.|W|character_swetlan default",
		"И вы ведь не докажете, что большинство из вас поздоровалось со Светланой Леонидовной|W|character_swetlan yee",
		"Тёмыч: ...|W|character_temich wonder",
		"(Егорыч подхватил мой тренд, однако далее ему нужно предложение извне.)|B|character_temich kekk",
		"Светлана Фёдоровна, Светлана Леонидовна не могла видеть, как с ней здороваются. Она могла только слышать людей, которые говорят 'здравствуйте'|W",
		"Тем не менее, согласно этому документу кивок головой считается.|W|character_temich wonder|---|---|show aff",
		"Так что всё, что нам остается, это доказать, что большая часть присутствующих здесь кивнула головой.|W|character_temich deskslam|STOP all|REACT slam",
		"И даже, если вы возразите, вы не сможете предоставить доказательств чтобы опровергнуть наше заявление!|W|character_temich objection_1|START pursuit|REACT intro_woosh",
		"Светланфёдрна: Ах!|W|character_swetlan default|---|REACT surprise",
		"Библиотекарша: Но... но я... но вы...|W|character_lentoln hmm",
		"АААААААААА!|W|character_lentoln omg|---|REACT damage",
		"Светланфёдрна: И всё же, ты можешь доказать, что твои друзья поздоровались с Светланой Леонидовной?|W|character_swetlan hmm",
		"Тёмыч: Могу ли я доказать, что мои друзья поздоровались с Светланой Леонидовной...?|G|character_temich kekk|---|---|split;Да, могу.:0;Нет, не могу.:26",
		"Тёмыч: ...Нет, к сожалению, я не могу этого сделать.|W|character_temich comeon",
		"Светланфёдрна: Тогда о чем может идти речь? Значит всё, приехали, вот так вот...|W|character_swetlan default|STOP all",
		"Это как в истории про компот|W|character_swetlan yee|START ltn_theme",
		"Тёмыч: (А истории про то, как её чуть не раздавил тиранозавр, нету?)|B|character_temich rage",
		"Светланфёдрна: Я гуляла с внуками по парку|W|character_swetlan hmm",
		"Как вдруг Женечка, младшенькая моя внучечка, сказала, что в детском саду у неё компот украли",
		"Когда мы пришли в садик, мальчик, который у неё украл компот, сразу не признался",
		"Но в итоге он понял, что свою невиновность он не сможет доказать и всё выдал чистосердечно, вот...|W|character_swetlan yee",
		"Тёмыч: ...|W|character_temich default",
		"(СУКАНЕБЕСИМЕНЯЁМАЁ)|B",
		"Как бы то ни было, вы всё-равно кое-что упускаете.|W|character_temich deskslam|START pursuit|REACT slam",
		"На моей с Егорычем стороне - дыры в показаниях Светланы Леонидовны, правила этикета и 30 человек свидетелей, которые встанут на нашу сторону.",
		"У вас - только вы и ваш авторитет как завуча.",
		"Егорыч: Но каким бы завучем вы не были, нас в 30 раз больше, чем вас!|W|character_egorich slam|---|REACT slam",
		"По этому, признайте, что мы - вежливые, воспитанные люди и поздоровались с библиотекаршей!",
		"Тёмыч: Иначе мы эти 300 монологов не выучим и вы нам ничего за это не сделаете!|W|character_temich objection_1|STOP all|REACT intro_woosh",
		"Светланфёдрна: ...|W|character_swetlan yee",
		"...|W|character_swetlan hmm",
		"...|W|character_swetlan default",
		"...|W|character_swetlan wtf",
		"Хорошо, ваша правда.|W|character_swetlan yee|---|REACT surprise",
		"Вот, нравятся мне люди, которые до конца стоят на своей точке зрения и грамотно оспраивают суть вопроса...",
		"Тёмыч: Значит...|W|character_temich wonder",
		"(Мы выиграли!)|B|character_temich kekk",
		"Светланфёдрна: Значит, слушайте сюда внимательно|W|character_swetlan default|START verdict",
		"Я поняла, что вы всё-таки поздоровались со Светланой Леонидовной, когда заходили в библиотеку",
		"Так что на этот раз, вы",
		"Прощены.|BIG",
		"На этом всё, урок закончен, до свидания!",
		"Кейс подготовлен специально для видео в Мемный Дискут. 28.01.22|P|character_swetlan yee",
		"10-В топ.",
	]
	$investigation_screen._on_Next_pressed()




func _on_investigation_screen_next():
	if $investigation_screen.Cur == 32-16:
		BoxColor = Color(0.5,0.5,1,1)
		$investigation_screen.refresh()
