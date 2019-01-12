public class Obstacle {
  int state = (int)random(0, 2);
  int random = (int)random(0,30);
  float obstacleSpeed;
  float obstacleMaxSpeed;
  float obstacleMinSpeed;
  float obstaclePositionx;
  float obstaclePositiony;
  int counter;
  int i;
  boolean specialObject = false;
  Animation rockAnimation;
  Animation dolphinAnimation;
  Animation waveAnimation;
  Obstacle (float tempObstaclePositionx, float tempObstaclePositiony, int tempObstacleSpeed) {
    obstaclePositionx = tempObstaclePositionx+width;
    obstaclePositiony = tempObstaclePositiony;
    obstacleSpeed = tempObstacleSpeed+int(score.currentScore/5000)+min(score.multiplier/8, 2);
    rockAnimation = new Animation("animation/obstacles/rock.png", 5, 2);
    dolphinAnimation = new Animation("animation/obstacles/dolphin.png", 7, 2);
    waveAnimation = new Animation("animation/obstacles/waves.png", 2, 2);
    
  }
  public int moveObstacle(int counter) {
    obstaclePositionx -= obstacleSpeed;
   
   if(obstaclePositionx <= -12) {
        obstacles.remove(counter);
   }
   if(!rythmGame && character.invinsibleTimer <= 0){
    //collide with player
    if ((obstaclePositionx-characterSpriteWidth/2 < character.characterPositionx+obstacleSpeed && obstaclePositionx+characterSpriteWidth/2 > character.characterPositionx) && 
        (obstaclePositiony >= character.changePosition-5 && obstaclePositiony <= character.changePosition+5)) {
      print("RIP");
      
      if(specialObject) {
        //if (obstaclePositionx-characterSpriteWidth/2 > character.characterPositionx-obstacleSpeed/2) {
          samplebank.trigger("PowerupSound1.wav");
          rythmGame = true;
          obstacles.remove(counter);
        //}
      }else{
        //if (character.invinsibleTimer > 0) {
          //obstacles.remove(counter);
        //} else if (character.moveDown == false && character.moveUp == false) {
          samplebank.trigger("DyingSound.wav");
          gameOver = true;
        //}
      }
    }
   }
    return(counter);
  }
  
  public void drawObstacle() {
    if (score.multiplier <= 4) {
      i = 3;
    } else if (score.multiplier > 4) {
      i = 2;
    } else {
      i = 1;
    }
    if(random > i){
    if (state == 0) {
      rockAnimation.DrawAnimation(false, 10, obstaclePositionx, obstaclePositiony-10);
    } else {
      dolphinAnimation.DrawAnimation(true, 5, obstaclePositionx, obstaclePositiony-10);
    }
    } else if(random <= i && score.multiplier != 16){
      waveAnimation.DrawAnimation(false, 18, obstaclePositionx, obstaclePositiony-10);
      specialObject = true;
    }
    if (gameOver == true) {
      //destroy self
      obstacles.remove(counter);
    }
  }
}
