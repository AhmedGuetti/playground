#include "Texture.h"
#include "stb_image.h"


Texture::Texture(const std::string& path)
: m_RenderID(0) ,m_FilePath(path),m_localBuffer(nullptr),m_Width(0),m_Height(0),m_BPP(0)
{
    stbi_set_flip_vertically_on_load(1);
    
    m_localBuffer = stbi_load(path.c_str(), &m_Width, &m_Height, &m_BPP,4);

    GLcall(glGenTextures(1, &m_RenderID));
    GLcall(glBindTexture(GL_TEXTURE_2D,m_RenderID));


    GLcall(glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR));
    GLcall(glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_LINEAR));
    GLcall(glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_WRAP_S,GL_CLAMP_TO_EDGE));
    GLcall(glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_WRAP_T,GL_CLAMP_TO_EDGE));

    GLcall(glTexImage2D(GL_TEXTURE_2D,0,GL_RGBA8,m_Width,m_Height,0,GL_RGBA,GL_UNSIGNED_BYTE,m_localBuffer));
    GLcall(glBindTexture(GL_TEXTURE_2D,0));

    if(m_localBuffer)
        stbi_image_free(m_localBuffer);

}
Texture::~Texture(){
    GLcall(glDeleteTextures(1, &m_RenderID));
}


void Texture::Bind(unsigned int slot /*= 0*/) const{
    GLcall(glActiveTexture(GL_TEXTURE0 + slot));
    GLcall(glBindTexture(GL_TEXTURE_2D,m_RenderID));
}
void Texture::Unbind() const{
    GLcall(glBindTexture(GL_TEXTURE_2D,0));
}

