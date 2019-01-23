public class ObstacleController {
  // declareer en initialiseer variabelen
  int obstacleTimer = 0;
  int obstacleSpawnTime = 100;
  float randomLane = 0;
  float randomLane2 = 0;
  int counter;
  int  n = 1;
  
  //spawn obstakels
  public void controlObstacles() {
      //zet max voor spawn timer op basis van multiplier(combo)
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
      
      //spawn obstakels
      if (obstacleTimer <= 0) {
        obstacleTimer = obstacleSpawnTime-score.currentScore/1500; //reset timer ook afhankelijk van de huidige score
        n = (int)random(1, 4); // kies een lane
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
        
        // spawn mogelijk een tweede obstakel
        //hoe hoger de huidige score en hoe hoger de multiplier(combo) hoe groter de kans op een tweede obstakel
        if (random(100) < min(score.currentScore/100, 60)+(score.multiplier-1)*10) {
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
            obstacles.add(new Obstacle(24, randomLane2, 4));  //spawn object alleen op een nieuwe lane
          }
        }
      }
      
      // tel timer af
      obstacleTimer--;
      //obstacles loop
      
      //Beweeg alle objecten in array "obstacles"
      for (int i = 0; i < obstacles.size(); i++) {  
        Obstacle obst = obstacles.get(i);
        if (!gameOver) {
           obst.moveObstacle(i); // beweeg obstakel
        }
        obst.drawObstacle();  // teken obstakel op het scherm
      }
  }
  
  
  //vernietig alle obstakels bij game over MUHAHAHAHAHAHA
  public void obstacleGameOver() {
    for (int i = 0; i < obstacles.size(); i++) {
    obstacles.remove(i);
    }
  }
}
