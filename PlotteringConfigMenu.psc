Scriptname PlotteringConfigMenu extends SKI_ConfigBase  ;Подключаем SkyUI

GlobalVariable Property iCountRepHunting  Auto  ;Глобальные переменные. Кол-во репутации Охотников на Чудовищ и количество бросков в Чашу
GlobalVariable Property iCountDrop  Auto  

Actor Property Player  Auto  

; SCRIPT VERSION
int function GetVersion()	;Функция возвращает весрию API
	return 4
endFunction

event OnVersionUpdate(int a_version)
	if (a_version > 1)
		Debug.Trace(self + ": Updating script to version " + a_version)
		OnConfigInit()
	endIf
endEvent

event OnConfigInit()	;Страницы с характеристиками
	Pages = new string[2]
	Pages[0] = "Характеристики"
	Pages[1] = "Репутации"

endEvent

;Список переменных, для хранения данных

int countDrop 
int countRepHunt

int playerBaseHealth
int playerBaseStamina
int playerBaseMagic

int playerHealth
int playerStamina
int playerMagic

int playerThingsHealth
int playerThingsStamina
int playerThingsMagic



int playerBaseRegenHealth
int playerBaseRegenStamina
int playerBaseRegenMagic

int playerRegenHealth
int playerRegenStamina
int playerRegenMagic

int playerThingsRegenHealth
int playerThingsRegenStamina
int playerThingsRegenMagic



int playerBaseMagicResist
int playerBaseDamageResist

int playerMagicResist
int playerDamageResist

int playerThingsMagicResist
int playerThingsDamageResist



int playerBaseCarryWeight
int playerCarryWeight
int playerThingsCarryWeight



int playerBaseCritChance
int playerCritChance
int playerThingsCritChance

event OnPageReset(string page)
	if (page == "Характеристики")			;Если открыта страница "Характеристики", то выводим одну информацию
		SetCursorPosition(0) ;Установка курсора на позицию, где необходимо вывести информацию
		playerBaseHealth = AddTextOption("Свой уровень жизни: ", Game.GetPlayer().GetBaseAV("Health"))	;Выводим текст и получаем БАЗОВЫЙ уровень жизни персонажа
		SetCursorPosition(1)		;Ставим курсор на другую позицию
		playerThingsHealth = AddTextOption("Вещи: ", Game.GetPlayer().GetAV("Health") - Game.GetPlayer().GetBaseAV("Health"))	;Получаем уровень жизни, который дают вещи, зелья и т.д. 
																																	;Для этого, мы получаем максмально доступный уровень жизни
																																	;И вычитаем Базовый.
		SetCursorPosition(2)				;Снова переводим курсор на другую позицию
		playerHealth = AddTextOption("Текущий уровень жизни: ", Game.GetPlayer().GetAV("Health"))	;Получаем максимальный уровень жизни
		SetCursorPosition(4)
		AddHeaderOption(" ")			;Добавляем ращделитель, чтоб всё не мешать
		SetCursorPosition(5)
		AddHeaderOption(" ")


		SetCursorPosition(6)
		playerBaseStamina = AddTextOption("Свой уровень энергии: ", Game.GetPlayer().GetBaseAV("Stamina"))
		SetCursorPosition(7)
		playerThingsStamina = AddTextOption("Вещи: ", Game.GetPlayer().GetAV("Stamina") - Game.GetPlayer().GetBaseAV("Stamina"))
		SetCursorPosition(8)
		playerStamina = AddTextOption("Текущий уровень энергии: ", Game.GetPlayer().GetAV("Stamina"))
		SetCursorPosition(10)
		AddHeaderOption(" ")
		SetCursorPosition(11)
		AddHeaderOption(" ")


		SetCursorPosition(12)
		playerBaseMagic = AddTextOption("Свой уровень магии: ", Game.GetPlayer().GetBaseAV("Magicka"))
		SetCursorPosition(13)
		playerThingsMagic = AddTextOption("Вещи: ", Game.GetPlayer().GetAV("Magicka") - Game.GetPlayer().GetBaseAV("Magicka"))
		SetCursorPosition(14)
		playerMagic = AddTextOption("Текущий уровень магии: ", Game.GetPlayer().GetAV("Magicka"))
		SetCursorPosition(16)
		AddHeaderOption(" ")
		SetCursorPosition(17)
		AddHeaderOption(" ")

		

		SetCursorPosition(18)
		playerBaseRegenHealth = AddTextOption("Свой реген жизни: ", Game.GetPlayer().GetBaseAV("HealRateMult"))
		SetCursorPosition(19)
		playerThingsRegenHealth = AddTextOption("Вещи: ", Game.GetPlayer().GetAV("HealRateMult") - Game.GetPlayer().GetBaseAV("HealRateMult"))
		SetCursorPosition(20)
		playerRegenHealth = AddTextOption("Текущий реген жизни: ", Game.GetPlayer().GetAV("HealRateMult"))
		SetCursorPosition(22)
		AddHeaderOption(" ")
		SetCursorPosition(23)
		AddHeaderOption(" ")

		SetCursorPosition(24)
		playerBaseRegenStamina = AddTextOption("Свой реген энергии: ", Game.GetPlayer().GetBaseAV("StaminaRateMult"))
		SetCursorPosition(25)
		playerThingsRegenStamina = AddTextOption("Вещи: ", Game.GetPlayer().GetAV("StaminaRateMult") - Game.GetPlayer().GetBaseAV("StaminaRateMult"))
		SetCursorPosition(26)
		playerRegenStamina = AddTextOption("Текущий реген энергии: ", Game.GetPlayer().GetAV("StaminaRateMult"))
		SetCursorPosition(28)
		AddHeaderOption(" ")
		SetCursorPosition(29)
		AddHeaderOption(" ")

		SetCursorPosition(30)
		playerBaseRegenMagic = AddTextOption("Свой реген магии: ", Game.GetPlayer().GetBaseAV("MagickaRateMult"))
		SetCursorPosition(31)
		playerThingsRegenMagic = AddTextOption("Вещи: ", Game.GetPlayer().GetAV("MagickaRateMult") - Game.GetPlayer().GetBaseAV("MagickaRateMult"))
		SetCursorPosition(32)
		playerRegenMagic = AddTextOption("Текущий реген магии: ", Game.GetPlayer().GetAV("MagickaRateMult"))
		SetCursorPosition(34)
		AddHeaderOption(" ")
		SetCursorPosition(35)
		AddHeaderOption(" ")



		SetCursorPosition(36)
		playerBaseMagicResist = AddTextOption("Своё сопротивление магии: ", Game.GetPlayer().GetBaseAV("MagicResist"))
		SetCursorPosition(37)
		playerThingsMagicResist = AddTextOption("Вещи: ", Game.GetPlayer().GetAV("MagicResist") - Game.GetPlayer().GetBaseAV("MagicResist"))
		SetCursorPosition(38)
		playerMagicResist = AddTextOption("Текущее сопротивление магии: ", Game.GetPlayer().GetAV("MagicResist"))
		SetCursorPosition(40)
		AddHeaderOption(" ")
		SetCursorPosition(41)
		AddHeaderOption(" ")

		SetCursorPosition(42)
		playerBaseDamageResist = AddTextOption("Своё сопротивление физ.урону: ", Game.GetPlayer().GetBaseAV("DamageResist"))
		SetCursorPosition(43)
		playerThingsDamageResist = AddTextOption("Вещи: ", Game.GetPlayer().GetAV("DamageResist") - Game.GetPlayer().GetBaseAV("DamageResist"))
		SetCursorPosition(44)
		playerDamageResist = AddTextOption("Текущее сопротивление физ.урону: ", Game.GetPlayer().GetAV("DamageResist"))
		SetCursorPosition(46)
		AddHeaderOption(" ")
		SetCursorPosition(47)
		AddHeaderOption(" ")



		SetCursorPosition(48)
		playerBaseCarryWeight = AddTextOption("Свой максимальный вес: ", Game.GetPlayer().GetBaseAV("CarryWeight"))
		SetCursorPosition(49)
		playerThingsCarryWeight = AddTextOption("Вещи: ", Game.GetPlayer().GetAV("CarryWeight") - Game.GetPlayer().GetBaseAV("CarryWeight"))
		SetCursorPosition(50)
		playerCarryWeight = AddTextOption("Текущий максимальный вес: ", Game.GetPlayer().GetAV("CarryWeight"))
		SetCursorPosition(52)
		AddHeaderOption(" ")
		SetCursorPosition(53)
		AddHeaderOption(" ")



		
		SetCursorPosition(54)
		playerBaseCritChance = AddTextOption("Свой шанс крита: ", Game.GetPlayer().GetBaseAV("CritChance"))
		SetCursorPosition(55)
		playerThingsCritChance = AddTextOption("Вещи: ", Game.GetPlayer().GetAV("CritChance") - Game.GetPlayer().GetBaseAV("CritChance"))
		SetCursorPosition(56)
		playerCritChance = AddTextOption("Текущий шанс крита: ", Game.GetPlayer().GetAV("CritChance"))
		SetCursorPosition(58)
		AddHeaderOption(" ")
		SetCursorPosition(59)
		AddHeaderOption(" ")



		SetCursorPosition(60)
		countDrop = AddTextOption("Бросков в Чашу: ", iCountDrop.GetValueInt())
		SetCursorPosition(62)
		AddHeaderOption(" ")
		SetCursorPosition(63)
		AddHeaderOption(" ")
		; Add page 1 options

	elseIf (page == "Репутации")			;Или если открыта страница с Репутациями, то выводим информацию о текущем уровне репутации Игрока
		; Add page 2 options
		countRepHunt = AddTextOption("Репутация Охотников на Чудовищь: ", iCountRepHunting.GetValueInt())

	endIf
endEvent

event OnOptionSelect(int option)
	if (CurrentPage == "Характеристики")
		
		
	elseIf (CurrentPage == "Репутации")
		
		
	endIf
endEvent

event OnOptionDefault(int option)
    
endEvent

event OnOptionHighlight(int option)

endEvent 
