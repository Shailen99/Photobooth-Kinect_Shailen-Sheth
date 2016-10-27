import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;
Kinect kinect;
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
void setup()
{
  fullScreen(P3D);
  kinect = new Kinect(this);
  kinect.initDepth();
  kinect.enableIR(true);
}
void draw()
{
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
  }