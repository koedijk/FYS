public class Rythmic_Objects{
    PImage image;
    int x = 1000,y;
    int hor = 70,ver = 80;
    int correctInput;
    
    public int imageNumber= 0;

    public void SpawnImage() {
        imageLoad();
        image(image,x,y,hor,ver);
    }

    private void imageLoad() {
        switch(imageNumber){
          case(1):
          image = loadImage("Images/Left.png");
          correctInput = 37;
          break;
          case(2):
          image = loadImage("Images/Right.png");
          correctInput = 39;
          break;
          case(3):
          image = loadImage("Images/Up.png");
          correctInput = 38;
          break;
          case(4):
          image = loadImage("Images/Down.png");
          correctInput = 40;
          break;
     }
 }
}
