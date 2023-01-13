class Gem
{
  PVector position;
  PVector dir;
  
  boolean kill = false;
  boolean inRange = false;
  color col;
  int xpValue;

  Gem()
  {
    position = new PVector(random(10000), random(10000));
    col = color(0, 0, 255);
    xpValue = 20;
  }

  void render()
  {
    fill(col);
    ellipse(position.x, position.y, 10, 10);
  }

  void update()
  {
    render();

    if (dist(position.x, position.y, p.position.x, p.position.y) < p.pickUpRadius)
    {
      inRange = true;
    }


    if (inRange == true)
    {
      dir = p.position.copy().sub(position.copy());
      dir.normalize();

      dir.mult(8);

      position.add(dir);

      if (dist(position.x, position.y, p.position.x, p.position.y) < 50)
      {
        kill = true;
      }
    }
  }
}
