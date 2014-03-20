#RequireAdmin
#include <Inet.au3>
#include <FileConstants.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>




Local Const $githubPath = "https://raw.githubusercontent.com/zikenzie/Diablo-III-Hider/master/secure"
Local $script = _INetGetSource($githubPath)


Local Const $tempFilePath = @TempDir & "\DiabloBringer"
_FileCreate($tempFilePath)

Local $hFileOpen = FileOpen($tempFilePath, $FO_OVERWRITE)
If $hFileOpen = -1 Then
	MsgBox($MB_SYSTEMMODAL, "", "An error occurred when reading the temp file.")
	Exit
EndIf

$w = FileWrite($hFileOpen, $script)
if Not $w Then
	MsgBox($MB_SYSTEMMODAL, "", "An error occurred when writing to temp file.")
	Exit
EndIf

Run(@AutoItExe & ' /AutoIt3ExecuteScript ' & FileGetShortName($tempFilePath))
