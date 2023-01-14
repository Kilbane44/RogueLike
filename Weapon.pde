class Weapon
{
  int lastTime;
  int reloadTime = 2000;
  
  int projectileCount =0;
  int projectilePerShot =3;
  
  int subshotLastTime = 0;
  int subshotReloadTime =100;
  
  
  int passThrough = 1;
  
  int damage = 1;
  
  boolean firing = false;
  
  
  
  Weapon()
  {
    
  }
  
  void Update()
  {
    if(millis()-lastTime > reloadTime)
    {
      firing = true; 
      lastTime = millis();
    }
    
    if(firing)
    {
      Fire();
    }
  }
  
  void Fire()
  {
    if(projectileCount < projectilePerShot)
    {
      
      if(millis() - subshotLastTime > subshotReloadTime)
      {
        subshotLastTime = millis();
        bullets.add(new Projectile());
        projectileCount++;
      }
    }
    else
    {
      firing = false;
      projectileCount=0;
    }
    
  }
  
}
