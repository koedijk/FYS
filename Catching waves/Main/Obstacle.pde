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
    rockAnimation = new Animation("gif/obstacles/rock/rock", 45);
    dolphinAnimation = new Animation("gif/obstacles/rock/rock", 45);
    waveAnimation = new Animation("gif/obstacles/dolphin/dolphin_", 98);
    
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
      rockAnimation.display(obstaclePositionx, obstaclePositiony-50);
    } else {
      dolphinAnimation.display(obstaclePositionx, obstaclePositiony-100);
    }
    }else if(random <= 5){
      waveAnimation.display(obstaclePositionx, obstaclePositiony-100);
      specialObject = true;
      print("Special Tile");
    }
  }
}
