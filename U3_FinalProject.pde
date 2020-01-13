/*

 THURSDAY 10 JAN
 -> Made a starting screen so that you could play again
 -> The font needs to be changed
 
 MONDAY 13 JAN
 -> font has been changed so that it changes conrresponding to the screen - DONE
 -> change the starting points of the snowflakes - DONE
 -> change to a larger threshhold - DONT KNOW
 -> change instruction to match - DONE
 
 
 I used the kinetic to create a game where there are falling snowflakes 
 that you must avoid using you hand, if you don't, you are damanged and
 you health is lowered. Once your health reaches 0 the game will display
 a 'game over' screen, and you can try again by pressing the button.
 
 */

import org.openkinect.freenect.*;
import org.openkinect.processing.*;
PImage SnowflakeOne;
PImage SnowflakeTwo;
PImage SnowflakeThree;
PImage Tree;
int screen;
int startingx = 320;
int startingy = 400;
int gameoverx = 320;
int gameovery = 400;

KinectTracker tracker;
Kinect kinect;
FallingBlocks blocks[] = new FallingBlocks[10];
int health = 500;
PFont font;
PFont mainFont;

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
  mainFont = loadFont("font2.vlw");
}

void draw() 
{
  background(255);

  tracker.track();
  tracker.display();

  if (screen == 0)
  {
    startingScreen();
  }
  if (screen == 1)
  {
    game();
  }
}

void startingScreen() 
{
  textFont(mainFont);
  background(0);
  tracker.display();
  fill(255, 255, 255);
  stroke(255, 255, 255);
  rect(-5, 480, 645, 50);

  fill(255, 0, 0);
  stroke(255, 0, 0);

  PVector v1 = tracker.getPos();

  fill(0, 0, 255);
  stroke(0, 0, 255);
  ellipse(v1.x, v1.y, 50, 50);
  fill(0);
  image(Tree, 490, 380);


  stroke(222, 54, 216);
  fill(210, 54, 216);
  ellipse(startingx, startingy, 30, 30);
  float d = dist(v1.x, v1.y, startingx, startingy);
  strokeWeight(4);
  line(320, 330, 320, 360);
  line(310, 350, 320, 360);
  line(330, 350, 320, 360);
  fill(0);
  text("go over purple button to start :D", 10, 500);
  if (d<25+15)
  {
    screen = 1;
    for (int i=0; i < 10; i++)
  {
    blocks[i] = new FallingBlocks();
  }
  }
}

void game()
{
  textFont(mainFont);
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
  text("Evade the falling snowflakes using your hand!", 10, 500);
  text("Health: "+health, 400, 500);
  if (health<0)
  {
    gameover();
  }
}

void gameover()
{
  background(0);
  fill(255, 0, 0);
  textFont(font);
  text("GAME OVER", 60, 250);
  float d = dist(mouseX, mouseY, gameoverx, gameovery);
  ellipse(gameoverx, gameovery, 30, 30);
  if (mousePressed)
  {
    if (d<15)
    {
      screen = 0;
      health = 500;
    }
  }
  
}
