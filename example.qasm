.text
.weak add
.qbe
function w $add(w %a, w %b) {
@start
	%c =w add %a, %b
	ret %c
}
.asm

.globl main
main:
	movl $1, %esi
	movl $1, %edi
	callq add
	movl %eax, %esi
	leaq fmt(%rip), %rdi
	movl $0, %eax
	callq printf
	movl $0, %eax
	ret

.data
fmt:
	.asciz  "one and one make %d!\n"