class Game
{  
  void gameSetup()
  {
    button = new Button();
    score = new Score();
    button.Setup();
    score.Start();
    waves = new Waves();
    character = new Character();
    miniGame = new Rythmic_Spawning();
    obstacleController = new ObstacleController();
    gameOverScreen = new GameOverScreen();
    //obstacle[0] = new Obstacle(24, lane1, 9);
    waves.waveSetup();
    character.setupCharacter();
  }
  
  void drawGame()
  {
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
      score.endGame = true;
    }
  }
  
  void moveCharacter()
  {
    character.moveCharacter();
  }
}
