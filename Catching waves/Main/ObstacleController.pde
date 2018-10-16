public class ObstacleController {
  int obstacleTimer = 0;
  int obstacleSpawnTime = 100;
  public void controlObstacles() {
    obstacleTimer++;
    if (obstacleTimer >= obstacleSpawnTime) {
      obstacles.add(new Obstacle(24, lane1, 4, new Animation("gif/obstacles/rock/rock", 45)));  //spawn object
      obstacleSpawnTime *= 1.5;    //reset timer
      obstacleSpawnTime += 450;
    }
    //obstacles loop
    for (Obstacle obst : obstacles) {  //run scripts for all the obstacles
      obst.moveObstacle();
      obst.drawObstacle();
    }
  }
}
