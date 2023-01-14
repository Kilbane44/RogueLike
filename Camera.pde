// This is the camera class
class Camera {

  boolean up, down, left, right = false;
  // These are the x and y positions of the camera
  float x, y;

  // This is the speed at which the camera moves
  float speed;

  // This is the camera's constructor
  Camera(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
  }

  // This is the update function, which updates the camera's position based
  // on user input
  void Update() {

  }
  
  
  void UpdateCameraPosition(PVector pos)
  {
    x = pos.x-width/2;
    y = pos.y-height/2;
  }

  // This is the apply function, which applies the camera's position to the
  // current drawing context
  void Apply() {
    // Move the origin of the coordinate system to the camera's position
    translate(-x, -y);
  }
}
