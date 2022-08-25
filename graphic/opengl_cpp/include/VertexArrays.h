#pragma once 

#include "VertexBuffer.h"

class VertexBufferLayout;


class VertexArrays{
private:
unsigned int m_RenderID;
    
public:
    VertexArrays();
    ~VertexArrays();

    void AddBuffer(const VertexBuffer& vb, const VertexBufferLayout& layout);
    void Bind() const;
    void Unind() const;
};