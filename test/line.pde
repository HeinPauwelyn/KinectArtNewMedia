public class Line {

	private color[] colors = { #E9D33F, #D1A72C, #42919F, #FE3830, #F28425 };

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

		newLine.x1 = int(random(500));
		newLine.x2 = int(random(newLine.x1 - 50, newLine.x1 + 50));

		newLine.y1 = int(random(500));
		newLine.y2 = int(random(newLine.y1 - 50, newLine.y1 + 50));

	    newLine.linecolor = colors[int(random(colors.length))];

	    newLine.xDirection = int(random(-20, 20));
	    newLine.yDirection = int(random(-20, 20));

	    return newLine;
	}

	public void drawLine() {
		
		stroke(linecolor);
		strokeWeight(2);

		line(x1, y1, x2, y2);
	}

	public void move(){

		x1 = x1 + xDirection;
		x2 = x2 + xDirection;
		y1 = y1 + yDirection;
		y2 = y2 + yDirection;
	}
}