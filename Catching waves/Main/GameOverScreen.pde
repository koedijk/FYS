public class GameOverScreen {
  PFont fontLarge = createFont("Arial Bold", 48, true);
  PFont fontSmall = createFont("Arial Bold", 24, true);
  
  void drawScreen() {

    
    fill(255, 0, 0, 80);
    rect(0, 0, width*2, height*2);
    color c = color(0, 126, 255, 102);

    float value = alpha(c);
    fill(value, 255);    
    tint(255, 255, 255, 255);
    textFont(fontLarge);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/3);
    
    textFont(fontSmall);
    textAlign(CENTER);
    text("Score: " + score.currentScore, width/2, height/2);
    text("Highscore: " + score.highScore, width/2, height/2+24);
    text("Press SPACE to return to Menu", width/2, height/2+96);
  }
}
