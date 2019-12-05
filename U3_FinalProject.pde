/*

 I used the kinetic to create a game where there are falling snowflakes 
 that you must avoid using you hand, if you don't, you are damanged and
 you health is lowered. Once your health reaches 0 the game will display
 a 'game over' screen.
 
 */

import org.openkinect.freenect.*;
import org.openkinect.processing.*;
PImage SnowflakeOne;
PImage SnowflakeTwo;
PImage SnowflakeThree;
PImage Tree;

KinectTracker tracker;
Kinect kinect;
FallingBlocks blocks[] = new FallingBlocks[10];
int health = 500;
PFont font;

void setup() 
{
  SnowflakeOne = loadImage("snowflakeOne.png");
  SnowflakeOne.resize(50, 50);
  SnowflakeTwo = loadImage("snowflakeTwo.png");
  SnowflakeTwo.resize(50, 50);
  SnowflakeThree = loadImage("snowflakeThree.png");
  SnowflakeThree.resize(50, 50);
  Tree = loadImage("tree.png");
  Tree.resize(130, 150);
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
  image(Tree, 490, 380);
}
