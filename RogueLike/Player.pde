class Player
{
  boolean up, down, left, right = false;

  PVector position;
  float size = 50;
  float speed;
  
  float xp=0;

  float health;
  
  float pickUpRadius;

  int level;
  int xpNeeded;
  Weapon[] weapons;


  Player()
  {
    position = new PVector(1000, 1000);
    speed = 100;
    health = 100;
    pickUpRadius = 140;
    level = 1;
    xp=0;
    xpNeeded = 1000;
  }


  void Render()
  {
    //Player body
    fill(255,0,255);
    ellipse(position.x, position.y, size, size);
    
   
    
  }
  
  
 
  void Move()
  {
    
    if (up)
    {
      position.y -= speed*deltaTime;
    }
    if(left)
    {
      position.x -= speed*deltaTime;
    }
    if(right)
    {
      position.x += speed*deltaTime;
    }
    if(down)
    {
      position.y += speed*deltaTime;
    }
   
    
  }

  void Update()
  {
    Move();
    Render();
    
    
    if(xp > xpNeeded)
    {
      xp = 0;
      level++;
    }
  }
}
