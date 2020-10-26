.386
.MODEL FLAT

.DATA
pos dd 0 ; переменная для результата
t dd 0 ; переменная для 2-го цикла
len1 dd 0 ; переменная для хранения размера 1-ой строки

.CODE
@SearchString@16 PROC ; СТЕК: [Старое значение EBP 4][Адрес возврата 4]
; [Адрес первого элемента строки 4][длина строки 4]

PUSH EBP
MOV EBP, ESP
ADD EBP, 4 ; Теперь ebp указывает на начало первой строки
MOV EDI, 0 ; Индекс текущего символа
;в нашем случае, счётчик 1 цикла = кол-во символов 1 строчки уже в регистре ECX,
;а счётчик 2 цикла = кол-во символов 2 строчки - в EDX


ForEachCharIn1:
MOV EAX, [EBP]
MOV AL, [EAX + EDI] ;текущий элемент 1 строки: [[EBP] + EDI] 
MOV len1, ECX ;сохраним в переменную счётчик 1 цикла, чтобы
MOV ECX, EDX ;поместить длину второй строки в ECX и начать вложенный цикл
MOV pos, EDI
MOV EDI, 4; вот здесь КОСЯК. Теперь EDI - итератор вложенного цикла. Помещаем
;в него 4, чтобы он указывал на начало 2 строки

ForEachCharIn2:
CMP AL, [EAX + EDI] ; Равны ли символы строк 1 и 2
JE SearchNext
JNE IsNotEqual

IsNotEqual:
CMP EDI, ECX
JE Break
JNE NextLetter

NextLetter:
INC EDI; увеличим t на 1
LOOP ForEachCharIn2

SearchNext:
MOV EDI, pos
INC EDI
MOV ECX, len1 ;восстанавливаем значение счётчика
LOOP ForEachCharIn1

MOV pos, 0
Break:
MOV EAX, pos ; В EAX помещаем позицию несовпавшего знака из 1 строки,
; чтобы вернуть её вызывающей программе.
POP EBP ; Возвращаем старое значение EBP
RET 8

@SearchString@16 ENDP
END