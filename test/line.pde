public class Line {

	private color[] colors = {#EAD502, #D2A815, #FF3524, #274254, #3E91A0, #9E5A25, #96F00F, #FF060F, #52EF50, #4857FE, #000000};

	public int x1;
	public int x2;
	public int y1;
	public int y2;
	public int xDirection;
	public int yDirection;
	public color linecolor;

	public Line(){
	}

	public Line generate(){

		Line newLine = new Line();

		newLine.x1 = int(random(400));
		newLine.x2 = newLine.x1 + int(random(10, 50));

		newLine.y1 = int(random(500));
		newLine.y2 = newLine.y1 + int(random(-50, 50));

	    newLine.linecolor = colors[int(random(colors.length))];

	    if (int(random(0, 2)) == 0) {
	    	newLine.xDirection = -int(random(5, 10));
	    }
	    else {
	    	newLine.xDirection = int(random(5, 10));
	    }

	    if (int(random(0, 2)) == 0) {
	    	newLine.yDirection = -int(random(5, 10));
	    }
	    else {
	    	newLine.yDirection = int(random(5, 10));
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