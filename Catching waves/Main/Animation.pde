class Animation {
  int changeFrameFrames = 0;
  int frameCounter = 0;
  PImage picture = new PImage();
  PImage[] sprites;
  PImage spritesheet;
  
  /*
  prefix = afbeeldingnaam
  DIM = aantal afbeeldingen horizontaal in de spritesheet
  DIMH = aantal afbeeldingen verticaal in de spritesheet
  */
  Animation(String prefix, int DIM, int DIMH) {
    spritesheet = loadImage(prefix);
    sprites = new PImage[DIM*DIMH];
    imageMode(CENTER);
    int W = spritesheet.width/DIM;
    int H = spritesheet.height/DIMH;
    for (int i=0; i<sprites.length; i++) {
      int x = i%DIM*W;
      int y = i/DIM*H;
      sprites[i] = spritesheet.get(x, y, W, H);
    }
  }
  
  /*
  equally = als er in een spritesheet op elke positie een afbeelding staat dan is hij equal, als er eentje ontbreekt dan is hij false.
  
  frameLimit = na hoeveel frames wil je dat de afbeelding veranderd
  */
  void DrawAnimation(boolean equally, int frameLimit, float positionx, float positiony) {
    if(changeFrameFrames == 0)
    {  
     picture = sprites[frameCounter];
     if(frameCounter == sprites.length - 2 && equally == false)
     {
       frameCounter = 0;
     }
     else if(frameCounter >= 0 && frameCounter < sprites.length - 1)
     {
       frameCounter++;
     }
     else
     {
       frameCounter = 0;
     }

    }
    image(picture, positionx, positiony);
    
     changeFrameFrames++; 
    if(changeFrameFrames == frameLimit)
    {
      changeFrameFrames = 0;
    }
  }
}
