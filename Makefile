SHELL := /bin/bash
RM := rm -rf

zeros:
	dd if=/dev/zero of=zeros.bin bs=1 count=512

with_signature:
	echo -n -e '\x55\xaa' | dd of=mbr_signature.bin bs=1 seek=510 conv=notrunc

hello: hello.bin
	: nop

video-dark: video-dark.bin
	: nop

.SUFFIXES: .o .S .bin

.S.o:
	as -o $@ $<

.o.bin:
	ld --oformat binary -Ttext=7c00 -Tdata=7dfe -o $@ $<

.PHONY: clean
clean:
	${RM} *.bin *.o
