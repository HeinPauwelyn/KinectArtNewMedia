import SimpleOpenNI.*;
SimpleOpenNI kinect;

LineRepo lineRepo = new LineRepo();
int hue;

void setup() {
	size(640, 480);
        colorMode(HSB);
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
 
        for (Line line : lineRepo.getAllLines()) {
              
          if (line.removed == true) {
            lineRepo.removeLine(line);
          }
          else
          {
            changeHue();
            
            line.drawLine(hue);
            line.move(kinect);
          }
        }
      
        lineRepo.cleanUp();
        makeNewLines();
}

void changeHue(){

  if (int(random(100)) == 20){
  
  if (hue++ > 255){
              hue = 0;
            }
  }
}

void makeNewLines(){
  for(int i = lineRepo.getAllLines().size(); i < 200; i++){

    Line newLine = new Line().generate(kinect);

    if (newLine.removed == false){
      changeHue();
      
      newLine.drawLine(hue);
      lineRepo.addLine(newLine);
    }
  }
}
