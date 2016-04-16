import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class test extends PApplet {

LineRepo repo = new LineRepo();

public void setup() {

	

	for(int i = 0; i < 50; i++){
		Line line = new Line().generate();

		line.drawLine();
		repo.addLine(line);
	}

}

public void draw() {

	clear();

	for (Line line : repo.getAllLines()) {
		
		line.drawLine();
		line.move();
	}
	
	delay(100);
}
public class Line {

	private int[] colors = {0xffEAD502, 0xffD2A815, 0xffFF3524, 0xff274254, 0xff3E91A0, 0xff9E5A25, 0xff96F00F, 0xffFF060F, 0xff52EF50, 0xff4857FE, 0xff000000};

	public int x1;
	public int x2;
	public int y1;
	public int y2;
	public int xDirection;
	public int yDirection;
	public int linecolor;

	public Line(){
	}

	public Line generate(){

		Line newLine = new Line();

		newLine.x1 = PApplet.parseInt(random(400));
		newLine.x2 = newLine.x1 + PApplet.parseInt(random(10, 50));

		newLine.y1 = PApplet.parseInt(random(500));
		newLine.y2 = newLine.y1 + PApplet.parseInt(random(-50, 50));

	    newLine.linecolor = colors[PApplet.parseInt(random(colors.length))];

	    if (PApplet.parseInt(random(0, 2)) == 0) {
	    	newLine.xDirection = -PApplet.parseInt(random(5, 10));
	    }
	    else {
	    	newLine.xDirection = PApplet.parseInt(random(5, 10));
	    }

	    if (PApplet.parseInt(random(0, 2)) == 0) {
	    	newLine.yDirection = -PApplet.parseInt(random(5, 10));
	    }
	    else {
	    	newLine.yDirection = PApplet.parseInt(random(5, 10));
	    }

	    return newLine;
	}

	public void drawLine() {
		
		stroke(linecolor);
		strokeWeight(3);

		line(x1, y1, x2, y2);
	}

	public void move(){

		x1 = x1 + xDirection;
		x2 = x2 + xDirection;
		y1 = y1 + yDirection;
		y2 = y2 + yDirection;

		if (x1 <= 0 || x1 >= 500 || x2 <= 0 || x2 >= 500) {
			xDirection = -xDirection;
		}

		if (y1 <= 0 || y1 >= 500 || y2 <= 0 || y2 >= 500) {
			yDirection = -yDirection;
		}
	}
}
public class LineRepo {

	ArrayList<Line> list = new ArrayList<Line>();

	public void addLine(Line line){

		list.add(line);
	}

	public ArrayList<Line> getAllLines(){
		return list;
	}
}

  public void settings() { 	size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "test" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
