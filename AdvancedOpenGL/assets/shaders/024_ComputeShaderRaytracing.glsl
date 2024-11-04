#version 450

layout(local_size_x = 1, local_size_y = 1) in;
layout(rgba32f, binding = 0) uniform image2D img_output;

void main() {
  // Base pixel colour for image
  vec4 pixel = vec4(0.0, 0.0, 0.0, 1.0);
  // Get index in global work group i.e x,y position
  ivec2 pixel_coords = ivec2(gl_GlobalInvocationID.xy);
  
  // Hard coded scene
   vec3 sphere_c;
  float sphere_r = 1.0;

  float max_x = 5.0;
  float max_y = 5.0;
  ivec2 dims = imageSize(img_output); // fetch image dimensions
  float x = (float(pixel_coords.x * 2 - dims.x) / dims.x);
  float y = (float(pixel_coords.y * 2 - dims.y) / dims.y);
  vec3 ray_o = vec3(x * max_x, y * max_y, 0.0);
  vec3 ray_d = vec3(0.0, 0.0, -1.0); // ortho

  // This
  vec3 omc = sphere_c - ray_o;
  float a = dot(ray_d, ray_d);
  float b = -2 * dot(ray_d, omc);
  float c = dot(omc, omc) - sphere_r * sphere_r;
  float bsqmc = b * b - 4 * a * c;

  // Hit one or both sides
  if (bsqmc >= 0.0) 
  {
    //vec3 N = vec3(ray_o-vec3(0,0,-1))
    //pixel = 0.5*vec4(N+1)
    pixel = vec4(0.4, 0.4, 1.0, 1.0);
  }
  

  // Output to a specific pixel in the image
  imageStore(img_output, pixel_coords, pixel);
}