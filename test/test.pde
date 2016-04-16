LineRepo repo = new LineRepo();

void setup() {

	size(500, 500);
	makeNewLines();
}

void draw() {

	clear();

	for (Line line : repo.getAllLines()) {
		
		line.drawLine();
		line.move();

		if (line.removed == true) {
			repo.removeLine(line);
		}
	}

	repo.cleanUp();
	makeNewLines();
	
	delay(100);
}

void makeNewLines(){

	for(int i = repo.getAllLines().size(); i < 25; i++){

		Line newLine = new Line().generate();

		newLine.drawLine();
		repo.addLine(newLine);
	}
}