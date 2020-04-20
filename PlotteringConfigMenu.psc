Scriptname PlotteringConfigMenu extends SKI_ConfigBase  ;���������� SkyUI

GlobalVariable Property iCountRepHunting  Auto  ;���������� ����������. ���-�� ��������� ��������� �� ������� � ���������� ������� � ����
GlobalVariable Property iCountDrop  Auto  

Actor Property Player  Auto  

; SCRIPT VERSION
int function GetVersion()	;������� ���������� ������ API
	return 4
endFunction

event OnVersionUpdate(int a_version)
	if (a_version > 1)
		Debug.Trace(self + ": Updating script to version " + a_version)
		OnConfigInit()
	endIf
endEvent

event OnConfigInit()	;�������� � ����������������
	Pages = new string[2]
	Pages[0] = "��������������"
	Pages[1] = "���������"

endEvent

;������ ����������, ��� �������� ������

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
	if (page == "��������������")			;���� ������� �������� "��������������", �� ������� ���� ����������
		SetCursorPosition(0) ;��������� ������� �� �������, ��� ���������� ������� ����������
		playerBaseHealth = AddTextOption("���� ������� �����: ", Game.GetPlayer().GetBaseAV("Health"))	;������� ����� � �������� ������� ������� ����� ���������
		SetCursorPosition(1)		;������ ������ �� ������ �������
		playerThingsHealth = AddTextOption("����: ", Game.GetPlayer().GetAV("Health") - Game.GetPlayer().GetBaseAV("Health"))	;�������� ������� �����, ������� ���� ����, ����� � �.�. 
																																	;��� �����, �� �������� ���������� ��������� ������� �����
																																	;� �������� �������.
		SetCursorPosition(2)				;����� ��������� ������ �� ������ �������
		playerHealth = AddTextOption("������� ������� �����: ", Game.GetPlayer().GetAV("Health"))	;�������� ������������ ������� �����
		SetCursorPosition(4)
		AddHeaderOption(" ")			;��������� �����������, ���� �� �� ������
		SetCursorPosition(5)
		AddHeaderOption(" ")


		SetCursorPosition(6)
		playerBaseStamina = AddTextOption("���� ������� �������: ", Game.GetPlayer().GetBaseAV("Stamina"))
		SetCursorPosition(7)
		playerThingsStamina = AddTextOption("����: ", Game.GetPlayer().GetAV("Stamina") - Game.GetPlayer().GetBaseAV("Stamina"))
		SetCursorPosition(8)
		playerStamina = AddTextOption("������� ������� �������: ", Game.GetPlayer().GetAV("Stamina"))
		SetCursorPosition(10)
		AddHeaderOption(" ")
		SetCursorPosition(11)
		AddHeaderOption(" ")


		SetCursorPosition(12)
		playerBaseMagic = AddTextOption("���� ������� �����: ", Game.GetPlayer().GetBaseAV("Magicka"))
		SetCursorPosition(13)
		playerThingsMagic = AddTextOption("����: ", Game.GetPlayer().GetAV("Magicka") - Game.GetPlayer().GetBaseAV("Magicka"))
		SetCursorPosition(14)
		playerMagic = AddTextOption("������� ������� �����: ", Game.GetPlayer().GetAV("Magicka"))
		SetCursorPosition(16)
		AddHeaderOption(" ")
		SetCursorPosition(17)
		AddHeaderOption(" ")

		

		SetCursorPosition(18)
		playerBaseRegenHealth = AddTextOption("���� ����� �����: ", Game.GetPlayer().GetBaseAV("HealRateMult"))
		SetCursorPosition(19)
		playerThingsRegenHealth = AddTextOption("����: ", Game.GetPlayer().GetAV("HealRateMult") - Game.GetPlayer().GetBaseAV("HealRateMult"))
		SetCursorPosition(20)
		playerRegenHealth = AddTextOption("������� ����� �����: ", Game.GetPlayer().GetAV("HealRateMult"))
		SetCursorPosition(22)
		AddHeaderOption(" ")
		SetCursorPosition(23)
		AddHeaderOption(" ")

		SetCursorPosition(24)
		playerBaseRegenStamina = AddTextOption("���� ����� �������: ", Game.GetPlayer().GetBaseAV("StaminaRateMult"))
		SetCursorPosition(25)
		playerThingsRegenStamina = AddTextOption("����: ", Game.GetPlayer().GetAV("StaminaRateMult") - Game.GetPlayer().GetBaseAV("StaminaRateMult"))
		SetCursorPosition(26)
		playerRegenStamina = AddTextOption("������� ����� �������: ", Game.GetPlayer().GetAV("StaminaRateMult"))
		SetCursorPosition(28)
		AddHeaderOption(" ")
		SetCursorPosition(29)
		AddHeaderOption(" ")

		SetCursorPosition(30)
		playerBaseRegenMagic = AddTextOption("���� ����� �����: ", Game.GetPlayer().GetBaseAV("MagickaRateMult"))
		SetCursorPosition(31)
		playerThingsRegenMagic = AddTextOption("����: ", Game.GetPlayer().GetAV("MagickaRateMult") - Game.GetPlayer().GetBaseAV("MagickaRateMult"))
		SetCursorPosition(32)
		playerRegenMagic = AddTextOption("������� ����� �����: ", Game.GetPlayer().GetAV("MagickaRateMult"))
		SetCursorPosition(34)
		AddHeaderOption(" ")
		SetCursorPosition(35)
		AddHeaderOption(" ")



		SetCursorPosition(36)
		playerBaseMagicResist = AddTextOption("��� ������������� �����: ", Game.GetPlayer().GetBaseAV("MagicResist"))
		SetCursorPosition(37)
		playerThingsMagicResist = AddTextOption("����: ", Game.GetPlayer().GetAV("MagicResist") - Game.GetPlayer().GetBaseAV("MagicResist"))
		SetCursorPosition(38)
		playerMagicResist = AddTextOption("������� ������������� �����: ", Game.GetPlayer().GetAV("MagicResist"))
		SetCursorPosition(40)
		AddHeaderOption(" ")
		SetCursorPosition(41)
		AddHeaderOption(" ")

		SetCursorPosition(42)
		playerBaseDamageResist = AddTextOption("��� ������������� ���.�����: ", Game.GetPlayer().GetBaseAV("DamageResist"))
		SetCursorPosition(43)
		playerThingsDamageResist = AddTextOption("����: ", Game.GetPlayer().GetAV("DamageResist") - Game.GetPlayer().GetBaseAV("DamageResist"))
		SetCursorPosition(44)
		playerDamageResist = AddTextOption("������� ������������� ���.�����: ", Game.GetPlayer().GetAV("DamageResist"))
		SetCursorPosition(46)
		AddHeaderOption(" ")
		SetCursorPosition(47)
		AddHeaderOption(" ")



		SetCursorPosition(48)
		playerBaseCarryWeight = AddTextOption("���� ������������ ���: ", Game.GetPlayer().GetBaseAV("CarryWeight"))
		SetCursorPosition(49)
		playerThingsCarryWeight = AddTextOption("����: ", Game.GetPlayer().GetAV("CarryWeight") - Game.GetPlayer().GetBaseAV("CarryWeight"))
		SetCursorPosition(50)
		playerCarryWeight = AddTextOption("������� ������������ ���: ", Game.GetPlayer().GetAV("CarryWeight"))
		SetCursorPosition(52)
		AddHeaderOption(" ")
		SetCursorPosition(53)
		AddHeaderOption(" ")



		
		SetCursorPosition(54)
		playerBaseCritChance = AddTextOption("���� ���� �����: ", Game.GetPlayer().GetBaseAV("CritChance"))
		SetCursorPosition(55)
		playerThingsCritChance = AddTextOption("����: ", Game.GetPlayer().GetAV("CritChance") - Game.GetPlayer().GetBaseAV("CritChance"))
		SetCursorPosition(56)
		playerCritChance = AddTextOption("������� ���� �����: ", Game.GetPlayer().GetAV("CritChance"))
		SetCursorPosition(58)
		AddHeaderOption(" ")
		SetCursorPosition(59)
		AddHeaderOption(" ")



		SetCursorPosition(60)
		countDrop = AddTextOption("������� � ����: ", iCountDrop.GetValueInt())
		SetCursorPosition(62)
		AddHeaderOption(" ")
		SetCursorPosition(63)
		AddHeaderOption(" ")
		; Add page 1 options

	elseIf (page == "���������")			;��� ���� ������� �������� � �����������, �� ������� ���������� � ������� ������ ��������� ������
		; Add page 2 options
		countRepHunt = AddTextOption("��������� ��������� �� ��������: ", iCountRepHunting.GetValueInt())

	endIf
endEvent

event OnOptionSelect(int option)
	if (CurrentPage == "��������������")
		
		
	elseIf (CurrentPage == "���������")
		
		
	endIf
endEvent

event OnOptionDefault(int option)
    
endEvent

event OnOptionHighlight(int option)

endEvent 
