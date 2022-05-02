# qasm

Proof of concept high level assembler based on qbe.

In some ways it is more flexible than the original qbe as you
assembly directives and qbe code. You are easily able to make use
of assembler features qbe doesn't know about. It is even forward
compatible with new assemblers/platforms with zero code.

Perhaps the biggest downside is the frontend or linker must perform
function inlining (but qbe doesn't currently have inlining so this makes no difference).

## Example
```
.text
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
	.ascii  "one and one make %d!\n"
```

## Usage

```
$ make
$ ./qasm < example.qasm > example.s
$ cc example.s -o example
$ ./example
one and one make 2!
```
