class Wep_Sniper extends Weapon
{
  Wep_Sniper()
  {
    super();
    damage = 200;
    passThrough = 40;

    projectilePerShot=1;
    projectileSpeed = 1500;
    projectileSize = 10;
    reloadTime = 2000;
    lastTime = 0;
    
    firing = false;
  }
  
  void Fire()
  {
    println("Sniper Fire");
    //projectilePerShot
    for (int i=0; i < projectilePerShot; i++)
    {
      projectileCount++;
      PVector bulletDirection = new PVector(c.x+mouseX, c.y+mouseY).sub(p.position.copy());
      bulletDirection.normalize();
      bulletDirection.mult(projectileSpeed);
      
      
      PVector startPos = p.position.copy();
      println("adding bullet");
      bullets.add(new Projectile(startPos.copy(), bulletDirection.copy(), damage, passThrough, projectileSpeed));
    }

    lastTime = millis();
    firing = false;
  }
}
