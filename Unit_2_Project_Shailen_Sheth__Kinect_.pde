import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;
float newPointx;
float newPointx2;
float newPointy2;
float newPointy;
int Filter1x = 50;
int Filter1y = 100;
int Filter2x = 50;
int Filter2y = 200;

Minim minim;
AudioPlayer player;
AudioPlayer player2;



void setup() {
  fullScreen();
  minim = new Minim(this);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  player = minim.loadFile("Camera shutter sound effect.mp3");
  player2 = minim.loadFile("Bee Gees - Stayin' Alive (1977).mp3");
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
  newPointx = map(v1.x, 0, 640, 0, width);
  newPointy = map(v1.y, 0, 480, 0, height);
  ellipse(newPointx, newPointy, 20, 20);
  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20);
  ellipse(Filter1x, Filter1y, 100, 100);
  fill(100, 250, 50, 200);
  ellipse(Filter2x, Filter2y, 100, 100);
  fill(205, 50, 198);

  if (dist(Filter1x, Filter1y, newPointx, newPointy) < 60)
  {
    saveFrame("img-###.png");
    player.play();
  }
  if (dist(Filter2x, Filter2y, newPointx, newPointy) < 60)
  {
    saveFrame("img-###.png");
    player.play();
    tint(random(255),random(255),random(255), 126);
    player2.play();
  }
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