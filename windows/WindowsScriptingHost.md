
Windows Scripting Host (WSH)


hello.vbs
```
Dim message 
message = "Welcome to THM"
MsgBox message
```
wscript hello.vbs



calc.vbs
```
Set shell = WScript.CreateObject("Wscript.Shell")
shell.Run("C:\Windows\System32\calc.exe " & WScript.ScriptFullName),0,True
```
wscript calc.vbs