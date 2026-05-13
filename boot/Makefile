ARCH_DIR=arch/x86

CFLAGS?= -O2 -g

.PHONY: all build clean
.SUFFIXES: .S .o

BOOT_SRC=$(ARCH_DIR)/entry.S
BOOT_OBJ=$(ARCH_DIR)/entry.o

all: build

build: entry.bin

entry.bin: $(BOOT_OBJ)
	$(OBJCOPY) -O binary $< $@

$(ARCH_DIR)/%.o: $(ARCH_DIR)/%.S
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(ARCH_DIR)/*.o entry.bin
