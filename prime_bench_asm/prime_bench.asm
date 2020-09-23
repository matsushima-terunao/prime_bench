;/*win
USE_X64 equ 0
USE_VMX2_POPCNT equ 0

public main
extern malloc:proc
extern free:proc
extern printf:proc
extern atoi:proc
includelib "libcmt.lib"

.data

.data?

.code

if USE_X64
comment $ mac*/
.equ	USE_X64, 0
.equ	USE_VMX2_POPCNT, 01

.intel_syntax noprefix
.global	_main
.extern	_malloc
.extern	_free
.extern _printf
.extern _atoi

.data

.bss

.text

#if USE_X64
#$

;##########################################################################################
;# count prime

;# x64 版
;# @param rcx/rdi size
;# @param rcx/rdi size
;# @return rax prime count
count_prime:
	push	rbx
	push	rdi
	push	r12 ;# size
	sub		rsp, 32 ;# 16-byte align
	;# int total = 0, s, s2;
	;# // 結果配列初期化
	;# char* flags = (char*)malloc(size);
;/*win
	mov		r12, rcx ; size
	add		rcx, 255 ; 256-byte align
	and		rcx, -256
	call	malloc
comment $ mac*/
	mov		r12, rdi # size
	add		rdi, 255 # 256-byte align
	and		rdi, -256
	call	_malloc
#$
	mov		r10, rax ;# flags
	;# memset(flags, 1, size);
	;# flags[0] = flags[1] = 0;
	mov		rdi, rax
	mov		rax, 0101010101010000h
	pushfq
	cld
	stosq
	mov		rcx, r12
	sar		rcx, 3
	dec		rcx
	mov		rax, 0101010101010101h
	rep		stosq
	popfq
	;# // 素数をカウント、素数の倍数を素数でないと設定
	;# for (s = 2; s < size / 2; ++s) {
	xor		rbx, rbx ;# total
	mov		rdi, r10 ;# flags
	lea		r11, [r10 + r12] ;# flags (+ size)
	mov		rcx, 2 ;# s
	mov		r8, r12 ;# size / 2
	sar		r8, 1
	mov		r9, r12 ;# - size
	neg		r9
	xor		rax, rax
	for_s:
		;# if (flags[s]) {
		cmp		al, [rdi + rcx]
		je		end_if_not_flags_s
			;# ++total;
			inc		rbx
			;# for (s2 = s * 2; s2 < size; s2 += s) {
			lea		rdx, [rcx * 2 + r9] ;# s2 = s * 2 (- size)
			sub		r11, rcx ;# flags (+ size - s)
			for_s2:
				;# flags[s2] = 0;
				add		rdx, rcx
				mov		[r11 + rdx], al
			;# }
			jnc		for_s2
			add		r11, rcx
		;# }
		end_if_not_flags_s:
	;# }
	inc		rcx
	cmp		rcx, r8 ;# s < size / 2
	jl		for_s
	;# // 素数をカウント
	;# for (; s < size; ++s) {
	sub		rcx, r12 ;# s (-size)
	add		rdi, r12 ;# flags (+size)
	for_s_total:
		;# if (flags[s]) {
		;#	++total;
		;# }
		cmp		al, [rdi + rcx]
		adc		rbx, rax ;# total += (0 < flags[s])
	;# }
	inc		rcx
	jnz		for_s_total
	;# // 後処理
	;# free(flags);
;/*win
	mov		rcx, r10
	call	free
comment $ mac*/
	mov		rdi, r10
	call	_free
#$
	;# return total;
	mov		rax, rbx
	add		rsp, 32 ;# 16-byte aligned
	pop		r12
	pop		rdi
	pop		rbx
	ret

;/*win
else
comment $ mac*/
#else
#$

;# VMX2 版
;# @param rcx/rdi size
;# @return rax prime count
count_prime:
	push	rbx
	push	rdi
	push	r12 ;# size
	push	r13
	sub		rsp, 40 ;# 16-byte align
	;# int total = 0, s, s2;
	;# // 結果配列初期化
	;# char* flags = (char*)malloc(size);
;/*win
	mov		r12, rcx ; size
	add		rcx, 255 ; next 256-byte align
	and		rcx, -256
	mov		rbx, rcx
	add		rcx, 256
	call	malloc
comment $ mac*/
	mov		r12, rdi # size
	add		rdi, 255 # next 256-byte align
	and		rdi, -256
	mov		rbx, rdi
	add		rdi, 256
	call	_malloc
#$
	mov		r10, rax ;# flags
	mov		r13, rax ;# flags org
	add		r10, 255 ;# next 256-byte align
	and		r10, -256
	;# memset(flags, 1, size);
	;# flags[0] = flags[1] = 0;
	lea		rcx, [r10 + rbx] ;# flags + size
	neg		rbx ;# - size
	vpcmpeqb	ymm0, ymm0, ymm0 ;# ffffffffffffffff
	vpabsb		ymm0, ymm0 ;# 0101010101010101
	clear_loop:
		vmovdqa	ymmword ptr [rcx + rbx], ymm0
		vmovdqa	ymmword ptr	[rcx + rbx + 32], ymm0
		vmovdqa	ymmword ptr	[rcx + rbx + 64], ymm0
		vmovdqa	ymmword ptr	[rcx + rbx + 96], ymm0
		vmovdqa	ymmword ptr	[rcx + rbx + 128], ymm0
		vmovdqa	ymmword ptr	[rcx + rbx + 160], ymm0
		vmovdqa	ymmword ptr	[rcx + rbx + 192], ymm0
		vmovdqa	ymmword ptr	[rcx + rbx + 224], ymm0
		add		rbx, 256
		jnc		clear_loop
	mov		word ptr [r10], word ptr 0
	;# // 素数をカウント、素数の倍数を素数でないと設定
	;# for (s = 2; s < size / 2; ++s) {
	xor		rbx, rbx ;# total
	mov		rdi, r10 ;# flags
	lea		r11, [r10 + r12] ;# flags (+ size)
	mov		rcx, 2 ;# s
	mov		r8, r12 ;# size / 2
	sar		r8, 1
	mov		r9, r12 ;# - size
	neg		r9
	xor		rax, rax
	for_s:
		;# if (flags[s]) {
		cmp		al, [rdi + rcx]
		je		end_if_not_flags_s
			;# ++total;
			inc		rbx
			;# for (s2 = s * 2; s2 < size; s2 += s) {
			lea		rdx, [rcx * 2 + r9] ;# s2 = s * 2 (- size)
			sub		r11, rcx ;# flags (+ size - s)
			for_s2:
				;# flags[s2] = 0;
				add		rdx, rcx
				mov		[r11 + rdx], al
			;# }
			jnc		for_s2
			add		r11, rcx
		;# }
		end_if_not_flags_s:
	;# }
	inc		rcx
	cmp		rcx, r8 ;# s < size / 2
	jl		for_s
	;# // 素数をカウント
	;# for (int ss = s; s < (ss + 63) & -64; ++s) {
	lea		rdx, [rcx + 63]
	and		rdx, -64
	jmp		continue_for_s_total_1
	for_s_total_1:
		;# if (flags[s]) {
		;#	++total;
		;# }
		cmp		al, [rdi + rcx]
		adc		rbx, rax ;# total += (0 < flags[s])
	;# }
	inc		rcx
	continue_for_s_total_1:
	cmp		rcx, rdx
	jl		for_s_total_1
	;# for (; s < size & -32; s += 32) {
;/*win
if USE_VMX2_POPCNT
comment $ mac*/
#if USE_VMX2_POPCNT
#$
	;# popcnt 使用
	mov		rdx, r12
	and		rdx, -64
	jmp		continue_for_s_total_2
	for_s_total_2:
		;# total += popcount(flags[s]);
		popcnt	r8, [rdi + rcx]
		popcnt	r9, [rdi + rcx + 8]
		add		rbx, r8
		add		rbx, r9
		popcnt	r8, [rdi + rcx + 16]
		popcnt	r9, [rdi + rcx + 24]
		add		rbx, r8
		add		rbx, r9
		popcnt	r8, [rdi + rcx + 32]
		popcnt	r9, [rdi + rcx + 40]
		add		rbx, r8
		add		rbx, r9
		popcnt	r8, [rdi + rcx + 48]
		popcnt	r9, [rdi + rcx + 56]
		add		rbx, r8
		add		rbx, r9
		add		rcx, 64
	;# }
	continue_for_s_total_2:
	cmp		rcx, rdx
	jl		for_s_total_2
;/*win
else
comment $ mac*/
#else
#$
	;# vpaddb,vpmaddubsw,vphaddw 使用
	;# 垂直+水平加算 0m3.418s
	vpcmpeqb	ymm4, ymm4, ymm4
	vpabsb	ymm4, ymm4
	vpxor	ymm5, ymm5, ymm5
	vpxor	ymm6, ymm6, ymm6
	mov		rdx, r12
	and		rdx, -256
	jmp		continue_for_s_total_2
	for_s_total_2:
		;# total += popcount(flags[s]);
		vmovupd	ymm0, [rdi + rcx]
		vpaddb	ymm0, ymm0, [rdi + rcx + 32]
		vpaddb	ymm0, ymm0, [rdi + rcx + 64]
		vpaddb	ymm0, ymm0, [rdi + rcx + 96]
		vpaddb	ymm0, ymm0, [rdi + rcx + 128]
		vpaddb	ymm0, ymm0, [rdi + rcx + 160]
		vpaddb	ymm0, ymm0, [rdi + rcx + 192]
		vpaddb	ymm0, ymm0, [rdi + rcx + 224]
		vpmaddubsw	ymm0, ymm4, ymm0 ;# |b31+b30|...|b1+b0|
		vphaddw	ymm0, ymm0, ymm5 ;# |0|0|0|0|b31..28| | |b19..16|0|0|0|0|b15..12| | |b3..0|
		vphaddw	ymm0, ymm0, ymm5 ;# |0|0|0|0|0|0|b31..24|b23..16|0|0|0|0|0|0|b15..8| b7..0|
		vphaddw	ymm0, ymm0, ymm5 ;# |0|0|0|0|0|0|      0|b31..16|0|0|0|0|0|0|     0|b15..0|
		vpaddq	ymm6, ymm6, ymm0
		add		rcx, 256
	;# }
	continue_for_s_total_2:
	cmp		rcx, rdx
	jl		for_s_total_2
	sub		rsp, 32
	vmovupd	[rsp], ymm6
	add		rbx, [rsp]
	add		rbx, [rsp + 16]
	add		rsp, 32
;/*win
endif
comment $ mac*/
#endif
#$
	;# for (; s < size; ++s) {
	jmp		continue_for_s_total_3
	for_s_total_3:
		;# if (flags[s]) {
		;#	++total;
		;# }
		cmp		al, [rdi + rcx]
		adc		rbx, rax ;# total += (1 < flags[s])
	;# }
	inc		rcx
	continue_for_s_total_3:
	cmp		rcx, r12
	jl		for_s_total_3
	;# // 後処理
	;# free(flags);
;/*win
	mov		rcx, r13 ; flags org
	call	free
comment $ mac*/
	mov		rdi, r13 # flags org
	call	_free
#$
	;# return total;
	mov		rax, rbx
	add		rsp, 40 ;# 16-byte aligned
	pop		r13
	pop		r12
	pop		rdi
	pop		rbx
	ret

;/*win
endif
comment $ mac*/
#endif
#$

;##########################################################################################
;# win startup

;/*win
; @param rcx size
; @param rdx count
; @return rax prime count
prime_bench proc
	push	r12 ; size
	push	r13 ; count
	sub		rsp, 40 ; 16-byte align
	mov		r12, rcx
	mov		r13, rdx
	; for (c = 0; c < count; ++c) {
	for_c:
		; int total = prime(size);
		mov		rcx, r12
		call	count_prime
	; }
	dec		r13
	jnz		for_c
	add		rsp, 40 ; 16-byte aligned
	pop		r13
	pop		r12
	ret
prime_bench endp

main proc
	push	rbx
	push	rsi
	push	rdi
	mov		rsi, rcx ; argc
	mov		rdi, rdx ; argv
	sub		rsp, 32 ; 16-byte align
	; if (argc < 2) {
	; 	goto usage;
	; }
	cmp		rsi, 2 ; argc
	jl		usege
	; int size = atoi(argv[1]);
	mov		rcx, [rdi + 8] ; argv[1]
	call	atoi
	mov		rbx, rax ; size
	; if (size < 1) {
	; 	goto usage;
	; }
	cmp		rax, 1
	jl		usege
	; int count = (argc < 3) ? 1 : atoi(argv[2]);
	mov		rax, 1
	cmp		rsi, 3 ; argc
	jl		end_count
	mov		rcx, [rdi + 16] ; argv[2]
	call	atoi
	end_count:
	; int total = prime_bench(size, count);
	mov		rcx, rbx ; size
	mov		rdx, rax ; count
	call	prime_bench
	; printf("prime count = %d\n", total);
	lea		rcx, result_msg
	mov		rdx, rax ; total
	call	printf
	; return 0;
	mov		rax, 0
	jmp		end_main
; usage:
usege:
	; printf("%s size [count]\n", argv[0]);
	lea		rcx, usage_msg
	mov		rdx, [rdi] ; argv[0]
	call	printf
	; return 1;
	mov		rax, 1
end_main:
	add		rsp, 32 ; 16-byte aligned
	pop		rdi
	pop		rsi
	pop		rbx
	ret
; }
main endp

usage_msg	db "%s size [count]", 10, 0
result_msg	db "prime count = %d", 10, 0

end

;##########################################################################################
;# mac startup

comment $ mac*/
# @param rdi size
# @param rsi count
# @return rax prime count
_prime_bench:
	push	r12 # size
	push	r13 # count
	sub		rsp, 40 # 16-byte align
	mov		r12, rdi
	mov		r13, rsi
	# for (c = 0; c < count; ++c) {
	for_c:
		# int total = prime(size);
		mov		rdi, r12
		call	count_prime
	# }
	dec		r13
	jnz		for_c
	add		rsp, 40 # 16-byte aligned
	pop		r13
	pop		r12
	ret

# int main(int argc, char* argv[]) {
_main:
	sub		rsp, 40 # 16-byte align
	#;if (argc < 2) {
	# 	goto usage;
	# }
	cmp		qword ptr [rsp + 40 + 24], 2 # argc
	jl		usege
	# int size = atoi(argv[1]);
	mov		rdi, [rsp + 40 + 40] # argv[1]
	call	_atoi
	mov		rbx, rax # size
	#;if (size < 1) {
	# 	goto usage;
	# }
	cmp		rax, 1
	jl		usege
	# int count = (argc < 3) ? 1 : atoi(argv[2]);
	mov		rax, 1
	cmp		qword ptr [rsp + 40 + 24], 3 # argc
	jl		end_count
	mov		rdi, [rsp + 40 + 48] # argv[2]
	call	_atoi
	end_count:
	# int total = prime_bench(size, count);
	mov		rdi, rbx # size
	mov		rsi, rax # count
	call	_prime_bench
	# printf("prime count = %d\n", total);
	lea		rdi, result_msg[rip]
	mov		rsi, rax # total
	call	_printf
	# return 0;
	mov		rax, 0
	jmp		end_main
# usage:
usege:
	# printf("%s size [count]\n", argv[0]);
	lea		rdi, usage_msg[rip]
	mov		rsi, [rsp + 40 + 32] # argv[0]
	call	_printf
	# return 1;
	mov		rax, 1
end_main:
	add		rsp, 40 # 16-byte aligned
	ret
# }

usage_msg:	.asciz "%s size [count]\n"
result_msg:	.asciz "prime count = %d\n"
#$
