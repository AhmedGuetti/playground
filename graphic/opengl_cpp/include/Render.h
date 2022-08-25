#pragma once
#include <glad/glad.h>
#include <signal.h>


#include <VertexArrays.h>
#include <IndexBuffer.h>
#include <shader.h>


#define ASSERT(x) if(!(x)) raise(SIGTRAP);

#define GLcall(x) GLClearError();\
    x;\
    ASSERT(GLLogCall(#x, __FILE__, __LINE__))



void GLClearError();

bool GLLogCall(const char* function, const char* file, int line);



class Renderer {
    private:

    public:
    void Clear(float f1, float f2, float f3, float f4) const;
    void Draw(const VertexArrays& va,  IndexBuffer& ib, const shader& shader) const ;


};