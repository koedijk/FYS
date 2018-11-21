Waves waves;
Rythmic_Spawning miniGame;
Character character;
ObstacleController obstacleController;
GameOverScreen gameOverScreen;
TutorialText tutorialText;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
boolean gameOver = false;
Tutorial tutorial = new Tutorial();

HightlightButton button;
Score score;
PFont font; 

//constants
final char up = 'z';
final char down = 'x';
final float lane1 = 600 / 2 + 30;
final float lane2 = 600 / 2 + 130;
final float lane3 = 600 / 2 + 230;
final float characterSpriteHeight = 100;
final float characterSpriteWidth = 100;

void setup() {
  size(800, 600);
  frameRate(60);
  tutorial.tutorialSetup();
}



void draw() {
  tutorial.drawGame();
}

void keyPressed(){
  tutorial.changeTutorialText();
  tutorial.moveCharacter();
}
