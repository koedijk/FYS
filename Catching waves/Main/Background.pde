public class Background {
  float cloudY = random(50);
  float cloudX = random(width);
  float bgSpeed = max(cloudY/12.5, 2);
  PImage background  = loadImage ("animation/waves/Cloud.png");

  
  void drawBackground(){
     image(background, cloudX, cloudY);
     cloudX -= bgSpeed;
     
     if(cloudX+60 <= 0)
     {
       cloudX = width+60;
       cloudY = random(50);
       bgSpeed = max(cloudY/12.5, 2);
     }
  }
}
