/* アクティブウィンドウが存在するモニターの作業領域を取得 */
GetActiveMonitorWorkArea(&left, &top, &right, &bottom) {
    WinGetPos(&wx, &wy, &ww, &wh, "A")
    targetMonitor := MonitorGetPrimary()
    Loop MonitorGetCount() {
        MonitorGetWorkArea(A_Index, &l, &t, &r, &b)
        if (wx >= l && wx < r && wy >= t && wy < b) {
            targetMonitor := A_Index
            break
        }
    }
    MonitorGetWorkArea(targetMonitor, &left, &top, &right, &bottom)
}

/* 指定した四分の1の領域にウィンドウをリサイズ・移動するヘルパー関数 */
MoveToQuarter(qx, qy) {
    GetActiveMonitorWorkArea(&left, &top, &right, &bottom)
    halfW := (right - left) // 2
    halfH := (bottom - top) // 2
    WinMove(left + qx * halfW, top + qy * halfH, halfW, halfH, "A")
}

/* LShift+LAlt+I: 左上 */
<+<!i:: MoveToQuarter(0, 0)

/* LShift+LAlt+J: 左下 */
<+<!j:: MoveToQuarter(0, 1)

/* LShift+LAlt+O: 右上 */
<+<!o:: MoveToQuarter(1, 0)

/* LShift+LAlt+K: 右下 */
<+<!k:: MoveToQuarter(1, 1)

/* LShift+LAlt+L: 画面の1/2サイズで中央 */
<+<!l:: {
    GetActiveMonitorWorkArea(&left, &top, &right, &bottom)
    halfW := (right - left) // 2
    halfH := (bottom - top) // 2
    WinMove(left + halfW // 2, top + halfH // 2, halfW, halfH, "A")
}

/* LShift+LAlt+LWin+J: 左半分 */
<+<!<#j:: {
    GetActiveMonitorWorkArea(&left, &top, &right, &bottom)
    WinMove(left, top, (right - left) // 2, bottom - top, "A")
}

/* LShift+LAlt+LWin+O: 右半分 */
<+<!<#o:: {
    GetActiveMonitorWorkArea(&left, &top, &right, &bottom)
    halfW := (right - left) // 2
    WinMove(left + halfW, top, halfW, bottom - top, "A")
}

/* LShift+LAlt+LWin+I: 上半分 */
<+<!<#i:: {
    GetActiveMonitorWorkArea(&left, &top, &right, &bottom)
    WinMove(left, top, right - left, (bottom - top) // 2, "A")
}

/* LShift+LAlt+LWin+K: 下半分 */
<+<!<#k:: {
    GetActiveMonitorWorkArea(&left, &top, &right, &bottom)
    halfH := (bottom - top) // 2
    WinMove(left, top + halfH, right - left, halfH, "A")
}

/* LShift+LAlt+<: 上下左右に少しずつ広げる */
<+<!vkBC:: {
    step := 20
    WinGetPos(&wx, &wy, &ww, &wh, "A")
    WinMove(wx - step, wy - step, ww + step * 2, wh + step * 2, "A")
}

/* LShift+LAlt+>: 上下左右に少しずつ縮める */
<+<!vkBE:: {
    step := 20
    WinGetPos(&wx, &wy, &ww, &wh, "A")
    WinMove(wx + step, wy + step, ww - step * 2, wh - step * 2, "A")
}

/* LShift+LAlt+P: 全画面（作業領域いっぱい） */
<+<!p:: {
    GetActiveMonitorWorkArea(&left, &top, &right, &bottom)
    WinMove(left, top, right - left, bottom - top, "A")
}
