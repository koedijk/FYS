public class ObstacleController {
  int obstacleTimer = 0;
  int obstacleSpawnTime = 100;
  float randomLane = 0;
  float randomLane2 = 0;
  int counter;
  int  n = 1;
  public int controlObstacles() {
      if (score.multiplier == 1) {
        obstacleSpawnTime = 100;
      } else if (score.multiplier == 1.5) {
        obstacleSpawnTime = 90;
      } else if (score.multiplier == 2) {
        obstacleSpawnTime = 82;
      } else if (score.multiplier == 2.5) {
        obstacleSpawnTime = 74;
      } else if (score.multiplier == 3) {
        obstacleSpawnTime = 65;
      }  else  {
        obstacleSpawnTime = 1;
      }
      
      if (obstacleTimer <= 0) {
        obstacleTimer = obstacleSpawnTime-score.currentScore/1500; //reset timer
        n = (int)random(1, 4);
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
        obstacles.add(new Obstacle(24, randomLane, 4));  //spawn object
        
        if (random(100) < min(score.currentScore/100, 60)+(score.multiplier-1)*10) { // currentScore
          n = (int)random(1, 4);
          switch(n)
          {
            case 1:
                randomLane2 = character.lane1;
                break;
              case 2:
                randomLane2 = character.lane2;
                break;
              default:
                randomLane2 = character.lane3;
                break;
          }
          if (randomLane2 != randomLane) {
            obstacles.add(new Obstacle(24, randomLane2, 4));  //spawn object
          }
        }
      }
      
      obstacleTimer--;
      //obstacles loop
      
      //First looks how many objects are in the array and then assigns the objects to their number. running the movement and draw code from those objects.
      for (int i = 0; i < obstacles.size(); i++) {  
        Obstacle obst = obstacles.get(i);
        if (!gameOver) {
           obst.moveObstacle(i);
        }
        else 
        {
          counter = 0;
        }
        obst.drawObstacle();
      }
    return counter;
  }
  
  public void obstacleGameOver() {
    for (int i = 0; i < obstacles.size(); i++) {
    obstacles.remove(i);
    }
  }
}
