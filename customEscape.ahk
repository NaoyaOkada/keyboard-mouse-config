#Requires AutoHotkey v2.0
InstallKeybdHook() ; キーボード入力をより深く監視する

; --- モードリセット関数の定義 ---
VimReset() {
    ; 1. 未確定文字の消去（Esc 2回）
    Send("{Esc 2}")
    
    ; 2. 少し長めに待機（50ms）してIMEの切り替えを確実にする
    Sleep(50)
    
    ; 3.無変換（IME-OFF）を送信
    Send("{vk1D}")
}

; 左Ctrl + C (sc02e)
;<^sc02e::VimReset()

; 左Ctrl + ; (sc027) 
<^sc027::VimReset()

; 右Ctrl + : (sc028a)
;^[::VimReset()
; 左Ctrl + Q。矩形選択は右コントロールで対応する。
<^q::VimReset()
