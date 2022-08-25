#pragma once 
#include <glad/glad.h>


class IndexBuffer
{
private:
   unsigned int m_RenderID;
   unsigned int m_count;
public:
    IndexBuffer(const unsigned int * data, unsigned int size);
    ~IndexBuffer();

    void Bind() const;
    void Unbind() const;
    inline unsigned int GetCount(){ return m_count;}
};
