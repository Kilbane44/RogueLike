class Enemy
{
  PVector position;
  PVector dir;
  PVector velocity;
  
  float health=100;
  float damage = 1;
  float speed= 2;
  float spawnRadius = 1300;
  boolean touchingPlayer = false;
  float size = 40;
  boolean kill;
  
  int xpValue = 20;
  Enemy()
  {
    position = randomPointOnCircle();
    velocity = new PVector(0,0);
    kill = false;
  }

  void Render()
  {
    fill(255, 0, 0);
    ellipse(position.x, position.y, size, size);
  }
  void Move()
  {
    if (dist(position.x, position.y, p.position.x, p.position.y)>size/2+p.size/2-5)
    {
      dir = p.position.copy().sub(position.copy());

      dir.normalize();
      dir.mult(speed*deltaTime);
      velocity.add(dir);
      //velocity.mult(speed*deltaTime);
      velocity.limit(speed);
      
    } else
    {
      touchingPlayer=true;
      Bounce(p.position);
      
    }
    position.add(velocity);
  }
  void Update()
  {
    Move();
    Render();

    if (health <=0)
    {
      kill = true;
    }
  } //<>//
  
  
  void Die()
  {
    if(random(1)>.5)
    {
      gems.add(new Gem(position,color(0,0,255),xpValue));
    }
  }

  void Bounce(PVector bounceOff)
  {
    velocity = new PVector(0,0,0);
    dir = position.copy().sub(bounceOff.copy());
    dir.normalize();
    dir.mult(3);
    velocity.add(dir);
    velocity.limit(speed);
  }
  
  void BounceEnemy(PVector bounceOff)
  {
    velocity = new PVector(0,0,0);
    dir = position.copy().sub(bounceOff.copy());
    dir.normalize();
    dir.mult(.4);
    velocity.add(dir);
    velocity.limit(speed);
    println(velocity);
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
