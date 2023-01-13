class Enemy
{
  PVector position;
  float health;
  PVector dir;
  float speed= 85;
  float spawnRadius = 130;

  Enemy()
  {
    position = randomPointOnCircle();
  }
  
  void Render()
  {
    fill(255,0,0);
    ellipse(position.x, position.y, 40,40);
  }
  void Move()
  {
    dir = p.position.copy().sub(position);
    
    dir.normalize();
    dir.mult(speed*deltaTime);
    
    position.add(dir);
  }
  void Update()
  {
    Move();
    Render();
  }
  PVector randomPointOnCircle() {
    float angle = random(TWO_PI);
    float x = c.x+(width/2) + spawnRadius * cos(angle);
    float y = c.y+(height/2) + spawnRadius * sin(angle);
    fill(255, 0, 0);
    //ellipse(x, y, 10, 10);
    return new PVector(x, y);
  }
}
