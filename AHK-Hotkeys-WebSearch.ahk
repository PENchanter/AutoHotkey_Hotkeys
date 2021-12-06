; perform a web search of AutoHotkey.com for highlighted word on screen
^!+a:: 								; send URL to AutoHotKey.com using - CTRL+ALT+SHIFT+A
	OldClipboard := ClipboardAll
	Clipboard := ""
	SendInput, ^c ; copies selected text
	ClipWait 2
	If ErrorLevel
		{
			MsgBox, No Text Selected!
			Return
		}
	Run, https://www.autohotkey.com/search/?q=%Clipboard%
;	Run, https://autohotkey.com/docs/%Clipboard%
	Clipboard := OldClipboard
Return

#IfWinExist, ahk_class Chrome
^!+g:: 								; send URL to Google.com using - CTRL+ALT+SHIFT+G
	OldClipboard	:= ClipboardAll
	Clipboard	:= ""
	SendInput, ^c ; copy selected text
	ClipWait 2
	Run, https://www.google.com/search?hidden=&GoogleSearch=Search&as_qdr=all&complete=0&hl=en&newwindow=1&pws=0&safe=off&q=%Clipboard%
	Clipboard := OldClipboard
	If ErrorLevel
		{
			MsgBox, No Text Selected!
			Return
		}
Return
#IfWinExist															; terminate the 'IfWinExist' definition above!

#IfWinExist, ahk_class Chrome
^!+f:: 								; send URL to PrintFriendly.com using - CTRL+ALT+SHIFT+F
	OldClipboard	:= ClipboardAll
	Clipboard	:= ""
	SendInput, ^l ; select web browser 'address' field
	SendInput, ^a ; highlight all its contents
	SendInput, ^c ; copy selected contents to Clipboard
	ClipWait 2
	Run, http://www.printfriendly.com/print?url=%Clipboard%
	Clipboard := OldClipboard
	If ErrorLevel
		{
			MsgBox, No Text Selected!
			Return
		}
Return
#IfWinExist															; terminate the 'IfWinExist' definition above!
