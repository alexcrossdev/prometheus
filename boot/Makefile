ARCH_DIR=arch/x86

CFLAGS?= -O2 -g

.PHONY: all build clean
.SUFFIXES: .S .o

BOOTSECTOR_OBJ=$(ARCH_DIR)/bootsector.o
LOADER_OBJ=$(ARCH_DIR)/loader.o

all: build

build: bootsector.bin loader.bin
	cat bootsector.bin loader.bin > bootloader.bin

bootsector.bin: $(BOOTSECTOR_OBJ)
	$(OBJCOPY) -O binary $< $@

loader.bin: $(LOADER_OBJ)
	$(OBJCOPY) -O binary $< $@

$(ARCH_DIR)/%.o: $(ARCH_DIR)/%.S
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(ARCH_DIR)/*.o bootsector.bin loader.bin bootloader.bin
