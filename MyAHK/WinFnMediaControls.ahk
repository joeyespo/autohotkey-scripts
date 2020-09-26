; By Joe Esposito
; Turns Win+F1 into a Mute media key, Win+F2 into a Volume Down media key,
; and Win+F3 into a volume up media key.

#F1::SendInput {Volume_Mute}
#F2::SendInput {Volume_Down}
#F3::SendInput {Volume_Up}
