# qasm

Proof of concept high level assembler based on qbe.

In some ways it is more flexible than the original qbe as you
can freely mix assembly, assembly directives and qbe code.

In this model it is also possible to remove many concepts from qbe (like data statements and most attributes).

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
