#pragma once

#include "Render.h"



class Texture{
private:
    unsigned int m_RenderID;
    std::string m_FilePath;
    unsigned char* m_localBuffer;
    int m_Width,m_Height,m_BPP;
public:
    Texture(const std::string& path);
    ~Texture();


    void Bind(unsigned int slot = 0) const;
    void Unbind() const;

    inline int GetWidth(){return m_Width;}
    inline int GetHeight(){return m_Height;}
};