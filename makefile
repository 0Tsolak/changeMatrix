#####################_EXPORTING VARIABLES_#######################

export EXECUTABLE := out
export SHELL := /bin/bash

export DEBUG_FLAGS ?= -O3
export SOURCE_FILES := $(wildcard *.cpp)
export OBJ_FILES := $(patsubst %.cpp, %.o, $(SOURCE_FILES))
export DEP_FILES := $(patsubst %.cpp, %.dep, $(SOURCE_FILES))
export TEMP_FILES := $(DEP_FILES) $(OBJ_FILES) $(EXECUTABLE)



################_DEPENDENCES_################

$(EXECUTABLE) : $(OBJ_FILES)
        @echo "Linking the executable ..."
        @g++ $(DEBUG_FLAGS) $^ -o $@

%.o :
        @echo "Compiling $<"
        @g++ $(DEBUG_FLAGS) -c $< -o $@

%.dep : %.cpp
        @echo "Generating dependencies for $<"
        @g++ -MM $< -o $@



#########################_PHONY COMMANDS_############################

.PHONY: default
default: $(EXECUTABLE)

.PHONY: clean
clean :
        @echo "Cleaning temporary files ..."
        @-rm $(TEMP_FILES) > /dev/null 2> /dev/null

.PHONY: test
test : $(EXECUTABLE)
        @echo "Running the test ..."
        @./$(EXECUTABLE)

.PHONY: release
release : clean
        @echo "Building the release version ..."
        @export DEBUG_FLAGS="-O3" && $(MAKE) 

.PHONY: debug
debug : clean
        @echo "Building the debug version ..."
        @export DEBUG_FLAGS="-g" && $(MAKE) 
        @echo "Running GDB ..."
        @gdb ./$(EXECUTABLE)

.PHONY: profile
profile : clean
        @echo "Building the profile version ..."
        @export DEBUG_FLAGS="-pg" && $(MAKE) 
        @echo -e "Running the application in profile mode ...\n"
        @./$(EXECUTABLE)
        @echo -e "\nRunning the profiler to see the output ...\n"
        @gprof $(EXECUTABLE)



########_Including dependence files_########

-include $(DEP_FILES)


