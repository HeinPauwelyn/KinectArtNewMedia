import SimpleOpenNI.*;

public class Line {

	private color[] colors = {#EAD502, #D2A815, #FF3524, #274254, #3E91A0, #9E5A25, #96F00F, #FF060F, #52EF50, #4857FE, #000000};

	public int x1;
	public int x2;
	public int y1;
	public int y2;
	public int xDirection;
	public int yDirection;
	public color linecolor;
  	public int opacity = 255;
  	public Boolean removed = false;
        public float rotation;

	public Line(){
	}

	public SmartLine generate(SimpleOpenNI context){
  
		SmartLine newLine = new SmartLine();

                generatePoint(newLine);
                
            if (checkIfPointInUser(context, newLine.x1, newLine.y1)){

                generateColor(newLine);
          
                if (int(random(0, 2)) == 0) {
                  newLine.xDirection = -int(random(1, 5));
                }
                else {
                  newLine.xDirection = int(random(1, 5));
                }
          
                if (int(random(0, 2)) == 0) {
                  newLine.yDirection = -int(random(1, 5));
                }
                else {
                  newLine.yDirection = int(random(1, 5));
                }
            }
            else {
              newLine.removed = true;
            }

	    return newLine;
	}

        protected void generatePoint(Line newLine) {
            newLine.x1 = int(random(0, 640));
            newLine.x2 = newLine.x1 + int(random(5, 20));
        
            newLine.y1 = int(random(0, 480));
            newLine.y2 = newLine.y1 + int(random(5, 20));
        }

        protected void generateColor(Line newLine) {
          newLine.linecolor = colors[int(random(colors.length))];
        }

	public void drawLine(color selectedColor) {
		
		stroke(selectedColor, opacity);
		strokeWeight(3);
                //rotate(rotation);
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
