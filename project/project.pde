import SimpleOpenNI.*;

SimpleOpenNI kinect;
LineRepo lineRepo;

int hue;
boolean manual = true;
boolean save = false;

void setup() {
  size(640, 480);
   
  colorMode(HSB);

  lineRepo = LineRepo.getInstance();
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  kinect.enableUser();
}

void draw() {
  clear();
  
  background(58, 0, 200);
  kinect.update();
 
  for (Line line : LineRepo.instance.getAllLines()) {

    changeHue();
    
    if (line.removed == true) {
      LineRepo.instance.removeLine(line);
    }
    else
    {       
      line.drawLine(hue);
      line.move(kinect);
    }
  }  

  LineRepo.instance.cleanUp();
  makeNewLines();
  
  if(!save) {
    
    textSize(15);
    fill(0, 0, 360);
    
    text("Press SHIFT to change:", 10, 20);
    text("Press UP or DOWN to change color", 10, 40);
    text("Press ENTER or RETURN for a picture", 10, 60);
    
    if(manual) {
      text("Manually", 180, 20); 
    }
    else {
      text("Automatic", 180, 20); 
    }
  } else {
    saveFrame("capture####.png");
    save = false;  
  }
}

void changeHue(){
  if(!manual) {
    if (int(random(100)) == 20){  
      if (hue++ > 255){
        hue = 0;
      }
    }
  }
}

void makeNewLines(){
  for(int i = LineRepo.instance.getAllLines().size(); i < 400; i++){

    Line newLine = new Line(kinect);

    if (newLine.removed == false){
      newLine.drawLine(hue);
      LineRepo.instance.addLine(newLine);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if(keyCode == SHIFT) {
      manual = !manual;
    } 
    else if(keyCode == UP) {
      hue++;
    }
    else if(keyCode == DOWN) {
      hue--;
    }
  }
  
  if(key == ENTER || key == RETURN) {
    save = true;
  }
}
