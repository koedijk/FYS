public class TutorialText {
  PFont fontLarge = createFont("Arial", 24, true);
  void drawScreen(String tutorialText, int positionx, int positiony) {
    
    
    tint(255);
    textFont(fontLarge);
    textAlign(CENTER);
    text(tutorialText, positionx, positiony);
  }
}
