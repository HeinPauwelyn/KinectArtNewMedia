import SimpleOpenNI.*;
SimpleOpenNI kinect;

LineRepo repo = new LineRepo(); 

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
        
  	kinect.update();
	//image(kinect.depthImage(), 0, 0);
 
        for (Line line : repo.getAllLines()) {
          
          
      
          if (line.removed == true) {
            repo.removeLine(line);
          }
          else
          {
            line.drawLine();
          line.move(kinect);
          }
        }
      
        repo.cleanUp();
        makeNewLines();
}

void makeNewLines(){
  for(int i = repo.getAllLines().size(); i < 200; i++){

    Line newLine = new Line().generate(kinect);

    if (newLine.removed == false){
      newLine.drawLine();
      repo.addLine(newLine);
    }
  }
}
