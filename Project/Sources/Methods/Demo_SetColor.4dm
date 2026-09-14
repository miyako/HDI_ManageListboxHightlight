//%attributes = {"invisible":true}
C_TEXT:C284($1)

C_TEXT:C284($ColName)
C_BOOLEAN:C305($focus)
C_LONGINT:C283($id; $color)

$ColName:=$1

//isFrontmostWindow:=(Frontmost window=Current form window)

$focus:=(listboxSelectionHasFocus & isFrontmostWindow)


Case of 
		
	: ($ColName="categoryBackground") | ($ColName="categoryFontColor")
		
		Case of 
			: ([SAMPLES:3]Category:3="Alpha")
				$id:=1
			: ([SAMPLES:3]Category:3="Bravo")
				$id:=2
			: ([SAMPLES:3]Category:3="Charlie")
				$id:=3
			: ([SAMPLES:3]Category:3="Delta")
				$id:=4
			: ([SAMPLES:3]Category:3="Echo")
				$id:=5
		End case 
		
		If ($ColName="categoryBackground")
			
			If (Is in set:C273("$hightlightSet"))
				
				If ($focus)
					$color:=_UI_CategoryDark{$id}
				Else 
					$color:=_UI_CategoryDisabled{$id}
				End if 
				
			Else 
				$color:=_UI_CategoryLight{$id}
			End if 
			
		Else   // font color
			
			If (Is in set:C273("$hightlightSet"))
				$color:=_UI_CategoryLight{$id}
			Else 
				$color:=_UI_CategoryDark{$id}
			End if 
			
		End if 
		
	: ($ColName="valueFontColor")
		
		Case of 
			: ([SAMPLES:3]Value:4<0)
				$id:=1
			: ([SAMPLES:3]Value:4>=0)
				$id:=2
		End case 
		
		If (Is in set:C273("$hightlightSet"))
			$color:=_UI_ValueLight{$id}
		Else 
			$color:=_UI_ValueDark{$id}
		End if 
		
		
	: ($ColName="ListboxBackground") | ($ColName="ListboxFontColor")
		
		$id:=1+(Selected record number:C246([SAMPLES:3])%2)
		
		If ($ColName="ListboxBackground")
			
			
			If (Is in set:C273("$hightlightSet"))
				If ($focus)
					$color:=_UI_ListboxDark{$id}
				Else 
					$color:=_UI_ListboxDisabled{$id}
				End if 
			Else 
				$color:=_UI_ListboxLight{$id}
			End if 
			
		Else 
			
			If (Is in set:C273("$hightlightSet"))
				$color:=_UI_ListboxLight{$id}
			Else 
				$color:=_UI_ListboxDark{$id}
			End if 
			
		End if 
		
		
		
End case 

$0:=$color