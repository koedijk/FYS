Animation rockAnimation;

public class Obstacle {
  float obstacleSpeed;
  float obstacleMaxSpeed;
  float obstacleMinSpeed;
  float obstaclePositionx;
  float obstaclePositiony;
  Obstacle (float tempObstaclePositionx, float tempObstaclePositiony, int tempObstacleSpeed) {
    obstaclePositionx = tempObstaclePositionx+width;
    obstaclePositiony = tempObstaclePositiony;
    obstacleSpeed = tempObstacleSpeed;
    obstacleMaxSpeed = obstacleSpeed*1.25;
    obstacleMinSpeed = obstacleSpeed*0.75;
    rockAnimation = new Animation("gif/obstacles/rock/rock", 45);
  }
  
  public void moveObstacle() {
    obstaclePositionx -= obstacleSpeed;
    
    //reset x position if off screen
    if (obstaclePositionx <= -12) {
      obstaclePositionx = width+12;
      obstaclePositiony = character.characterPositiony;
      obstacleSpeed *= random(0.9, 1.1);
      if (obstacleSpeed > obstacleMaxSpeed) obstacleSpeed = obstacleMaxSpeed;
      if (obstacleSpeed < obstacleMinSpeed) obstacleSpeed = obstacleMinSpeed;
    }
    
    //collide with player
    if ((obstaclePositionx-characterSpriteWidth/2 < character.characterPositionx+obstacleSpeed && obstaclePositionx-characterSpriteWidth/2 > character.characterPositionx) && 
        obstaclePositiony == character.characterPositiony) {
      print("LOL u DED ");
    }
  }
  
  public void drawObstacle() {
    rockAnimation.display(obstaclePositionx, obstaclePositiony);
  }
}
