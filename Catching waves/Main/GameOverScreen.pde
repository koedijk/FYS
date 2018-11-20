public class GameOverScreen {
  PFont fontLarge = createFont("Arial", 48, true);
  PFont fontSmall = createFont("Arial", 24, true);
  void drawScreen() {
    
    color c = color(0, 126, 255, 102);
    fill(c);
    rect(0, 0, width, height);
    float value = alpha(c);
    fill(value);
    
    tint(255);
    textFont(fontLarge);
    textAlign(CENTER);
    text("You are DEAD", width/2, height/3);
    
    textFont(fontSmall);
    textAlign(RIGHT);
    text("Score:           ", width/2, height/2);
    text("Highscore:           ", width/2, height/2+24);
    text(score.currentScore, width/2 + 24, height/2);
    text(score.highScore, width/2 + 24, height/2 + 24);
  }
}
