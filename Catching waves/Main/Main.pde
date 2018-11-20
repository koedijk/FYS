Waves waves;
Rythmic_Spawning miniGame;
Character character;
ObstacleController obstacleController;
GameOverScreen gameOverScreen;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
boolean gameOver = false;
MainMenu menu;
Score score;
PFont font; 
Button button;

//constants
final char up = 'z';
final char down = 'x';
final float lane1 = 600 / 2 + 30;
final float lane2 = 600 / 2 + 130;
final float lane3 = 600 / 2 + 230;
final float characterSpriteHeight = 100;
final float characterSpriteWidth = 100;

void setup() {
  score = new Score();
  menu = new MainMenu();
  button = new Button();
  size(800, 600);
  menu.Setup();
  score.Start();
  frameRate(60);
  waves = new Waves();
  character = new Character();
  miniGame = new Rythmic_Spawning();
  obstacleController = new ObstacleController();
  gameOverScreen = new GameOverScreen();
  //obstacle[0] = new Obstacle(24, lane1, 9);
  waves.waveSetup();
  character.setupCharacter();
}



void draw() {
  if(menu.menuActive)
  {
    button.Draw();
    menu.Draw();
    return;
  }
  background(73, 149, 255);
  
  //obstacles
  obstacleController.controlObstacles();
  
  waves.drawWaves();
  character.drawCharacter();
  miniGame.StartMinigame();
  score.Update();
  //minigame start
  if(keyCode == 77)
  {
    miniGame.gamePlaying = true;
  }
  
  if (gameOver) {
    gameOverScreen.drawScreen();
  }
}

void keyPressed(){
  character.moveCharacter();
  button.SelectButton();  
}
