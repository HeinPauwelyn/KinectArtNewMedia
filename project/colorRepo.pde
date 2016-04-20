public class ColorRepo {
  public color selectedColor;
  
  
  public void generateColor() {
     selectedColor = Colour.values().get(int(random(0,3)));
    
  }
}
