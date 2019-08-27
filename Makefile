SHELL := /bin/bash
RM := rm -rf

zeros:
	dd if=/dev/zero of=zeros.bin bs=1 count=512

with_signature:
	echo -n -e '\x55\xaa' | dd of=mbr_signature.bin bs=1 seek=510 conv=notrunc

.PHONY: clean
clean:
	${RM} *.bin
