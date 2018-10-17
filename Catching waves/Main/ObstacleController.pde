public class ObstacleController {
  int obstacleTimer = 0;
  int obstacleSpawnTime = 100;
  float randomLane = 0;
  int  n = 1;
  public void controlObstacles() {
    obstacleTimer++;
    if (obstacleTimer >= obstacleSpawnTime) {
      n = (int)random(1, 3);
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
      obstacles.add(new Obstacle(24, randomLane, 4, new Animation("gif/obstacles/rock/rock", 45)));  //spawn object
      obstacleSpawnTime *= 1.5;    //reset timer
      obstacleSpawnTime += 450;
    }
    //obstacles loop
    for (Obstacle obst : obstacles) {  //run scripts for all the obstacles
      if (!gameOver) {
        obst.moveObstacle();
      }
      obst.drawObstacle();
    }
  }
}
