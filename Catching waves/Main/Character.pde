Animation characterAnimation;

public class Character
{
  final char up = 'z';
  final char down = 'x';
  final float lane1 = height / 2 + 30;
  final float lane2 = height / 2 + 130;
  final float lane3 = height / 2 + 230;
  final float characterLane = 50;
  
  float frameCounter = 0;
  float characterPositionx = 100;
  float characterPositiony = lane2-characterLane;
  
  public void setupCharacter()
  {
    characterAnimation = new Animation("gif/surfer/surfer", 9);
  }
  
  public void moveCharacter()
  {
    if (key == up) {
      if(characterPositiony == lane3-characterLane)
      {
        characterPositiony = lane2-characterLane;
      }
      else if(characterPositiony == lane2-characterLane)
      {
        characterPositiony = lane1-characterLane;
      }
    } 
    else if (key == down) {
      if(characterPositiony == lane1-characterLane)
      {
        characterPositiony = lane2-characterLane;
      }
      else if(characterPositiony == lane2-characterLane)
      {
        characterPositiony = lane3-characterLane;
      }
    }
  }
  
  public void drawCharacter(){
    characterAnimation.display(characterPositionx, characterPositiony);
  }
}
