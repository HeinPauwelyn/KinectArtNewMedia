public class SmartLine extends Line {
  
  //private color[] redColors = {#FF0000, #DD0000, #990000, #660000, #330000};
  //private color[] greenColors = {#00FF00, #00DD00, #009900, #006600, #003300};
  //private color[] blueColors = {#0000FF, #0000DD, #000099, #000066, #000033};
  
  @Override
  public SmartLine generate(SimpleOpenNI context){
    
    SmartLine line = new SmartLine();
    
    generatePoint(line);
    
    if (checkIfPointInUser(context, line.x1, line.y1)){
    
        generateColor(line);
        
        line.xDirection = (line.x2 - line.x1) / 4;
        line.yDirection = (line.y2 - line.y1) / 4;
    }
    else {
       line.removed = true;
    }
    
    return line;
  }
}
