%include "stud_io.inc" ;описание макросов1
global _start;делает метку глобальной "видимой извне объуктного модуля"
;точка входа в программу -- ОС передает управление после загрузки в ОП
section .text ; секция описания области памяти

;точка входа в программу)))
_start: mov eax, 0 ; метка в области памяти где хранится данная команда
; итоговая программа не содержит никаких меток а только подставленные вместо них адреса
again: PRINT "Hello"
		PUTCHAR 10
		inc eax ;++
		cmp eax, 5 ;compare
		;результат сравнения записывает в регистр флагов
		jl again ; jump if lower
		;условный переход на метку again
		FINISH

Регистры:
*EAX -- "extented" 32\16\8
-АХ -- accumulator арифметика
-BX -- base
-CX -- counter счетчик
-DX -- data особая роль при * / для хранения части результат
-SI -- source index -- ESI адрес тукущего элемента в массиве источнике
-DI -- destination index -- ESI  в массиве цели
-BP -- base pointer базовый адрес стекового фрейма
-SP -- указатель стека

Регистры Специального назнеачения :
-EIP -- счетчик команд, extended instrustion pointer ->  сл машинная инстукция к выполнению
увеличивается после извелечения на длину инструкции (от 1 до 11 ячеек памяти)
-FLAGS -- регистр флагов,
ZF - zero flag - if 0 ZF = 1
CF - carry flag флаг переноса - if (перенос из страшего разряга) CF = 1
SF - sing flag - равен старшему биту числа (1 < 0 тк -5 = _1_1111011)
OF - overflow flag - STD "установить" CLD "обнулить"
PF, AF - флаги четности и полупреноса
IF, TF - interrupt and trap - доступны только в режиме суперпользователя

Дерективы резервирования памяти:
resb(однобайтовые)
resw(двубайтовые)
resd(двойные словва - четырехбайтовые)
db -- dw -- dd

section .bss
array rest 256 ;массив размера 256

section .text
		mov ecx, 256
		mov edi, array
		mov al, '@'
again:	mov [edi], al
		inc edi
		dec ecx
		jnz again ;если не ноль повторяем цикл

;matrix dd 10*15
;[matrix+eax+4*ebx]

lea -- load effective adress вычисляет адрес не обращаясь к нему
add eax, ebx -- eax += ebx
sub вычетание

adc, sbb учитывают  СF

loop

		mov ecx, 1000
		mov esi, array
		mov eax, 0
lp:		add eax, [esi]
		add esi, 4
		loop lp

xor eax, eax -- зантмает 2 байта вмпсто 5
test eax, eax -- равенство нулю

shr -- shift right
shl -- shift left
