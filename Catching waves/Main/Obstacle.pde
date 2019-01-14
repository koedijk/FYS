public class Obstacle {
  int state = (int)random(0, 2);
  int random = (int)random(0,100);
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
    obstacleSpeed = tempObstacleSpeed+min(score.currentScore/5000+(score.multiplier)*2.5, 8);
    rockAnimation = new Animation("animation/obstacles/rock.png", 5, 2);
    dolphinAnimation = new Animation("animation/obstacles/dolphin.png", 7, 2);
    waveAnimation = new Animation("animation/obstacles/waves.png", 1, 1);
    
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
      
      
      if(specialObject) {
        samplebank.trigger("PowerupSound1.wav");
        rythmGame = true;
        obstacles.remove(counter);
      } else {
        
        if (score.multiplier < 1.1) {
          samplebank.trigger("DyingSound.wav");
          print("RIP");
          gameOver = true;
          obstacles.remove(counter);
          fill(color(255, 0, 0));
          rect(0, 0, width*2, height*2);
        } else {
          obstacles.remove(counter);
          fill(color(255, 0, 0));
          rect(0, 0, width*2, height*2);
          score.multiplier = 1;
        }
      }
    }
   }
    return(counter);
  }
  
  public void drawObstacle() {
    
    //choose between specialobject and regular
    //i = % chance to become specialobject
    if (score.multiplier == 1) {
      i = 25;
    } else if (score.multiplier == 1.5) {
      i = 20;
    } else if (score.multiplier == 2) {
      i = 13;
    } else if (score.multiplier == 2.5) {
      i = 5;
    } else if (score.multiplier == 3) {
      i = -1;
    }
    if(random > i){
    if (state == 0) {
      rockAnimation.DrawAnimation(false, 10, obstaclePositionx, obstaclePositiony-10);
    } else {
      dolphinAnimation.DrawAnimation(true, 5, obstaclePositionx, obstaclePositiony-10);
    }
    } else {
      waveAnimation.DrawAnimation(false, 18, obstaclePositionx, obstaclePositiony);
      specialObject = true;
    }
    if (gameOver == true && key == 32) {
      //destroy self
      obstacles.remove(counter);
    }
  }
}
