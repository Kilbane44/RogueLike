class Gem
{
  PVector position;
  PVector dir;
  
  boolean kill = false;
  boolean inRange = false;
  color col;
  int xpValue;

  float flySpeed = 400;
  
  Gem()
  {
    position = new PVector(random(10000), random(10000));
    col = color(0, 0, 255);
    xpValue = 20;
  }
  
  Gem(PVector _p, color _c, int _xp)
  {
    position = _p.copy();
    col = _c;
    xpValue = _xp;
  }

  void Render()
  {
    fill(col);
    ellipse(position.x, position.y, 10, 10);
  }

  void Update()
  {
    Render();

    if (dist(position.x, position.y, p.position.x, p.position.y) < p.pickUpRadius)
    {
      inRange = true;
    }


    if (inRange == true)
    {
      dir = p.position.copy().sub(position.copy());
      dir.normalize();
  
      //Fly towards player at this speed /sec
      dir.mult(flySpeed*deltaTime);

      position.add(dir);

      if (dist(position.x, position.y, p.position.x, p.position.y) < 50)
      {
        kill = true;
      }
    }
  }
}
