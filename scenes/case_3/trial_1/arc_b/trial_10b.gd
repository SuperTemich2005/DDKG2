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
		"Егорыч: Елена Анатольевна, а теперь серьёзно.|W|character_egorich slam|---|REACT slam",
		"Я считаю, что вор - Жека, а помогал - Беркут!|W|character_egorich slam|START slam|---|arc;B",
		"Жека: А ты страха не знаешь, адвокат.|W|character_msis default|START omen",
		"Егорыч: Твой мотив - накопление денег, чтобы сбежать из дома, где к тебе с сестрой пристаёт отчим!|W|character_egorich slam|---|REACT slam",
		"Жека: Как ты смеешь...!|W|character_msis rage",
		"Егорыч: Будешь отрицать это?|W|character_egorich suspects",
		"Жека: Да, буду!|W|character_msis rage",
		"Соня: Перед тем, как обвинять Женю, ты должен доказать, что Беркут переоделся в араба!|Y|character_sonya death",
		"Тёмыч: В таком случае, мы требуем проведения судмедэкспертизы на хиджабе для сравнения пото-жировых следов.|W|character_temich kekk",
		"Е. Анатольевна: Но в таком случае, мы не можем вынести вердикт самостоятельно.|W|character_lentoln hmm",
		"Соня: Придётся ждать решения полиции. Но можете быть уверены, что вор - Тёмыч.|Y|character_sonya death",
		"Егорыч: (Чёрт! Если всё именно так, как я сказал, то я не смогу помочь Тёмычу сам.)|B|character_egorich slam|---|REACT slam",
		"Тёмыч: Результат заседания в высшей инстанции докажет мою невиновность, Сонич, можешь быть уверена.|W|character_temich kekk",
		"Е. Анатольевна: Что же, в таком случае, у меня нет выбора...|W|character_lentoln sigh",
		"Беркут: Что? В высшей инстанции? Вы передадите это дело в полицию?|W|character_sewa oi",
		"Жека: Не переживай, выкрутимся...|W|character_msis ugh",
		"Тёмыч: ...Отлично, это перескажете следаку какому-нибудь.|W|character_temich kekk",
		"Е. Анатольевна: По презумпции невиновности, а также в связи с новыми фактами и неоднозначностью улик,|W|character_lentoln sigh",
		"Артём Зинец считается",
		"Невиновным.|BIG",
		"Дело передаётся в полицию, наше же заседание закрыто.|W",
		"Тёмыч: Славно.|W|character_temich kekk",
		"OUT res://scenes/case_3/trial_1/arc_b/bposttrial_day1.tscn",
	]
