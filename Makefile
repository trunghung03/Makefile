TARGET := helloWorld

CC := gcc
CCFLAGS := -Wall

SRCSDIR := ./src
SRCS := $(wildcard $(SRCSDIR)/*.c)
BUILDDIR := ./build
OBJS := $(patsubst $(SRCSDIR)/%.c, $(BUILDDIR)/%.o, $(SRCS))

default: $(BUILDDIR)/$(TARGET)

debug: CCFLAGS += -g -DDEBUG
debug: $(TARGET)

$(BUILDDIR)/$(TARGET): $(OBJS)
	$(CC) $^ $(CCFLAGS) -o $@

$(BUILDDIR)/%.o: $(SRCSDIR)/%.c
	$(CC) $(CCFLAGS) -c $< -o $@

clean:
	-rm -rf $(BUILDDIR)/*

run:
	./build/$(TARGET)
