#define GLFW_INCLUDE_NONE
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <chrono>
#include <stdio.h>
#include <stdlib.h>


#include "Render.h"
#include "VertexBuffer.h"
#include "IndexBuffer.h"
#include "VertexArrays.h"
#include "VertexBufferLayout.h"
#include "shader.h"
#include "Texture.h"

#include "glm/glm.hpp"
#include "glm/gtc/matrix_transform.hpp"

#include "imgui.h"
#include "imgui_impl_glfw.h"
#include "imgui_impl_opengl3.h"


void framebuffer_size_callback(GLFWwindow* window, int width, int height);
void processInput(GLFWwindow *window);

// settings
const unsigned int SCR_WIDTH = 960;
const unsigned int SCR_HEIGHT = 540;

int main(){


    // glfw: initialize and configure
    // ------------------------------
    glfwInit();
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_RESIZABLE,GL_FALSE);
    //glfwWindowHint(GLFW_REFRESH_RATE, 60);
    //glfwWindowHint(GLFW_DOUBLEBUFFER, GLFW_FALSE);


   // glfw window creation
    // --------------------
    GLFWwindow* window = glfwCreateWindow(SCR_WIDTH, SCR_HEIGHT, "LearnOpenGL", NULL, NULL);
    if (window == NULL)
    {
        std::cout << "Failed to create GLFW window" << std::endl;
        glfwTerminate();
        return -1;
    }
    glfwMakeContextCurrent(window);
    //glfwSwapInterval(1); // Enable vsync
    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);
    glfwSwapInterval(1);
    // glad: load all OpenGL function pointers
    // ---------------------------------------
    if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
    {
        std::cout << "Failed to initialize GLAD" << std::endl;
        return -1;
    }    

    float pos[] = {
        200.0f, 100.0f, 0.0f, 0.0f, //0
        500.0f, 100.0f, 1.0f, 0.0f,//1
        600.0f, 300.0f, 1.0f, 1.0f,//2
        100.0f, 300.0f, 0.0f, 1.0f//3

    };
    u_int indices[]{
        0,1,2,
        2,3,0
    };

    GLcall(glEnable(GL_BLEND));
    GLcall(glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA));


    VertexArrays va;

    VertexBuffer vb(pos,4*4*sizeof(float));
    VertexBufferLayout layout;

    layout.Push<float>(2);
    layout.Push<float>(2);

    va.AddBuffer(vb,layout);
    IndexBuffer ibo(indices, 6);

    glm::mat4 proj = glm::ortho(0.0f,960.0f,0.0f,540.0f,-1.0f,1.0f);
    glm::mat4 view = glm::translate(glm::mat4(1.0f), glm::vec3(-100,0,0));

    shader shader("res/shader/basic.shader");
    shader.Bind();

    shader.SetUniform4f("u_Color",0.6f,0.99f,0.9f,1.0f);


    Texture Texture("res/Texture/logo.png");
    Texture.Bind();
    shader.SetUniform1i("u_Texture",0);

    va.Unind();
    vb.Unbind();
    ibo.Unbind();
    shader.Unbind();

    Renderer Renderer;




    // Setup Dear ImGui context
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;


    ImGui_ImplGlfw_InitForOpenGL(window, true);
        ImGui_ImplOpenGL3_Init();


    // Setup Dear ImGui style
    ImGui::StyleColorsDark();


    float r = 0.0f;
    float increment = 0.02f;


    //double lastTime = 0.0;

        glm::vec3 translation(200,200,0);


    /* Loop until the user closes the window */
    while (!glfwWindowShouldClose(window))
    {

    //double time = glfwGetTime();
    //double deltaTime = time - lastTime;
    //while (deltaTime >=  1/60) {  
    //    lastTime = time;
        Renderer.Clear(0.5f,0.21f,0.43f,1.0f);

                // Start the Dear ImGui frame
        ImGui_ImplOpenGL3_NewFrame();
        ImGui_ImplGlfw_NewFrame();
        ImGui::NewFrame();

        glm::mat4 model = glm::translate(glm::mat4(1.0f), translation);

        glm::mat4 mvp = proj * view * model;

        shader.Bind();
        shader.SetUniform4f("u_Color",r,0.3f,0.8f,1.0f);
        shader.SetUniformMat4f("u_MVP",mvp);
        va.Bind();
        ibo.Bind();
        GLcall(glDrawElements(GL_TRIANGLES,6,GL_UNSIGNED_INT,nullptr));


        if(r > 1.0f )
            increment = -0.02f;
        else if(r < 0.0f)
            increment = 0.02f;
        
        r+=increment;


        {

            ImGui::SliderFloat("TranslationX", &translation.x, 0.0f, 960.0f);         
            ImGui::Text("Application average %.3f ms/frame (%.1f FPS)", 1000.0f / ImGui::GetIO().Framerate, ImGui::GetIO().Framerate);

            ImGui::SliderFloat("TranslationY", &translation.y, 0.0f, 540.0f);         
            ImGui::Text("Application average %.3f ms/frame (%.1f FPS)", 1000.0f / ImGui::GetIO().Framerate, ImGui::GetIO().Framerate);
            //ImGui::End();
        }




        /* Swap front and back buffers */


                // Rendering
        ImGui::Render();
        ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());


        glfwSwapBuffers(window);
    //}
  /* Poll for and process events */
        glfwPollEvents();
    }


        // Cleanup
    ImGui_ImplOpenGL3_Shutdown();
    ImGui::DestroyContext();

    shader.~shader();
    glfwTerminate();
    return 0;
}


// process all input: query GLFW whether relevant keys are pressed/released this frame and react accordingly
// ---------------------------------------------------------------------------------------------------------
void processInput(GLFWwindow *window)
{
    if(glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
        glfwSetWindowShouldClose(window, true);
}

// glfw: whenever the window size changed (by OS or user resize) this callback function executes
// ---------------------------------------------------------------------------------------------
void framebuffer_size_callback(GLFWwindow* window, int width, int height)
{
    // make sure the viewport matches the new window dimensions; note that width and 
    // height will be significantly larger than specified on retina displays.
    glViewport(0, 0, width, height);

}