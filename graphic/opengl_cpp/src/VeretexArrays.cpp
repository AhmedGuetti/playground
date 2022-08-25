#include "VertexArrays.h"
#include "Render.h"


#include "VertexBufferLayout.h"


VertexArrays::VertexArrays()
{
    GLcall(glGenVertexArrays(1, &m_RenderID));
    
}

VertexArrays::~VertexArrays()
{
    GLcall(glDeleteVertexArrays(1, &m_RenderID));
}

void VertexArrays::AddBuffer(const VertexBuffer& vb, const VertexBufferLayout& layout){
    Bind();
    vb.Bind();

    const std::vector<VertexBufferElement>& elements = layout.GetElements();
    unsigned int offset = 0;
    for (int i = 0; i < elements.size(); i++){
        const VertexBufferElement element = elements[i];
        GLcall(glEnableVertexAttribArray(i));
        GLcall(glVertexAttribPointer(i,element.count,element.type,element.normalized,
        layout.GetStride(),(void*)offset));
        offset += element.count * VertexBufferElement::GetSizeOfType(element.type);
    }
    
    
    
}



void VertexArrays::Bind() const {
    GLcall(glBindVertexArray(m_RenderID));
}

void VertexArrays::Unind() const {
    GLcall(glBindVertexArray(0));
}