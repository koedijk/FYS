//Classes worden aangeroepen
Waves waves;
Rythmic_Spawning miniGame;
Character character;
ObstacleController obstacleController;
TutorialText tutorialText;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
boolean gameOver = false;
boolean rythmGame = false;
GameOverScreen gameOverScreen;
Tutorial tutorial;
Score score;
PFont font;
Button button;
//Wolken voor de background
Background background1;
Background background2;
Background background3;
Background background4;
Background background5;
Background background6;
Game game;
MainMenu menu;
SampleBank samplebank;

Animation animation;

//constants
final char up = 'z';
final char down = 'x';
final float lane1 = 600 / 2 + 30;
final float lane2 = 600 / 2 + 130;
final float lane3 = 600 / 2 + 230;
final float characterSpriteHeight = 100;
final float characterSpriteWidth = 100;
boolean Musicisplaying = false;
boolean Musicismuted = true;


void setup() {
  samplebank = new SampleBank();
  game = new Game();
  menu = new MainMenu();
  button = new Button();
  tutorial = new Tutorial();
  size(800, 600);
  menu.Setup();
  frameRate(60);
  game.gameSetup();
  tutorial.tutorialSetup();  
}

void draw()
{
  button.Draw();
}

void keyPressed(){
  button.SelectButton();  
}
