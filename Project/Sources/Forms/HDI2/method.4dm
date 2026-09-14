var $foreground; $n : Integer
var $json : Collection

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (Get menu bar reference:C979="")
			SET MENU BAR:C67(1)
		End if 
		
		If (ds:C1482.SAMPLES.getCount()=0)
			
			$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("SAMPLES.json").getText(); Is collection:K8:32)
			ds:C1482.SAMPLES.fromCollection($json)
			
		End if 
		
		DISABLE MENU ITEM:C150(Get menu bar reference:C979; 1; Current process:C322)
		
		//************************   interface color settings ***********
		
		ARRAY LONGINT:C221(_UI_ListboxLight; 3)
		ARRAY LONGINT:C221(_UI_ListboxDark; 3)
		ARRAY LONGINT:C221(_UI_ListboxDisabled; 3)
		
		ARRAY LONGINT:C221(_UI_ValueLight; 2)
		ARRAY LONGINT:C221(_UI_ValueDark; 2)
		
		ARRAY LONGINT:C221(_UI_CategoryLight; 5)
		ARRAY LONGINT:C221(_UI_CategoryDark; 5)
		ARRAY LONGINT:C221(_UI_CategoryDisabled; 5)
		
		
		OBJECT GET RGB COLORS:C1074(*; "BgndMain1"; $foreground; _UI_ListboxLight{1})
		OBJECT GET RGB COLORS:C1074(*; "BgndMain2"; $foreground; _UI_ListboxLight{2})
		
		OBJECT GET RGB COLORS:C1074(*; "BgndMainH1"; $foreground; _UI_ListboxDark{1})
		OBJECT GET RGB COLORS:C1074(*; "BgndMainH2"; $foreground; _UI_ListboxDark{2})
		
		OBJECT GET RGB COLORS:C1074(*; "BgndMainD1"; $foreground; _UI_ListboxDisabled{1})
		OBJECT GET RGB COLORS:C1074(*; "BgndMainD2"; $foreground; _UI_ListboxDisabled{2})
		
		
		OBJECT GET RGB COLORS:C1074(*; "BgndA1"; $foreground; _UI_ValueLight{1})
		OBJECT GET RGB COLORS:C1074(*; "BgndA2"; $foreground; _UI_ValueLight{2})
		OBJECT GET RGB COLORS:C1074(*; "BgndAh1"; $foreground; _UI_ValueDark{1})
		OBJECT GET RGB COLORS:C1074(*; "BgndAh2"; $foreground; _UI_ValueDark{2})
		
		
		OBJECT GET RGB COLORS:C1074(*; "BgndB1"; $foreground; _UI_CategoryLight{1})
		OBJECT GET RGB COLORS:C1074(*; "BgndB2"; $foreground; _UI_CategoryLight{2})
		OBJECT GET RGB COLORS:C1074(*; "BgndB3"; $foreground; _UI_CategoryLight{3})
		OBJECT GET RGB COLORS:C1074(*; "BgndB4"; $foreground; _UI_CategoryLight{4})
		OBJECT GET RGB COLORS:C1074(*; "BgndB5"; $foreground; _UI_CategoryLight{5})
		
		OBJECT GET RGB COLORS:C1074(*; "BgndBh1"; $foreground; _UI_CategoryDark{1})
		OBJECT GET RGB COLORS:C1074(*; "BgndBh2"; $foreground; _UI_CategoryDark{2})
		OBJECT GET RGB COLORS:C1074(*; "BgndBh3"; $foreground; _UI_CategoryDark{3})
		OBJECT GET RGB COLORS:C1074(*; "BgndBh4"; $foreground; _UI_CategoryDark{4})
		OBJECT GET RGB COLORS:C1074(*; "BgndBh5"; $foreground; _UI_CategoryDark{5})
		
		OBJECT GET RGB COLORS:C1074(*; "BgndBd1"; $foreground; _UI_CategoryDisabled{1})
		OBJECT GET RGB COLORS:C1074(*; "BgndBd2"; $foreground; _UI_CategoryDisabled{2})
		OBJECT GET RGB COLORS:C1074(*; "BgndBd3"; $foreground; _UI_CategoryDisabled{3})
		OBJECT GET RGB COLORS:C1074(*; "BgndBd4"; $foreground; _UI_CategoryDisabled{4})
		OBJECT GET RGB COLORS:C1074(*; "BgndBd5"; $foreground; _UI_CategoryDisabled{5})
		
		
		//****************************   MANAGE LISTBOX CONTENTS   **************************
		
		
		ALL RECORDS:C47([SAMPLES:3])
		ORDER BY:C49([SAMPLES:3]; [SAMPLES:3]Category:3; >)
		
		ARRAY TEXT:C222(_Category; 0)
		ARRAY TEXT:C222(_Reference; 0)
		ARRAY LONGINT:C221(_ID; 0)
		ARRAY LONGINT:C221(_Value; 0)
		
		SELECTION TO ARRAY:C260([SAMPLES:3]Category:3; _Category; [SAMPLES:3]ID:1; _ID; [SAMPLES:3]Reference:2; _Reference; [SAMPLES:3]Value:4; _Value)
		
		$n:=Size of array:C274(_Category)
		ARRAY BOOLEAN:C223(LB_Arrays; 0)
		ARRAY BOOLEAN:C223(LB_Arrays; $n)
		
		listboxSelectionHasFocus:=False:C215
		listboxArrayHasFocus:=False:C215
		
		isFrontmostWindow:=True:C214
		
	: (Form event code:C388=On Page Change:K2:54)
		
		Case of 
			: (FORM Get current page:C276=3)
				UI_FillArrays
				
			: (FORM Get current page:C276=5)
				
				Demo_FillColorArrays
				OBJECT SET RGB COLORS:C628(_category; lk inherited:K53:26; lk inherited:K53:26; lk inherited:K53:26)
				
			: (FORM Get current page:C276=6)
				
				Demo_FillColorArrays
				OBJECT SET RGB COLORS:C628(_category; 0x0000; 0x00FFFFF0)
				
		End case 
		
		
	: (Form event code:C388=On Activate:K2:9)
		isFrontmostWindow:=True:C214
		If (FORM Get current page:C276>=5)
			Demo_FillColorArrays
		End if 
		
	: (Form event code:C388=On Deactivate:K2:10)
		isFrontmostWindow:=False:C215
		
		If (FORM Get current page:C276>=5)
			Demo_FillColorArrays
		End if 
		
	: (Form event code:C388=On Unload:K2:2)
		
		ENABLE MENU ITEM:C149(Get menu bar reference:C979; 1; Current process:C322)
		
End case 


