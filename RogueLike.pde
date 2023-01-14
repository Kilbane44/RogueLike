//Other game idea. Whole world is as big as minimap size. 
//Enormouse size, zoom in and out mean game mechanic

Camera c = new Camera(1000, 1000, 4);
HUD hud = new HUD();
Player p = new Player();

float deltaTime = 0;
int pTime = 0;



ArrayList<Gem> gems = new ArrayList();
ArrayList<Enemy> enemies = new ArrayList();
ArrayList<Projectile> bullets = new ArrayList();
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
  UpdateProjectiles();
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
  //Update palyer
  p.Update();
  //add them to minimap
  hud.renderMinimap(p.position,color(255,0,255),4);
  
  //camera follow player
  c.UpdateCameraPosition(p.position);
}


void UpdateProjectiles()
{
  //manage all projectiles in the bullets arraylist
  for (int i=bullets.size()-1; i >= 0; i--)
  {
    Projectile b = bullets.get(i);

    //update bullet
    b.Update();
    
    
    
    //if the bullet if flagged to be killed, kill it.
    if (b.kill)
    {
      bullets.remove(i);
      continue;
    }
    
    //loop through all enemies
    for (int j=enemies.size()-1; j>=0; j--)
    {
      Enemy e = enemies.get(j);
      //if the bullet is touching the enemy
      if (b.IsTouchingEnemy(e))
      {
        
        //if they can still pass thru more enemies
        if (b.passCount < b.passThrough)
        {
          
          //if they have never hit this enemy before
          if (!b.hitIndecies.contains(j))
          {
            //remember this enemies ID,
            b.hitIndecies.add(j);
            //increase the number passed thru,
            b.passCount++;
            
            //deal damage to enemy
            e.health-=b.damage;
          }
        } else
        {
          //else kill it
          bullets.remove(i);
          break;
        }
      }
    }
  }
}

void UpdateEnemies()
{
  //Update all enemies in the enemies arraylist
  for (int i=enemies.size()-1; i >=0; i--)
  {
    Enemy e = enemies.get(i);

    //if the enemy if flagged to be killed, kill it.
    if (e.kill)
    {
      e.Die();
      enemies.remove(i);
      continue;
    }
    //update enemy
    e.Update();
    
    //add enemy to the minimap
    hud.renderMinimap(e.position,color(255,0,0));
    
    //if the enemy touches the player, bounce and do damage
    if (e.touchingPlayer)
    {
      e.touchingPlayer = false;
      p.health -= e.damage;
    }

    //If an enemy touches antoher enemy, bounce a little
    for (int j = enemies.size()-1; j >=0; j--) {
      if (i != j) {
        Enemy e2 = enemies.get(j);
        PVector distance = PVector.sub(e.position, e2.position);
        float d = distance.mag();
        if (d < e.size/2 + e2.size/2) {
          distance.normalize();
          e.BounceEnemy(e2.position);
          //e2.BounceEnemy(e.position);
        }
      }
    }
  }
}

//Update Gems
void UpdateGems()
{
  for (int i=gems.size()-1; i >=0; i--)
  {
    Gem g = gems.get(i);
    //if the gems are on screen render them
    if (dist(g.position.x, g.position.y, p.position.x, p.position.y) < 2000 || g.inRange)
    {
      g.Update();
      //hud.renderMinimap(g.position,color(0,0,255),1);
    }

    //if the gems are marked to kill, give xp and remove
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
  if (key == ' ')
  {
    //spawn enemy
    for (int i=0; i < 100; i++)
    {
      enemies.add(new Enemy());
    }
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

void mousePressed()
{
  if (mouseButton == RIGHT)
  {
    p.FireWeapons();
  }
}

void UpdateCamera()
{
  c.Update();
  c.Apply();
}
