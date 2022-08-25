#include "Render.h"
#include <iostream>

void GLClearError(){
    while (glGetError() != GL_NO_ERROR);
}


bool GLLogCall(const char* function, const char* file, int line){
    while (GLenum error  = glGetError())
    {
        std::cout<< "[OpenGL error] : ("<< error << ") : "<< file << " " << function <<" : "<< line <<std::endl;
        return false;
    }
    return true;
}


void Renderer::Draw(const VertexArrays& va, IndexBuffer& ib, const shader& shader) const {
    shader.Bind();
    va.Bind();
    ib.Bind();
    GLcall(glDrawElements(GL_TRIANGLES,ib.GetCount(),GL_UNSIGNED_INT,nullptr));
}

void Renderer::Clear(float f1, float f2, float f3, float f4) const {
        glClearColor(f1,f2,f3,f4);
        GLcall(glClear(GL_COLOR_BUFFER_BIT));
}