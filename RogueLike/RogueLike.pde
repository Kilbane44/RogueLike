Camera c = new Camera(1000, 1000, 4);
HUD hud = new HUD();
Player p = new Player();

float deltaTime = 0;
int pTime = 0;
ArrayList<Gem> gems = new ArrayList();
ArrayList<Enemy> enemies = new ArrayList();
void setup()
{
  size(1800, 900);
  for (int i=0; i < 10000; i++)
  {
    gems.add(new Gem());
  }
  
  textAlign(CENTER);
}

void draw()
{
  background(0);

  fill(255);
  //Shift Camera to location
  UpdateCamera();


  DrawLevel();
  RenderHUD();
  UpdateGems();
  UpdateEnemies();
  UpdatePlayer();
  
  
  deltaTime = ((float)(millis()-pTime))/1000;
  pTime = millis();
}











//Level Render
void DrawLevel()
{
  textSize(12);
  for (int i=0; i < 100; i++)
  {
    for (int j=0; j < 100; j++)
    {
      if (dist(i*100, j*100, p.position.x, p.position.y)< width)
      {
        rect(i*100, j*100, 100, 100);
        fill(0);
        text(i*j, i*100, j*100);
        fill(255);
      }
    }
  }
}


void RenderHUD()
{
  hud.Render();
}









void UpdatePlayer()
{
    p.Update();
  c.UpdateCameraPosition(p.position);
}


void UpdateEnemies()
{
  for(Enemy e: enemies)
  {
    e.Update();
  }
}

//Update Gems
void UpdateGems()
{
  for (int i=gems.size()-1; i >=0; i--)
  {
    Gem g = gems.get(i);
    if (dist(g.position.x, g.position.y, p.position.x, p.position.y) < 2000 || g.inRange)
    {
      g.Update();
    }


    if (g.kill)
    {
      p.xp += g.xpValue;
      gems.remove(i);
    }
  }
}



//Key Board
void keyPressed()
{
  if (key == 'w') {
    p.up = true;
    c.up = true;
  }
  if (key == 'a')
  {
    p.left = true;
    c.left = true;
  }
  if (key == 'd')
  {
    p.right = true;
    c.right = true;
  }
  if (key == 's')
  {
    p.down = true;
    c.down = true;
  }
  
  
  
  
  //SPACE
  if(key == ' ')
  {
    //spawn enemy
    enemies.add(new Enemy());
  }
}




void keyReleased()
{
  if (key == 'w') {
    p.up = false;
    c.up = false;
  }
  if (key == 'a')
  {
    p.left = false;
    c.left = false;
  }
  if (key == 'd')
  {
    p.right = false;
    c.right = false;
  }
  if (key == 's')
  {
    p.down = false;
    c.down = false;
  }
}



void UpdateCamera()
{
  c.Update();
  c.Apply();
}
