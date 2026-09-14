//%attributes = {"invisible":true}
C_LONGINT:C283($i)

ARRAY TEXT:C222($_Categoties; 0)
APPEND TO ARRAY:C911($_Categoties; "Alpha")
APPEND TO ARRAY:C911($_Categoties; "Bravo")
APPEND TO ARRAY:C911($_Categoties; "Charlie")
APPEND TO ARRAY:C911($_Categoties; "Delta")
APPEND TO ARRAY:C911($_Categoties; "Echo")

ALL RECORDS:C47([SAMPLES:3])
DELETE SELECTION:C66([SAMPLES:3])

For ($i; 1; 15)
	
	CREATE RECORD:C68([SAMPLES:3])
	[SAMPLES:3]Category:3:=$_Categoties{1+($i%5)}
	[SAMPLES:3]Value:4:=Random:C100-Random:C100
	SAVE RECORD:C53([SAMPLES:3])
	
End for 


