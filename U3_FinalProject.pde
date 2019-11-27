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


void setup() {
  size(700, 500);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  
}
float x = 400;
float y = 400;
void draw() {
  background(255);

  tracker.track();
  tracker.display();

  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  fill(0,0,255);
  stroke(0,0,255);
  ellipse(v1.x, v1.y, 50, 50);
  float d = dist(v1.x, v1.y, x, y);
  fill(0);
  text("Evade the falling blocks using your hand!", 10, 500);
  
  fill(255,255,0);
  stroke(255,255,0);
  ellipse(x,y,50,50);
}
