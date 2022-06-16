TARGET := helloWorld

CC := gcc
CCFLAGS := -Wall

SRCSDIR := ./src
SRCS := $(wildcard $(SRCSDIR)/*.c)
BUILDDIR := ./build
OBJS := $(patsubst $(SRCSDIR)/%.c, $(BUILDDIR)/%.o, $(SRCS))

EXECUTABLE := $(BUILDDIR)/$(TARGET)

default: $(EXECUTABLE)

# Added flags for debugging
debug: CCFLAGS += -g -DDEBUG
debug: $(EXECUTABLE)

$(EXECUTABLE): $(OBJS)
	$(CC) $^ $(CCFLAGS) -o $@

$(BUILDDIR)/%.o: $(SRCSDIR)/%.c
	# make target's directory if does not exist
	@mkdir -p $(@D)
	$(CC) $(CCFLAGS) -c $< -o $@

clean:
	-rm -rf $(BUILDDIR)/*

run:
	./build/$(TARGET)
