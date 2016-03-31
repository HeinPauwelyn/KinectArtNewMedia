LineRepo repo = new LineRepo();

void setup() {

	size(500, 500);

	for(int i = 0; i < 50; i++){
		Line line = new Line().generate();

		line.drawLine();
		repo.addLine(line);
	}

}

void draw() {

	clear();

	for (Line line : repo.getAllLines()) {
		
		line.drawLine();
		line.move();
	}
	
	delay(100);
}