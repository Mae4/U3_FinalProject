class FallingBlocks
{
  float _x;
  float _y;
  int _velocity;
  float _distance;

  FallingBlocks()
  {
    _velocity = (int)random(1, 6);
    _x = random(0, 640);
    _y = random(-800, -400);
  }

  void Draw()
  {
    fill(255, 255, 255);
    stroke(255, 255, 255);
    ellipse(_x, _y, 1, 1);
    _y= _y + 2 *_velocity;

    if (_y>530)
    {
      _x = random(0, 640);
      _y = -25;
    }
    
    if (_velocity == 1||_velocity == 2 )
    {
      image(SnowflakeOne, _x-25, _y-35);
    }
    if (_velocity == 3||_velocity == 4 )
    {
      image(SnowflakeTwo, _x-25, _y-35);
    }
    if (_velocity == 5||_velocity == 6 )
    {
      image(SnowflakeThree, _x-25, _y-35);
    }
  }
}
