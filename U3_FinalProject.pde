/*

 Use the kinetic and create a place where there are falling celing peices
 and you must move to avoid them, otherwise you are damaged if they hit you.
 You also have a health meter which when it reaches 0 gives you a game over
 screen.
 
 */

import org.openkinect.freenect.*;
import org.openkinect.processing.*;


KinectTracker tracker;
Kinect kinect;
FallingBlocks blocks[] = new FallingBlocks[10];
int health = 500;
PFont font;

void setup() 
{
  size(640, 530);
  kinect = new Kinect(this);
  tracker = new KinectTracker();

  for (int i=0; i < 10; i++)
  {
    blocks[i] = new FallingBlocks();
  }
  font = loadFont("GameOver.vlw");
}

void draw() 
{
  background(255);

  tracker.track();
  tracker.display();

  PVector v1 = tracker.getPos();
  //fill(50, 100, 250, 200);
  fill(0, 0, 255);
  stroke(0, 0, 255);
  ellipse(v1.x, v1.y, 50, 50);
  fill(0);

  for (int i=0; i < 10; i++)
  {
    blocks[i].Draw();
    float d = dist(v1.x, v1.y, blocks[i]._x, blocks[i]._y);
    if (d<25+15)
    {
      background(134, 3214, 13);
      health--;
    }
  }

  fill(255, 255, 255);
  stroke(255, 255, 255);
  rect(-5, 480, 645, 50);
  fill(0);
  text("Evade the falling blocks using your hand!", 10, 500);
  text("Health: "+health, 400, 500);

  if (health<0)
  {
    background(0);
    fill(255, 0, 0);
    textFont(font);
    text("GAME OVER", 60, 250);
  }
}
