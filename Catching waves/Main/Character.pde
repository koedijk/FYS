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
  float characterPositiony = lane2;
  
  public void setupCharacter()
  {
    characterAnimation = new Animation("gif/surfer/surfer", 9);
  }
  
  public void moveCharacter()
  {
    if (!gameOver) {
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
  }
  
  public void drawCharacter(){
    characterAnimation.display(characterPositionx, characterPositiony-characterLane);
  }
}
