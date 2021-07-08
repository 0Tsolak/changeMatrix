## Makefile for changeMatrix project

export EXECUTABLE := out
#########

.PHONY: default
default: $(EXECUTABLE)

export DEBUG_FLAGS ?= -O3
export SOURCE_FILES := $(wildcard *.cpp)
export OBJ_FILES := $(patsubst %.cpp, %.o, $(SOURCE_FILES))
export DEP_FILES := $(patsubst %.cpp, %.dep, $(SOURCE_FILES))


$(EXECUTABLE) : $(OBJ_FILES)
	@g++ $(DEBUG_FLAGS) $^ -o $@

%.o :
	@g++ $(DEBUG_FLAGS) -c $< -o $@

%.dep : %.cpp
	@g++ -MM $< -o $@


.PHONY: clean
clean:
	@echo "Cleaning!"
	@-rm $(DEP_FILES) $(OBJ_FILES) $(EXECUTABLE) > /dev/null 2> /dev/null

.PHONY: test
test: $(EXECUTABLE)
	@echo "Running the test!"
	@./$(EXECUTABLE)

.PHONY: debug
debug:
	@echo "Building the debug version!"
	@$(make) DEBUG_FLAGS="-g"
	@gdb ./$(EXECUTABLE)

.PHONY: release
release:
	@echo "Building the release version!"
	@$(make) DEBUG_FLAGS="-O3"

-include $(DEP_FILES)
