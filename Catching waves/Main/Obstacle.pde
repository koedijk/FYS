public class Obstacle {
  int state = 0;
  float obstacleSpeed;
  float obstacleMaxSpeed;
  float obstacleMinSpeed;
  float obstaclePositionx;
  float obstaclePositiony;
  Animation rockAnimation;
  Animation dolphinAnimation;
  Obstacle (float tempObstaclePositionx, float tempObstaclePositiony, int tempObstacleSpeed) {
    obstaclePositionx = tempObstaclePositionx+width;
    obstaclePositiony = tempObstaclePositiony;
    obstacleSpeed = tempObstacleSpeed;
    rockAnimation = new Animation("gif/obstacles/rock/rock", 45);
    dolphinAnimation = new Animation("gif/obstacles/dolphin/dolphin_", 98);
  }
  
  public void moveObstacle() {
    obstaclePositionx -= obstacleSpeed;
    
    //reset x position if off screen
    if (obstaclePositionx <= -12) {
      obstaclePositionx = width+12;
      int n = (int)random(1, 3);
      float randomLane;
      switch(n)
      {
        case 1:
          randomLane = character.lane1;
          break;
        case 2:
          randomLane = character.lane2;
          break;
        default:
          randomLane = character.lane3;
          break;
      }
      obstaclePositiony = randomLane;
      state = round(random(1));
      if (state == 0) {
        obstacleSpeed = 4;
      } else {
        obstacleSpeed = 6;
      }
    }
    
    //collide with player
    if ((obstaclePositionx-characterSpriteWidth/2 < character.characterPositionx+obstacleSpeed && obstaclePositionx-characterSpriteWidth/2 > character.characterPositionx) && 
        obstaclePositiony == character.characterPositiony) {
      print("LOL u DED ");
      gameOver = true;
    }
  }
  
  public void drawObstacle() {
    if (state == 0) {
      rockAnimation.display(obstaclePositionx, obstaclePositiony-50);
    } else {
      dolphinAnimation.display(obstaclePositionx, obstaclePositiony-100);
    }
  }
}
