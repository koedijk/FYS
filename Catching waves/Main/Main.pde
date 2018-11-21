Waves waves;
Rythmic_Spawning miniGame;
Character character;
ObstacleController obstacleController;
GameOverScreen gameOverScreen;
TutorialText tutorialText;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
boolean gameOver = false;
MainMenu menu;
Tutorial tutorial = new Tutorial();
Score score;
PFont font; 
Button button;
Game game;

//constants
final char up = 'z';
final char down = 'x';
final float lane1 = 600 / 2 + 30;
final float lane2 = 600 / 2 + 130;
final float lane3 = 600 / 2 + 230;
final float characterSpriteHeight = 100;
final float characterSpriteWidth = 100;

void setup() {
  game = new Game();
  menu = new MainMenu();
  button = new Button();
  size(800, 600);
  menu.Setup();
  frameRate(60);
  tutorial.tutorialSetup();
}

void draw()
{
   game.drawGame();
}

void keyPressed(){
  tutorial.changeTutorialText();
  button.SelectButton();  
}
