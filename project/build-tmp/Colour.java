import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

public enum Colour {
  RED({0xFF0000, 0xDD0000, 0x990000, 0x660000, 0x330000}),
  GREEN({0x00FF00, 0x00DD00, 0x009900, 0x006600, 0x003300}),
  BLUE({0x0000FF, 0x0000DD, 0x000099, 0x000066, 0x000033});
  
  private final int[] shades;
  
  public Colour(int[] shades){
    this.shades = shades;
  }
  
  public int[] getShades(){
    return shades;
  }
}
