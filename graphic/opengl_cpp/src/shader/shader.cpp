#include "shader.h"
#include "Render.h"



shader::shader(const std::string& filepath) 
:m_RenderID(0)
{
    ShaderProgramSource src = ParseShader(filepath);
    m_RenderID = CreateShader(src.Vertex,src.Fragment);

}

shader::~shader(){
    GLcall(glDeleteProgram(m_RenderID))
}


ShaderProgramSource shader::ParseShader(const std::string& path){

    std::ifstream stream(path);

    enum class ShaderTypes{
        NONE = -1, VERTEX = 0, FRAGMENT = 1
    };
    std::string line;
    std::stringstream ss[2];
    ShaderTypes type = ShaderTypes::NONE;
    while (getline(stream, line)){
        if(line.find("#shader") != std::string::npos)
        {
            if(line.find("vertex") != std::string::npos)
                type = ShaderTypes::VERTEX;
            else if (line.find("fragment") != std::string::npos)
                type = ShaderTypes::FRAGMENT;
        }
        else
            ss[(int)type] << line <<"\n";
    }
    return {ss[0].str(),ss[1].str()};
}



unsigned int shader::CompileShader(unsigned int type,std::string& Shader){
    const char* shader = Shader.c_str();
    unsigned int id = glCreateShader(type);
    GLClearError();
    GLcall(glShaderSource(id, 1, &shader, nullptr));
    GLcall(glCompileShader(id));

    int isCompiled;
    glGetShaderiv(id, GL_COMPILE_STATUS,&isCompiled);
    if(isCompiled != GL_TRUE){
        int len;
        glGetShaderiv(id, GL_INFO_LOG_LENGTH, &len);
        char* message = (char*)alloca(len*sizeof(char));
        glGetShaderInfoLog(id, len, &len,message);
        std::cout<< "Failed to load the VERTEX SHADER"<<std::endl;
        std::cout<< message <<std::endl;
    }
    return id;

}
unsigned int shader::CreateShader(std::string& VertexShader,std::string& FragmentShader){
    GLcall(unsigned int program = glCreateProgram());
    unsigned int Vertex = CompileShader(GL_VERTEX_SHADER,VertexShader);
    unsigned int Fragment = CompileShader(GL_FRAGMENT_SHADER,FragmentShader);

    GLcall(glAttachShader(program,Vertex));
    GLcall(glAttachShader(program,Fragment));

    GLcall(glLinkProgram(program));
    GLcall(glValidateProgram(program));

    GLcall(glDeleteShader(Vertex));
    GLcall(glDeleteShader(Fragment));

    return program;

}


void shader::Bind() const {
    GLcall(glUseProgram(m_RenderID));
}
void shader::Unbind() const {
    GLcall(glUseProgram(0))
}

void shader::SetUniform1i(const std::string& name, int value){
    GLcall(glUniform1i(GetUniformLocation(name),value));
}

void shader::SetUniformMat4f(const std::string& name, glm::mat4& matrix){
    GLcall(glUniformMatrix4fv(GetUniformLocation(name), 1, GL_FALSE, &matrix[0][0]));
}
void shader::SetUniform4f(const std::string& name, float f1,float f2,float f3, float f4){
    GLcall(glUniform4f(GetUniformLocation(name),f1,f2,f3,f4));
}

int shader::GetUniformLocation(const std::string& name){
    if (m_UniformCache.find(name) != m_UniformCache.end())
        return m_UniformCache[name];

    
   GLcall(int location = glGetUniformLocation(m_RenderID, name.c_str()));
   if(location == -1)
       std::cout<<"WARNNIGN "<< name <<" Uniform dosn't exist"<<std::endl;
   m_UniformCache[name] = location;
   return location;

}