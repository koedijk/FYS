Animation characterAnimation;

public class Character {  
  
  float frameCounter = 0;
  float characterPositionx = 100;
  float characterPositiony = lane2;
  
  
  public void setupCharacter() {
    characterAnimation = new Animation("gif/surfer/surfer", 9);
  }
  
  public void moveCharacter() {
    if (key == up) {
      if(characterPositiony == lane3)
      {
        characterPositiony = lane2;
      }
      else if(characterPositiony == lane2)
      {
        characterPositiony = lane1;
      }
    } 
    else if (key == down) {
      if(characterPositiony == lane1)
      {
        characterPositiony = lane2;
      }
      else if(characterPositiony == lane2)
      {
        characterPositiony = lane3;
      }
    }
  }
  
  public void drawCharacter(){
    characterAnimation.display(characterPositionx-characterSpriteWidth/2, characterPositiony-characterSpriteHeight/2-25);
    
  }
}
