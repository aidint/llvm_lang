CXX = clang++
FILES = parser.cpp lex.cpp ast.cpp codegen.cpp external.cpp
CXXFLAGS = -O3 -Wall -std=c++20
DEBUGFLAGS = -g -O0 -Wall -std=c++20
LLVM_CONF = llvm-config --cxxflags --ldflags --system-libs --libs core orcjit native
TARGET = parser

$(TARGET): 
	$(CXX) `$(LLVM_CONF)` $(CXXFLAGS) $(FILES) -o $(TARGET)

debug:
	$(CXX) `$(LLVM_CONF)` $(DEBUGFLAGS) $(FILES) -o $(TARGET)

# Clean rule to remove generated files
clean:
	rm -r $(TARGET) $(TARGET).dSYM > /dev/null 2>&1

.PHONY: all clean

