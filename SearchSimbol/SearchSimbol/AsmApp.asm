.386
.MODEL FLAT

.DATA
pos dd 0 ; ���������� ��� ����������
t dd 0 ; ���������� ��� 2-�� �����
len1 dd 0 ; ���������� ��� �������� ������� 1-�� ������

.CODE
@SearchString@16 PROC ; ����: [������ �������� EBP 4][����� �������� 4]
; [����� ������� �������� ������ 4][����� ������ 4]

PUSH EBP
MOV EBP, ESP
ADD EBP, 4 ; ������ ebp ��������� �� ������ ������ ������
MOV EDI, 0 ; ������ �������� �������
;� ����� ������, ������� 1 ����� = ���-�� �������� 1 ������� ��� � �������� ECX,
;� ������� 2 ����� = ���-�� �������� 2 ������� - � EDX


ForEachCharIn1:
MOV EAX, [EBP]
MOV AL, [EAX + EDI] ;������� ������� 1 ������: [[EBP] + EDI] 
MOV len1, ECX ;�������� � ���������� ������� 1 �����, �����
MOV ECX, EDX ;��������� ����� ������ ������ � ECX � ������ ��������� ����
MOV pos, EDI
MOV EDI, 4; ��� ����� �����. ������ EDI - �������� ���������� �����. ��������
;� ���� 4, ����� �� �������� �� ������ 2 ������

ForEachCharIn2:
CMP AL, [EAX + EDI] ; ����� �� ������� ����� 1 � 2
JE SearchNext
JNE IsNotEqual

IsNotEqual:
CMP EDI, ECX
JE Break
JNE NextLetter

NextLetter:
INC EDI; �������� t �� 1
LOOP ForEachCharIn2

SearchNext:
MOV EDI, pos
INC EDI
MOV ECX, len1 ;��������������� �������� ��������
LOOP ForEachCharIn1

MOV pos, 0
Break:
MOV EAX, pos ; � EAX �������� ������� ������������ ����� �� 1 ������,
; ����� ������� � ���������� ���������.
POP EBP ; ���������� ������ �������� EBP
RET 8

@SearchString@16 ENDP
END