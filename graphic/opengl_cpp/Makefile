CXX      := -c++
CXXFLAGS := -Wall 
LDFLAGS  := -L/usr/lib -lstdc++ -lm -lglfw -lX11 -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -lGL
BUILD    := ./build
OBJ_DIR  := $(BUILD)/objects
APP_DIR  := $(BUILD)/apps
TARGET   := opengl
INCLUDE  := -Iinclude/ -Ivendor/ -Ivendor/imgui/ -Ivendor/imgui/backends
SRC      :=                      \
   $(wildcard src/Buffer/*.cpp) \
   vendor/imgui/backends/imgui_impl_glfw.cpp \
   vendor/imgui/backends/imgui_impl_opengl3.cpp \
   $(wildcard vendor/imgui/*.cpp) \
   $(wildcard vendor/*.cpp) \
   $(wildcard vendor/glad/*.cpp) \
   $(wildcard src/*.cpp)         \
   $(wildcard src/shader/*.cpp)         \
   $(wildcard *.cpp)         \

OBJECTS  := $(SRC:%.cpp=$(OBJ_DIR)/%.o)
DEPENDENCIES \
         := $(OBJECTS:.o=.d)

all: build $(APP_DIR)/$(TARGET)

$(OBJ_DIR)/%.o: %.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -MMD -o $@

$(APP_DIR)/$(TARGET): $(OBJECTS)
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -o $(APP_DIR)/$(TARGET) $^ $(LDFLAGS)

-include $(DEPENDENCIES)

.PHONY: all build clean debug release info exe

build:
	@mkdir -p $(APP_DIR)
	@mkdir -p $(OBJ_DIR)

exe:
	./build/apps/$(TARGET)

debug: CXXFLAGS += -DDEBUG -g
debug: all

release: CXXFLAGS += -O2
release: all

clean:
	-@rm -rvf $(OBJ_DIR)/*
	-@rm -rvf $(APP_DIR)/*

info:
	@echo "[*] Application dir: ${APP_DIR}     "
	@echo "[*] Object dir:      ${OBJ_DIR}     "
	@echo "[*] Sources:         ${SRC}         "
	@echo "[*] Objects:         ${OBJECTS}     "
	@echo "[*] Dependencies:    ${DEPENDENCIES}"
