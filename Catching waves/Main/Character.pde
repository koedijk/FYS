Animation characterAnimation;

public class Character
{
  final float lane1 = height / 2 + 30;
  final float lane2 = height / 2 + 130;
  final float lane3 = height / 2 + 230;
  final float characterLane = 2;
  
  float frameCounter = 0;
  float characterPositionx = 100;
  float characterPositiony = lane2;
  
  public void setupCharacter()
  {
    characterAnimation = new Animation("animation/surfer/surfer.png", 1, 2);
  }
  
  public void moveCharacter()
  {
    if (!gameOver & !rythmGame) {
      if (keyCode == 38) {
        if(characterPositiony == lane3)
        {
          characterPositiony = lane2;
        }
        else if(characterPositiony == lane2)
        {
          characterPositiony = lane1;
        }
      } 
      else if (keyCode == 40) {
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
  public void moveCharacterUp()
  {
    if(characterPositiony == lane3)
    {
      characterPositiony = lane2;
    }
    else if(characterPositiony == lane2)
    {
      characterPositiony = lane1;
    }
  }
  public void moveCharacterDown()
  {
    if(characterPositiony == lane1)
    {
      characterPositiony = lane2;
    }
    else if(characterPositiony == lane2)
    {
      characterPositiony = lane3;
    }
  }
  
  public void drawCharacter(){
    characterAnimation.DrawAnimation(true, 10, characterPositionx, characterPositiony-characterLane);
  }
}
