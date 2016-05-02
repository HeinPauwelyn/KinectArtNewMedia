import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import SimpleOpenNI.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class project extends PApplet {


SimpleOpenNI kinect;

int[] colors = { 0xffE9D33F, 0xffD1A72C, 0xff42919F, 0xffFE3830, 0xffF28425 };

public void setup() {
	
	kinect = new SimpleOpenNI(this);

	kinect.enableDepth();
	kinect.enableRGB();
}

public void draw() {
	kinect.update();
	image(kinect.depthImage(), 0, 0);
	image(kinect.rgbImage(), 640, 0);

	DrawLines();
	delay(1000);
}

public void DrawLines() {
	for(int i = 0; i <= 100; i++) {
    	stroke(colors[PApplet.parseInt(random(colors.length))]);
    	strokeWeight(2);
    	
        line(random(width), random(height), random(width), random(height));
    }
}
  public void settings() { 	size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "project" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
