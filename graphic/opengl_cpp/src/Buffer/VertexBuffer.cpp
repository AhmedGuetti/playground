#include <signal.h>

#include "VertexBuffer.h"
#include "Render.h"




VertexBuffer::VertexBuffer(const void* data,unsigned int size){
    GLcall(glGenBuffers(1, &m_RenderID));
    GLcall(glBindBuffer(GL_ARRAY_BUFFER,m_RenderID));
    GLcall(glBufferData(GL_ARRAY_BUFFER,size,data,GL_STATIC_DRAW));
}

VertexBuffer::~VertexBuffer(){
    GLcall(glDeleteBuffers(1, &m_RenderID));
}


/*
A "const function", denoted with the keyword 
const after a function declaration,
makes it a compiler error for this class
function to change a member variable of the class
*/
void VertexBuffer::Bind() const{
    GLcall(glBindBuffer(GL_ARRAY_BUFFER,m_RenderID));
}

void VertexBuffer::Unbind() const {
    GLcall(glBindBuffer(GL_ARRAY_BUFFER,0));
}