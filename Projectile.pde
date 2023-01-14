class Projectile
{
  PVector position;
  PVector dir;
  PVector velocity;
  float size = 10;
  float speed = 200;
  float damage = 50;
  int owner =0;
  boolean kill=false;
  int spawnTime = millis();
  int lifeTime = 5000;
  
  int passCount = 0;
  int passThrough = 2;
  
  
  ArrayList<Integer> hitIndecies = new ArrayList();
  
  Projectile()
  {
    velocity = new PVector(0,0);
    position = p.position.copy();
    dir = new PVector(c.x+mouseX, c.y+mouseY).sub(position.copy());
    dir.normalize();
    dir.mult(speed*deltaTime);
    velocity.add(dir);
    
  }
  
  Projectile(float _damage)
  {
    this.damage = _damage;
    velocity = new PVector(0,0);
    position = p.position.copy();
    dir = new PVector(c.x+mouseX, c.y+mouseY).sub(position.copy());
    dir.normalize();
    dir.mult(speed*deltaTime);
    velocity.add(dir);
    
  }
  
  Projectile(float _damage, int _pen, float _speed)
  {
    speed = _speed;
    passThrough= _pen;
    this.damage = _damage;
    velocity = new PVector(0,0);
    position = p.position.copy();
    dir = new PVector(c.x+mouseX, c.y+mouseY).sub(position.copy());
    dir.normalize();
    dir.mult(speed*deltaTime);
    velocity.add(dir);
    
  }
  
  Projectile(PVector _pos, PVector _dir,float _damage, int _pen, float _speed)
  {
    speed = _speed;
    passThrough= _pen;
    this.damage = _damage;
    velocity = new PVector(0,0);
    position = _pos.copy();
    dir = _dir.copy();
    dir.normalize();
    dir.mult(speed*deltaTime);
    velocity.add(dir);
    
  }
  Projectile(PVector _pos, PVector _dir,float _damage, int _pen, float _speed, float _size)
  {
    size = _size;
    speed = _speed;
    passThrough= _pen;
    this.damage = _damage;
    velocity = new PVector(0,0);
    position = _pos.copy();
    dir = _dir.copy();
    dir.normalize();
    dir.mult(speed*deltaTime);
    velocity.add(dir);
    
  }
  
  
  void Render()
  {
    fill(0,255,0);
    ellipse(position.x, position.y, size,size);
    
  }
  void Move()
  {
    dir.normalize();
    dir.mult(speed);
    velocity.add(dir);
    velocity.limit(speed*deltaTime);
    position.add(velocity);
  }
  
  void Update()
  {
    Move();
    Render();
    
    
    if(millis()-spawnTime > lifeTime)
    {
      kill = true;
    }
  }
  
  
  boolean IsTouchingEnemy(Enemy e)
  {
    if(dist(position.x, position.y,e.position.x, e.position.y)<(e.size/2+size/2))
    {
      return true;
    }
    return false;
  }
}
