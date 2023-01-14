class HUD
{  
  boolean pMouse = false;
  HUD()
  {
  }

  void Render()
  {

    //health bar
    fill(0);
    rect(p.position.x-25, p.position.y+30, 50, 10);
    fill(255, 0, 0);
    float hpbar= map(p.health, 0, 100, 0, 50);
    rect(p.position.x-25, p.position.y+30, hpbar, 10);


    //xp bar under
    //xp bar
    fill(0);
    rect(c.x, c.y, width, 25);

    //xp bar
    fill(#61018B);
    float xpBar = map(p.xp, 0, p.xpNeeded, 0, width);
    rect(c.x, c.y, xpBar, 25);

    fill(0);
    textSize(30);
    text(p.level, c.x+width-200, c.y+100);


    DebugHUD();
  }

  void DebugHUD()
  {
    //todo:
    //player health
    //
    



    //PICK UP RADIUS
    fill(0);
    ellipse(c.x+50, c.y+height-50, 100, 100);
    textSize(12);
    fill(255);
    text("PickUpRadius", c.x+50, c.y+height-60);
    textSize(8);
    text(p.pickUpRadius, c.x+50, c.y+height-40);

    //Player Speed
    fill(0);
    ellipse(c.x+150, c.y+height-50, 100, 100);
    textSize(12);
    fill(255);
    text("Player Speed", c.x+150, c.y+height-60);
    textSize(8);
    text(p.speed, c.x+150, c.y+height-40);

    
    //Reload Time
    fill(0);
    ellipse(c.x+250, c.y+height-50, 100, 100);
    textSize(12);
    fill(255);
    text("Reload Time", c.x+250, c.y+height-60);
    textSize(8);
    text(p.weapons.get(0).reloadTime, c.x+250, c.y+height-40);
    
    
    
    //Bullets per shot
    fill(0);
    ellipse(c.x+350, c.y+height-50, 100, 100);
    textSize(12);
    fill(255);
    text("Bullet Per Shot", c.x+350, c.y+height-60);
    textSize(8);
    text(p.weapons.get(0).projectilePerShot, c.x+350, c.y+height-40);



    //bullet damage
    fill(0);
    ellipse(c.x+450, c.y+height-50, 100, 100);
    textSize(12);
    fill(255);
    text("Bullet Damage", c.x+450, c.y+height-60);
    textSize(8);
    text(p.weapons.get(0).damage, c.x+450, c.y+height-40);

    
    
    //bullet pass thru
    fill(0);
    ellipse(c.x+550, c.y+height-50, 100, 100);
    textSize(12);
    fill(255);
    text("bullet pen", c.x+550, c.y+height-60);
    textSize(8);
    text(p.weapons.get(0).passThrough, c.x+550, c.y+height-40);


    //bullet speed
    fill(0);
    ellipse(c.x+650, c.y+height-50, 100, 100);
    textSize(12);
    fill(255);
    text("bullet speed", c.x+650, c.y+height-60);
    textSize(8);
    text(p.weapons.get(0).projectileSpeed, c.x+650, c.y+height-40);


    ButtonClick();
  }



  void ButtonClick()
  {

    float PickUpRadiusX =50;
    float PickUpRadiusY =height-50;
    float PlayerSpeedX =150; 
    float PlayerSpeedY= height-40;
    float WepReloadTimeX =250;
    float WepReloadTimeY=height-50;
    PVector BulletPerShot = new PVector(350, height-50);
    PVector BulletDamage = new PVector(450, height-50);
    PVector BulletPen = new PVector(550, height-50);
    PVector BulletSpeed = new PVector(650, height-50);

    if (mousePressed && pMouse == false)
    {
      if (dist(mouseX, mouseY, PickUpRadiusX, PickUpRadiusY) < 50)
      {
        p.pickUpRadius+=100;
      }

      if (dist(mouseX, mouseY, PlayerSpeedX, PlayerSpeedY) < 50)
      {
        p.speed+=100;
      }
      
      if (dist(mouseX, mouseY, WepReloadTimeX, WepReloadTimeY) < 50)
      {
        p.weapons.get(0).reloadTime-=100;
      }
      
      if (dist(mouseX, mouseY, BulletPerShot.x, BulletPerShot.y) < 50)
      {
        p.weapons.get(0).projectilePerShot+=1;
      }
      
      
      //bullet damage
      if (dist(mouseX, mouseY, BulletDamage.x, BulletDamage.y) < 50)
      {
        p.weapons.get(0).damage+=50;
      }
      
      
      //bullet pen
      if (dist(mouseX, mouseY, BulletPen.x, BulletPen.y) < 50)
      {
        p.weapons.get(0).passThrough+=1;
      }
      
      //bullet speed
      
      if (dist(mouseX, mouseY, BulletSpeed.x, BulletSpeed.y) < 50)
      {
        p.weapons.get(0).projectileSpeed+=100;
      }
    }

    pMouse = mousePressed;
  }


  void renderMinimap(PVector position, color col) {
    int minimapSize = 100;
    float xMin = 0;
    float yMin = 0;
    float xMax = 10000;
    float yMax = 10000;

    // Find the boundaries of the positions

    xMin = min(xMin, position.x);
    yMin = min(yMin, position.y);
    xMax = max(xMax, position.x);
    yMax = max(yMax, position.y);


    pushMatrix();
    translate(c.x+width -200, c.y+200);
    fill(0, 0, 0, 0);
    rect(0, 0, minimapSize, minimapSize);


    float x = map(position.x, xMin, xMax, 0, minimapSize);
    float y = map(position.y, yMin, yMax, 0, minimapSize);

    fill(col);

    noStroke();
    ellipse(x, y, 2, 2);
    stroke(1);
    popMatrix();
  }

  void renderMinimap(PVector position, color col, int size) {
    int minimapSize = 100;
    float xMin = 0;
    float yMin = 0;
    float xMax = 10000;
    float yMax = 10000;

    // Find the boundaries of the positions

    xMin = min(xMin, position.x);
    yMin = min(yMin, position.y);
    xMax = max(xMax, position.x);
    yMax = max(yMax, position.y);


    pushMatrix();
    translate(c.x+width -200, c.y+200);
    fill(0, 0, 0, 0);
    rect(0, 0, minimapSize, minimapSize);


    float x = map(position.x, xMin, xMax, 0, minimapSize);
    float y = map(position.y, yMin, yMax, 0, minimapSize);

    fill(col);
    noStroke();
    ellipse(x, y, size, size);
    stroke(1);
    popMatrix();
  }
}  
