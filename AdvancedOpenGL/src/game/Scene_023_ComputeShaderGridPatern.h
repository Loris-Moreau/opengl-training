#ifndef Scene_023_ComputeShaderGridPatern_H
#define Scene_023_ComputeShaderGridPatern_H

#include "../engine/Scene.h"
#include "../engine/Assets.h"

struct Coords {
  GLfloat x;
  GLfloat y;
  GLfloat s;
  GLfloat t;
};

struct Rgba {
  GLfloat Red;
  GLfloat Green;
  GLfloat Blue;
  GLfloat Alpha;
};

class Scene_023_ComputeShaderGridPatern : public Scene {
public:
    Scene_023_ComputeShaderGridPatern();
    ~Scene_023_ComputeShaderGridPatern();
    void load();
    void clean();
    void pause();
    void resume();
    void handleEvent(const InputState &);
    void update(float dt);
    void draw();
    void setGame(Game *);

private:
    Game *game;

    Coords* quadTexture;
    Rgba* quadVertex;
    unsigned short int* quadIndex;

    GLuint quadIBO;
    GLuint quadVBO;
    GLuint quadVAO;
    GLuint quadTextureID;

    ComputeShader computeShader;
    Shader renderShader;
};

#endif //Scene_023_ComputeShaderGridPatern_H
