Global $DTZ_HST = "HST"
Global $DTZ_AKST = "AKST"
Global $DTZ_PST = "PST"
Global $DTZ_MST = "MST"
Global $DTZ_AZ = "AZ"
Global $DTZ_CST = "CST"
Global $DTZ_EST = "EST"

Func _DTAdjust($dDateTime, $DTZ)
	Local $Offset = 0
	Switch($DTZ)
		Case $DTZ_HST
			$Offset = -10
		Case $DTZ_AKST
			If IsDST() Then $Offset = -8
			Else $Offset = -9
		Case $DTZ_PST
			If IsDST() Then $Offset = -7
			Else $Offset = -8
		Case $DTZ_AZ
			$Offset = -7
		Case $DTZ_MST
			If IsDST() Then $Offset = -6
			Else $Offset = -7
		Case $DTZ_CST
			If IsDST() Then $Offset = -5
			Else $Offset = -6
		Case $DTZ_EST
			If IsDST() Then $Offset = -4
			Else $Offset = -5
	EndSwitch

	Return $Offset
EndFunc

Func IsDST($datetime)
	;~ Most of the United States begins Daylight Saving Time at 2:00 a.m. on the
	;~ second Sunday in March and reverts to standard time on the first Sunday in
	;~ November. In the U.S., each time zone switches at a different time.

	;~ TODO: handle datetime
	;~ TODO: parameterize datetime
	$MON = @MON
	$MDAY = @MDAY
	$WDAY = @WDAY

	;~ bypass checks for most dates
	If $MON < 3 Or $MON > 11 Then Return False
	If $MON > 3 And $MON < 11 Then Return True
	;~ Shortest case
	;~  1  2  3  4  5  6  7
	;~  8  _  _  _  _  _  _
	If $MON = 3 And $MDAY < 8 Then Return False;
	;~ Longest case
	;~  _  1  2  3  4  5  6
	;~  7  8  9 10 11 12 13
	;~ 14  _  _  _  _  _  _
	If $MON = 3 And $MDAY > 14 Then Return True;
	;~ Shortest case
	;~  1  _  _  _  _  _  _
	;~  _  _  _  _  _  _  _
	;~ Longest case
	;~  _  1  2  3  4  5  6
	;~  7  _  _  _  _  _  _
	If $MON = 11 And $MDAY > 7 Then Return False;

	;~ If we're in March
	If $MON = 3 Then
		;~ some light math seasoning
		;~ 1 = 7, 2 = 6, 3 = 5, 4 = 4, 5 = 3, 6 = 2, 7 = 1
		Local $DAYS_TILL = 8 - $WDAY

		;~ get next Sunday
		Local $NEXT_SUNDAY = $MDAY + $DAYS_TILL

		;~ if next Sunday is past the 14th we're already past the 2nd Sunday
		If $NEXT_SUNDAY > 14 Then Return True
		;~ otherwise DST hasn't started yet
		Else Return False
		EndIf
	;~ if we're in November
	Else
		;~ some light math seasoning
		;~ 1 = 0, 2 = 1, 3 = 2, 4 = 3, 5 = 4, 6 = 5, 7 = 6
		Local $DAYS_FROM = $WDAY - 1

		;~ get last Sunday
		Local $LAST_SUNDAY = $MDAY - $DAYS_FROM

		;~ if last Sunday is within this month, DST is already over
		If $LAST_SUNDAY > 0 Then Return False
		;~ otherwise DST hasn't reverted yet.
		Else Return True
		EndIf
	Endif
EndFunc
