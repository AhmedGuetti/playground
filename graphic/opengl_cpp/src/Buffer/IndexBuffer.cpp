#include <signal.h>

#include "IndexBuffer.h"
#include "Render.h"




IndexBuffer::IndexBuffer(const unsigned int * data, unsigned int count){
    ASSERT(sizeof(unsigned int) == sizeof(GLuint))
    GLcall(glGenBuffers(1,&m_RenderID));
    GLcall(glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,m_RenderID));
    GLcall(glBufferData(GL_ELEMENT_ARRAY_BUFFER,count * sizeof(unsigned int),data,GL_STATIC_DRAW));
}

IndexBuffer::~IndexBuffer(){
    GLcall(glDeleteBuffers(1, &m_RenderID));

}

void IndexBuffer::Bind() const{
 GLcall(glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,m_RenderID));
}

void IndexBuffer::Unbind() const {
 GLcall(glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,0));
}