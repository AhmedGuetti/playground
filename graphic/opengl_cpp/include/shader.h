#pragma once

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <unordered_map>

#include "glm/glm.hpp"





struct ShaderProgramSource{
    std::string Vertex;
    std::string Fragment;
};


class shader {
    private:
        unsigned int m_RenderID;
        //cashing
        std::unordered_map<std::string, int> m_UniformCache;
    public:
        shader(const std::string& filepath);
        ~shader();

        void Bind() const ;
        void Unbind() const ;

        void SetUniform1i(const std::string& name, int value);
        void SetUniform4f(const std::string& name, float f1,float f2,float f3, float f4);
        void SetUniformMat4f(const std::string& name, glm::mat4& matrix);

    private:
        ShaderProgramSource ParseShader(const std::string& path);
        unsigned int CompileShader(unsigned int type,std::string& Shader);
        unsigned int CreateShader(std::string& VertexShader,std::string& FragmentShader);
        int GetUniformLocation(const std::string& name);




};