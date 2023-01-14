class Weapon
{
  int lastTime;
  int reloadTime = 2000;

  int projectileCount =0;
  int projectilePerShot =3;

  int subshotLastTime = 0;
  int subshotReloadTime =100;

  float projectileSpeed = 200;
  float projectileSize = 4;

  int passThrough = 4;

  int damage = 50;

  boolean firing = false;



  Weapon()
  {
    lastTime=0;
    reloadTime = 2000;

    projectileCount =0;
    projectilePerShot =3;

    subshotLastTime = 0;
    subshotReloadTime =100;

    projectileSpeed = 200;


    passThrough = 4;

    damage = 50;

    firing = false;
  }

  void Update()
  {
    println("Base Update");

    if (millis()-lastTime > reloadTime)
    {
      firing = true; 
      lastTime = millis();
    }

    if (firing)
    {
      Fire();
    }
  }

  void Fire()
  {
    println("XXXXXXXBase Wep FireXXXXXXXXX");
    if (projectileCount < projectilePerShot)
    {

      if (millis() - subshotLastTime > subshotReloadTime)
      {
        subshotLastTime = millis();
        bullets.add(new Projectile(damage, passThrough, projectileSpeed));
        projectileCount++;
      }
    } else
    {
      firing = false;
      projectileCount=0;
    }
  }
}
