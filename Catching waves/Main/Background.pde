public class Background {
  PImage [] background = new PImage[2];
  int bgSpeed = 2;
  float [] bg = new float [2];{
 
  
for (int i = 0; i < 2; i++)
{
  background [i] = loadImage ("animation/waves/Cloud.png");
  bg[i] = width * i;
} 
  }
  
void drawBackground(){
  for (int j = 0; j < bg.length; j++)
   {
     image(background [j], bg [j], 0);
     bg [j] -= bgSpeed;
     
     if(bg [j] + width <= 0)
     {
       bg[j] = width;
     }
}


}
}
