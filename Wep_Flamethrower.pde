class Wep_Flamethrower extends Weapon
{




  Wep_Flamethrower()
  {
    super();
    damage = 20;
    passThrough = 4;

    projectilePerShot=10;
    reloadTime = 4000;
    lastTime = 0;
  }

  void Fire()
  {
    println("BABABABABA");
    for (int i=0; i < projectilePerShot; i++)
    {
      PVector bulletDirection = new PVector(c.x+mouseX, c.y+mouseY).sub(p.position.copy());
      
      bulletDirection.normalize();
      bulletDirection.mult(100);
      bulletDirection.x+=random(-40, 40);
      bulletDirection.y+=random(-40, 40);
      println("adding bullet");
      bullets.add(new Projectile(p.position.copy(), bulletDirection.copy(), damage, passThrough, projectileSpeed));
    }
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
