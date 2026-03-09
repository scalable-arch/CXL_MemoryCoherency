CC ?= gcc
CFLAGS ?= -O2 -Wall -Wextra -std=gnu11

# bwvfio.c uses libnuma on most distros.
LDFLAGS ?= -lnuma

TARGET = bam_bar2_rw_test
SRCS = bam_bar2_rw_test.c bwvfio.c

all: $(TARGET)

$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) -I. -o $@ $(SRCS) $(LDFLAGS)

clean:
	rm -f $(TARGET)
