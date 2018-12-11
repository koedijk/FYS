public class Obstacle {
  int state = (int)random(0, 2);
  int random = (int)random(0,30);
  float obstacleSpeed;
  float obstacleMaxSpeed;
  float obstacleMinSpeed;
  float obstaclePositionx;
  float obstaclePositiony;
  int counter;
  boolean specialObject = false;
  Animation rockAnimation;
  Animation dolphinAnimation;
  Animation waveAnimation;
  Obstacle (float tempObstaclePositionx, float tempObstaclePositiony, int tempObstacleSpeed) {
    obstaclePositionx = tempObstaclePositionx+width;
    obstaclePositiony = tempObstaclePositiony;
    obstacleSpeed = tempObstacleSpeed;
    rockAnimation = new Animation("animation/obstacles/rock.png", 5, 2);
    dolphinAnimation = new Animation("animation/obstacles/dolphin.png", 7, 2);
    waveAnimation = new Animation("animation/obstacles/waves.png", 2, 2);
    
  }
  public int moveObstacle(int counter) {
    obstaclePositionx -= obstacleSpeed;
   
   if(obstaclePositionx <= -12) {
        obstacles.remove(counter);
   }
    
    //collide with player
    if ((obstaclePositionx-characterSpriteWidth/2 < character.characterPositionx+obstacleSpeed && obstaclePositionx-characterSpriteWidth/2 > character.characterPositionx) && 
        obstaclePositiony == character.characterPositiony) {
      print("RIP");
      if(specialObject){
      rythmGame = true;
      }else{
      gameOver = true;
      }
    }
    
    return(counter);
  }
  
  public void drawObstacle() {
    if(random > 5){
    if (state == 0) {
      rockAnimation.DrawAnimation(false, 10, obstaclePositionx, obstaclePositiony-10);
    } else {
      dolphinAnimation.DrawAnimation(true, 5, obstaclePositionx, obstaclePositiony-10);
    }
    }else if(random <= 5){
      waveAnimation.DrawAnimation(false, 18, obstaclePositionx, obstaclePositiony-10);
      specialObject = true;
    }
  }
}
