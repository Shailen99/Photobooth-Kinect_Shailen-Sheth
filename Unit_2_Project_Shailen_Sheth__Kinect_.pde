
import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;


void setup() {
fullScreen();
kinect = new Kinect(this);
  tracker = new KinectTracker();
}

void draw() {
  background(255);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();

  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  ellipse(v1.x, v1.y, 20, 20);

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20);
  if...
}
/*
//(filter 1: Depth Image)
int x = 700;
int y = 0;
int w = 100;
int h = 100;
//(filter 2: Video Clear Image)
int x2 = 800;
int y2 = 0;
int w2= 100;
int h2 = 100;
color Purple =  color(148, 0, 211);
color Blue = color(42, 94, 178);

 //
  PImage img3 = kinect.getVideoImage();
  image(img3, 0, 0);
  rect(x, y, w, h);
  fill(Blue);
  rect(x2, y2, w2, h2);
  fill(Purple);
    if (mousePressed)
  {
    if (mouseX>= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h);
    {
      PImage img = kinect.getDepthImage();
      image(img, 0, 0);
    }
  }

  if (mousePressed)
  {
    if (mouseX>= x2 && mouseX <= x2+w2 && mouseY >= y2 && mouseY <= y2+h2);
    {
    }
*/