SHELL := /bin/bash
RM := rm -rf

zeros:
	dd if=/dev/zero of=zeros.bin bs=1 count=512

.PHONY: clean
clean:
	${RM} *.bin
