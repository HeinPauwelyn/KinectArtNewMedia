import SimpleOpenNI.*;
import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

public class Line extends PApplet {
  
    public int x1;
    public int x2;
    public int y1;
    public int y2;
    public int xDirection;
    public int yDirection;
    public int sat;
    public int bright;
    public int opacity = 255;
    public boolean removed = false;

    public Line(SimpleOpenNI context) {
      generate(context);
    }

    public void generate(SimpleOpenNI context){
  
        generatePoint();
                    
        if (checkIfPointInUser(context, x1, y1)){
                    
            generateColor();
                        
            xDirection = (x2 - x1) / 4;
            yDirection = (y2 - y1) / 4;
        }
        else {
            removed = true;
        }  
    }

    protected void generatePoint() {
        x1 = (int)random(0, 640);
        x2 = x1 + (int)random(5, 20);
        
        y1 = (int)random(0, 480);
        y2 = y1 + (int)random(5, 20);
    }

    protected void generateColor() {
        sat = (int)random(127,255);
        bright = (int)random(127,255);
    }

    public void drawLine(int hue) {	
	stroke(hue, sat, bright, opacity);
	strokeWeight(3);
	line(x1, y1, x2, y2);
    }

    public void move(SimpleOpenNI context){

	x1 = x1 + xDirection;
	x2 = x2 + xDirection;
	y1 = y1 + yDirection;
	y2 = y2 + yDirection;

        if (!checkIfPointInUser(context, x1, y1) || !checkIfPointInUser(context, x2, y2)){
            fadeOut();
        }

    }

    private void fadeOut(){

	opacity -= 100;

	if (opacity <= 0) {
          removed = true;
          xDirection = 0;
          yDirection = 0;
	}
    }

    private void fadeIn(){
	opacity += 100;
    }

    protected Boolean checkIfPointInUser(SimpleOpenNI context, int x, int y) {

        try {
            int[] userMap = context.userMap();

            int index = x + y * context.depthWidth();
            if(userMap.length > index){
                return userMap != null && userMap[index] > 0;
            }
            return false; 
        }
        catch(Exception ex) { return false; }
    }
}
