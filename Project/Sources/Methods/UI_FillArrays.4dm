//%attributes = {"invisible":true}
var $i; $n : Integer

$n:=Size of array:C274(_Category)
ARRAY LONGINT:C221(_ListboxFontColor; $n)
ARRAY LONGINT:C221(_ListboxBackground; $n)
ARRAY LONGINT:C221(_ListboxStyle; $n)



For ($i; 1; $n)
	
	If (LB_Arrays{$i}=True:C214)  // selected
		
		_ListboxFontColor{$i}:=0x00FFFFFF  // white
		_ListboxBackground{$i}:=0x00505080  // blue grey
		_ListboxStyle{$i}:=Bold:K14:2+Italic:K14:3
		
	Else   // not selected
		
		_ListboxFontColor{$i}:=lk inherited:K53:26
		_ListboxBackground{$i}:=lk inherited:K53:26
		_ListboxStyle{$i}:=lk inherited:K53:26
		
	End if 
	
End for 
