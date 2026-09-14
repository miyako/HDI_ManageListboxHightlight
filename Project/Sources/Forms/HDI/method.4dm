var $vers : Text

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		If (Get menu bar reference:C979="")
			SET MENU BAR:C67(1)
		End if 
		
		DISABLE MENU ITEM:C150(Get menu bar reference:C979; 1; Current process:C322)
		
		$vers:=Application version:C493
		
		If ($vers<"1620")  //1530 means 13R3   1501 means 15.1
			
			Form.quit:=True
			OBJECT SET TITLE:C194(*; "BtnDemo"; Localized string:C991("BtnClose"))
			OBJECT SET VISIBLE:C603(*; "TxtSorry@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "TxtInfo@"; False:C215)
			
		Else 
			
			Form.quit:=False
			
		End if 
		
	: (Form event code:C388=On Unload:K2:2)
		
		ENABLE MENU ITEM:C149(Get menu bar reference:C979; 1; Current process:C322)
		
End case 
