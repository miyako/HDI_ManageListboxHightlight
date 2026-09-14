var $i; $n : Integer

$n:=Size of array:C274(_Category)

ARRAY BOOLEAN:C223(LB_Arrays; 0)
ARRAY BOOLEAN:C223(LB_Arrays; $n)

If (Not:C34(Shift down:C543))
	
	For ($i; 1; $n)
		
		If (Random:C100>20000)
			LB_Arrays{$i}:=True:C214
		End if 
	End for 
	
End if 

Demo_FillColorArrays