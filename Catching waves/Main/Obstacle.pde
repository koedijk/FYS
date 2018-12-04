public class Obstacle {
  int state = (int)random(0, 2);
  float obstacleSpeed;
  float obstacleMaxSpeed;
  float obstacleMinSpeed;
  float obstaclePositionx;
  float obstaclePositiony;
  int counter;
  Animation rockAnimation;
  Animation dolphinAnimation;
  Obstacle (float tempObstaclePositionx, float tempObstaclePositiony, int tempObstacleSpeed) {
    obstaclePositionx = tempObstaclePositionx+width;
    obstaclePositiony = tempObstaclePositiony;
    obstacleSpeed = tempObstacleSpeed;
    rockAnimation = new Animation("gif/obstacles/rock/rock", 45);
    dolphinAnimation = new Animation("gif/obstacles/dolphin/dolphin_", 98);
    
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
      gameOver = true;
    }
    return(counter);
  }
  
  public void drawObstacle() {
    if (state == 0) {
      rockAnimation.display(obstaclePositionx, obstaclePositiony-50);
    } else {
      dolphinAnimation.display(obstaclePositionx, obstaclePositiony-100);
    }
  }
}
