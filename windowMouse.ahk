/* left resize */
+MButton UP:: {
    ; アクティブウィンドウの位置とサイズを取得
    x := 0
    y := 0
    width := 0
    height := 0

    WinGetPos &x, &y, &width, &height, "A"  ; "A" は現在アクティブなウィンドウを指定
    if (x = 0 and y = 0) {
        return
    }
    

    if WinActive("ahk_exe devenv.exe") { ; devenv.exeはvisual studio
        Send("{Alt Down}{Space}{Alt Up}") ; Alt + Space を送信
        Sleep(100)
        Send("s")
        Sleep(100)
        Send("{Up}")
        Sleep(10)
        Send("{Left}")
    } else {
        offsetX := 0
        offsetY := 0

        if WinActive("ahk_exe chrome.exe")
            offsetX := -3
        else if WinActive("ahk_exe explorer.exe")
            offsetX := -5
            offsetY := 3

        MouseMove(offsetX, offsetY)
        Click("Down")
    }
}

/* right resize*/
MButton UP:: {
    ; アクティブウィンドウの位置とサイズを取得
    x := 0
    y := 0
    width := 0
    height := 0

    WinGetPos &x, &y, &width, &height, "A"  ; "A" は現在アクティブなウィンドウを指定
    if (x = 0 and y = 0) {
        return
    }


    offsetX := 0
    offsetY := 0

    if WinActive("ahk_exe Code.exe") {
        offsetX := 10
        offsetY := 5
    } else if WinActive("ahk_exe chrome.exe") {
        ; offsetY := 2
    } else if WinActive("ahk_exe insomnia-11.1.0.exe") {
        ; offsetY := -30
    } else if WinActive("ahk_exe MySQLWorkbench.exe") {
        offsetY := -30
    } else if WinActive("ahk_exe Slack.exe") {
        offsetX := 7
        offsetY := 5
    } else if WinActive("ahk_exe Evernote.exe") {
        offsetX := -5
        offsetY := -33
    }
    
    MouseMove(width - 15 + offsetX, height - 6 + offsetY)
    ; Click("Down")
}

/* top move */
^!+F12 UP:: {
    ; アクティブウィンドウの位置とサイズを取得
    x := 0
    y := 0
    width := 0
    height := 0

    WinGetPos &x, &y, &width, &height, "A"  ; "A" は現在アクティブなウィンドウを指定
    if (x = 0 and y = 0) {
        return
    }

    MouseMove(width/2.0, 15)
    
    /*
    Click("Down")
    Send("{Alt Down}{Space}{Alt Up}") ; Alt + Space を送信
    Sleep(100)
    Send("m")
    Send("{Right}")
    */
}
