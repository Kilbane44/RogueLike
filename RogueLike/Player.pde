class Player
{
  boolean up, down, left, right = false;

  PVector position;
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
    speed = 4;
    health = 100;
    pickUpRadius = 140;
    level = 1;
    xp=0;
    xpNeeded = 1000;
  }


  void render()
  {
    //Player body
    fill(255,0,255);
    ellipse(position.x, position.y, 50, 50);
    
    //health bar
    rect(position.x-25, position.y+30,50,10);
    
    //xp bar
    float xpBar = map(xp,0,xpNeeded,0,width);
    rect(c.x,c.y, xpBar,50);
    
    
  }
  void move()
  {
    if (up)
    {
      position.y -= speed;
    }
    if(left)
    {
      position.x -= speed;
    }
    if(right)
    {
      position.x += speed;
    }
    if(down)
    {
      position.y += speed;
    }
   
    
  }

  void update()
  {
    move();
    render();
    
    
    if(xp > xpNeeded)
    {
      xp = 0;
      level++;
    }
  }
}
