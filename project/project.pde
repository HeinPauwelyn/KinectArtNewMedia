import SimpleOpenNI.*;
SimpleOpenNI kinect;

LineRepo lineRepo = new LineRepo();
ColorRepo colorRepo = new ColorRepo();

void setup() {
	size(640, 480);
	kinect = new SimpleOpenNI(this);

	kinect.enableDepth();
	kinect.enableRGB();
        kinect.enableUser();
        kinect.alternativeViewPointDepthToImage();
}

void draw() {
        clear();
        
        colorRepo.generateColor();
        
  	kinect.update();
	//image(kinect.depthImage(), 0, 0);
 
        for (SmartLine line : lineRepo.getAllLines()) {
              
          if (line.removed == true) {
            lineRepo.removeLine(line);
          }
          else
          {
            line.drawLine(colorRepo.selectedColor);
          line.move(kinect);
          }
        }
      
        lineRepo.cleanUp();
        makeNewLines();
}

void makeNewLines(){
  for(int i = lineRepo.getAllLines().size(); i < 200; i++){

    SmartLine newLine = new SmartLine().generate(kinect);

    if (newLine.removed == false){
      newLine.drawLine(colorRepo.selectedColor);
      lineRepo.addLine(newLine);
    }
  }
}
