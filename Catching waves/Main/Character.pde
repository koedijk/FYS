Animation characterAnimation;
Animation characterUpAnimation;
Animation characterDownAnimation;

public class Character
{
  final float lane1 = height / 2 + 30;
  final float lane2 = height / 2 + 130;
  final float lane3 = height / 2 + 230;
  final float characterLane = 2;
  
  float changePosition;
  
  boolean moveUp = false;
  boolean moveDown = false;
  
  float frameCounter = 0;
  float characterPositionx = 100;
  float characterPositiony = lane2;
  float characterPositionyOffset = 0;
  float yPosJump = 120;
  int invinsibleTimer = 0;
   
  public void setupCharacter()
  {
    characterAnimation = new Animation("animation/surfer/surfer.png", 1, 2);
    characterUpAnimation = new Animation("animation/surfer/surf_up.png", 2, 3);
    characterDownAnimation = new Animation("animation/surfer/surf_down.png", 2, 3);
  }
  
  public void moveCharacter()
  {
    if (!gameOver & !rythmGame) {
      if (keyCode == 38) {
        if(characterPositiony == lane3 || characterPositiony == lane2)
        {
          changePosition = characterPositiony;
          moveDown = false;
          moveUp = true;
        }
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
        if(characterPositiony == lane1 || characterPositiony == lane2)
        {
          changePosition = characterPositiony;
          moveUp = false;
          moveDown = true;
        }
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
    if (miniGame.gameStart == false) {
      characterPositionyOffset = yPosJump;
      fill(0);
      ellipse(characterPositionx, characterPositiony+30+waves.yvalues[10], 42, 16);  //draw dropshadow
      fill(255);
      invinsibleTimer = 12;
    } else {
      characterPositionyOffset = 0;
    }
    
    if (invinsibleTimer > 0) invinsibleTimer--;
    
    if(moveUp == true)
    {
      changePosition -= 4;
      characterUpAnimation.DrawAnimation(false, 5, characterPositionx, changePosition-characterLane);
      
      if(changePosition == lane1 || changePosition == lane2)
      {
        moveUp = false;
      }
    }
    else if(moveDown == true)
    {
      changePosition += 4;
      characterDownAnimation.DrawAnimation(false, 5, characterPositionx, changePosition-characterLane);
      
      if(changePosition == lane2 || changePosition == lane3)
      {
        moveDown = false;
      }
    }
    else
    {
      characterAnimation.DrawAnimation(true, 10, characterPositionx, characterPositiony+characterLane-characterPositionyOffset+waves.yvalues[10]);
    }
  }
}
