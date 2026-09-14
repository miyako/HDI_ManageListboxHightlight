var $i; $n : Integer

CREATE EMPTY SET:C140([SAMPLES:3]; "$hightlightSet")
If (Not:C34(Shift down:C543))
	
	$n:=Records in selection:C76([SAMPLES:3])
	For ($i; 1; $n)
		GOTO SELECTED RECORD:C245([SAMPLES:3]; $i)
		If (Random:C100>25000)
			ADD TO SET:C119([SAMPLES:3]; "$hightlightSet")
		End if 
	End for 
	
End if 

