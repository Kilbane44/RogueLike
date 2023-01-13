class HUD
{  
  boolean pMouse = false;
  HUD()
  {
  }

  void Render()
  {

    //health bar
    fill(255, 0, 0);
    rect(p.position.x-25, p.position.y+30, 50, 10);

    //xp bar
    fill(#61018B);
    float xpBar = map(p.xp, 0, p.xpNeeded, 0, width);
    rect(c.x, c.y, xpBar, 50);

    fill(0);
    textSize(30);
    text(p.level, c.x+width-200, c.y+100);


    DebugHUD();
  }

  void DebugHUD()
  {
    

    
    
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
    
    
    
    ButtonClick();
  }



  void ButtonClick()
  {
    
    float PickUpRadiusX =50;
    float PickUpRadiusY =height-50;
    float PlayerSpeedX =150; 
    float PlayerSpeedY= height-40;

    if (mousePressed && pMouse == false)
    {
      if (dist(mouseX, mouseY, PickUpRadiusX, PickUpRadiusY) < 50)
      {
        p.pickUpRadius+=100;
      }
      
      if (dist(mouseX, mouseY, PlayerSpeedX,PlayerSpeedY) < 50)
      {
        p.speed+=100;
      }
    }
    
    pMouse = mousePressed;
  }
}  
