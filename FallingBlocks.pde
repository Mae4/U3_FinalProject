class FallingBlocks
{
  float _x;
  float _y;
  float _velocity;
  float _distance;

  FallingBlocks()
  {
    _velocity = random(1, 5);
    _x = random(0, 640);
    _y = random(-800, -400);
  }

  void Draw()
  {
    fill(255, 255, 255);
    stroke(255, 255, 255);
    ellipse(_x, _y, 30, 30);
    _y= _y + 2 *_velocity;

    if (_y>530)
    {
      _x = random(0, 640);
      _y = -25;
    }
  }
}
