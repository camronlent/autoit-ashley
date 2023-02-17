#AutoIt3Wrapper_icon=resources\Ashley.ico
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <SendMessage.au3>
#include <GDIPlus.au3>
#include <ButtonConstants.au3>

Global Const $SC_DRAGMOVE = 0xF012

_GDIPlus_Startup()
Global $AshleyGrpahic = _GDIPlus_ImageLoadFromFile("resources\AshleyBG.png")
Global $Graphic

Main()

Func Main()
	Local $style = $WS_POPUPWINDOW
	Local $styleEx = $WS_EX_TOPMOST
	Local $hGUI = GUICreate("Ashley", 300, 100, -1, -1, $style, $styleEx)
	Local $idOK = GUICtrlCreateButton("OK", 112, 34, 76, 32, $BS_FLAT)

	;~ Initialize graphics
	$Graphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	GUIRegisterMsg($WM_PAINT, 'Paint')
	GUIRegisterMsg($WM_DRAWITEM, 'Paint')

	GUISetState(@SW_SHOW, $hGUI)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idOK
				Quit()
			Case $GUI_EVENT_PRIMARYDOWN
				_SendMessage($hGUI, $WM_SYSCOMMAND, $SC_DRAGMOVE, 0)
		EndSwitch
	WEnd

	GUIDelete($hGUI)
EndFunc

Func Quit()
	_GDIPlus_ImageDispose($AshleyGrpahic)
	_GDIPlus_GraphicsDispose($Graphic)
	_GDIPlus_Shutdown()
	Exit
EndFunc

Func Paint()
	_GDIPlus_GraphicsDrawImageRect($Graphic, $AshleyGrpahic, 0, 0, 300, 100)
EndFunc