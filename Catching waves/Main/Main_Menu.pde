color backgroundColor = color(73, 149, 255); 
int layer1 = 450;

public class MainMenu {
  public boolean menuActive = true;
  
  void Setup()
  { 
    background(backgroundColor);
    stroke(0);
    strokeWeight(4);
    fill(255);
    rect(width/2 - layer1 / 2,height/2 - layer1 / 2,layer1,layer1);
    strokeWeight(2);
  }
}
