Set sh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
dir = fso.GetParentFolderName(WScript.ScriptFullName)

html = ""
If fso.FileExists(dir & "\app\index.html") Then html = dir & "\app\index.html"
If fso.FileExists(dir & "\index.html") Then html = dir & "\index.html"
If fso.FileExists(dir & "\..\index.html") Then html = fso.GetAbsolutePathName(dir & "\..\index.html")

If html = "" Then
  MsgBox "index.html not found", 16, "DayZ Mod Builder"
  WScript.Quit 1
End If

uri = "file:///" & Replace(html, "\", "/")
edge86 = sh.ExpandEnvironmentStrings("%ProgramFiles(x86)%") & "\Microsoft\Edge\Application\msedge.exe"
edge64 = sh.ExpandEnvironmentStrings("%ProgramFiles%") & "\Microsoft\Edge\Application\msedge.exe"
chrome = sh.ExpandEnvironmentStrings("%ProgramFiles%") & "\Google\Chrome\Application\chrome.exe"
chromeLA = sh.ExpandEnvironmentStrings("%LocalAppData%") & "\Google\Chrome\Application\chrome.exe"

If fso.FileExists(edge86) Then
  sh.Run """" & edge86 & """ --app="""" & uri & """"", 1, False
ElseIf fso.FileExists(edge64) Then
  sh.Run """" & edge64 & """ --app="""" & uri & """"", 1, False
ElseIf fso.FileExists(chrome) Then
  sh.Run """" & chrome & """ --app="""" & uri & """"", 1, False
ElseIf fso.FileExists(chromeLA) Then
  sh.Run """" & chromeLA & """ --app="""" & uri & """"", 1, False
Else
  sh.Run """" & html & """", 1, False
End If
