INCLUDE Irvine32.inc


.data

msg1 BYTE "Le rest est ",0

msg2 BYTE "Le quotion est ",0

.data?
a DWORD ??

.code
main PROC

mov eax, 12345678h
mov ebx, 256
mul ebx
call dumpregs

 ; EAX=34567800 EDX=00000012

mov eax, 34567800h
mov edx, 00000012h
mov ebx, 256
div ebx
call crlf
call dumpregs
call crlf
mov a, edx
mov edx, OFFSET msg2
call WriteString

call WriteInt
call crlf
mov edx, OFFSET msg1
call WriteString
mov eax, a
call WriteInt



call ReadInt
exit
main ENDP
END main
