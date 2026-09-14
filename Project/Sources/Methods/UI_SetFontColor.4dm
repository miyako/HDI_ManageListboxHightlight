//%attributes = {"invisible":true}
C_LONGINT:C283($0)
C_LONGINT:C283($color)

If (Is in set:C273("$hightlightSet"))
	$color:=0x00FFFFFF  // white
Else 
	$color:=lk inherited:K53:26
End if 

$0:=$color
