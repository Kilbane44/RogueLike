class Wep_Shotgun extends Weapon
{




  Wep_Shotgun()
  {
    super();
    damage = 20;
    passThrough = 4;

    projectilePerShot=15;
    reloadTime = 4000;
    lastTime = 0;
    projectileSpeed = 200;
    projectileSize = 4;
    firing = false;
  }
  
  void Update()
  {
    println("SHOTGUN UPDATE");
    super.Update();
  }
  void Fire()
  {
    println("Shotgun Fire");
    //projectilePerShot
    for (int i=0; i < projectilePerShot; i++)
    {
      projectileCount++;
      PVector bulletDirection = new PVector(c.x+mouseX, c.y+mouseY).sub(p.position.copy());
      bulletDirection.normalize();
      bulletDirection.mult(100);
      bulletDirection.x+=random(-20, 20);
      bulletDirection.y+=random(-20, 20);
      
      PVector startPos = p.position.copy();
      startPos.x+=random(-10, 10);
      startPos.y+=random(-10, 10);
      println("adding bullet");
      bullets.add(new Projectile(startPos.copy(), bulletDirection.copy(), damage, passThrough, projectileSpeed));
    }

    lastTime = millis();
    firing = false;
  }

  // For when enemies shoot

  //  void Fire(PVector pos, PVector target)
  //{
  //  println("BABABABABA");
  //  if (millis() - lastTime > reloadTime)
  //  {
  //    for (int i=0; i < 10; i++)
  //    {
  //      PVector bulletDirection = target.copy().sub(pos.copy());
  //      bulletDirection.x+=random(-40, 40);
  //      bulletDirection.y+=random(-40, 40);

  //      lastTime = millis();
  //      bullets.add(new Projectile(p.position, new PVector(mouseX,mouseY).sub(p.position.copy()),20,4,250));
  //    }
  //  }
}
