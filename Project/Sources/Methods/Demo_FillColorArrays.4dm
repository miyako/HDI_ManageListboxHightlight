//%attributes = {"invisible":true}
C_LONGINT:C283($i; $n; $id)
C_BOOLEAN:C305($focus)

//isFrontmostWindow:=(Frontmost window=Current form window)
$focus:=(listboxArrayHasFocus & isFrontmostWindow)

$n:=Size of array:C274(_Category)
ARRAY LONGINT:C221(_ListboxFontColor; $n)
ARRAY LONGINT:C221(_ListboxBackground; $n)

ARRAY LONGINT:C221(_CategoryFontColor; $n)
ARRAY LONGINT:C221(_CategoryBackground; $n)

ARRAY LONGINT:C221(_ValueFontColor; $n)


For ($i; 1; $n)
	
	// row backgrounds and row font colors
	
	$id:=1+($i%2)  // odd or even row
	If (LB_Arrays{$i}=True:C214)  // selected
		_ListboxFontColor{$i}:=_UI_ListboxLight{$id}
		If ($focus)
			_ListboxBackground{$i}:=_UI_ListboxDark{$id}
		Else 
			_ListboxBackground{$i}:=_UI_ListboxDisabled{$id}
		End if 
	Else   // not selected
		_ListboxFontColor{$i}:=_UI_ListboxDark{$id}
		_ListboxBackground{$i}:=_UI_ListboxLight{$id}
	End if 
	
	// Category background and font color
	
	Case of 
		: (_Category{$i}="Alpha")
			$id:=1
		: (_Category{$i}="Bravo")
			$id:=2
		: (_Category{$i}="Charlie")
			$id:=3
		: (_Category{$i}="Delta")
			$id:=4
		: (_Category{$i}="Echo")
			$id:=5
	End case 
	
	If (LB_Arrays{$i}=True:C214)  // selected
		_CategoryFontColor{$i}:=_UI_CategoryLight{$id}
		If ($focus)
			_CategoryBackground{$i}:=_UI_CategoryDark{$id}
		Else 
			_CategoryBackground{$i}:=_UI_CategoryDisabled{$id}
		End if 
	Else   // not selected
		_CategoryBackground{$i}:=_UI_CategoryLight{$id}
		_CategoryFontColor{$i}:=_UI_CategoryDark{$id}
	End if 
	
	// font color for value
	
	$id:=Choose:C955(_Value{$i}<0; 1; 2)
	
	If (LB_Arrays{$i}=True:C214)  // selected
		_ValueFontColor{$i}:=_UI_ValueLight{$id}
	Else   // not selected
		_ValueFontColor{$i}:=_UI_ValueDark{$id}
	End if 
	
End for 
