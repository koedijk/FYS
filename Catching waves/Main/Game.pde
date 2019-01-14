class Game
{  

SampleBank file;
  void gameSetup()
  {
    button = new Button();
    score = new Score();
    background1 = new Background();
    background2 = new Background();
    background3 = new Background();
    background4 = new Background();
    background5 = new Background();
    background6 = new Background();
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
    samplebank.loadMusic("Level 3.wav");
  }
  
  void drawGame()
  {
    
    if(!Musicisplaying){
      samplebank.playMusic();
      Musicisplaying = true;
      samplebank.musicPlayer.loop();
    }
    if (Musicismuted && gameOver == false) {
      samplebank.musicPlayer.rewind();
      samplebank.musicPlayer.unmute();
      Musicismuted = false;
    }

    
    background(73, 149, 255);
    fill(150, 210, 255);
    stroke(255,255,255);
    noStroke();
    rect(0,0,1600,560);
    
    background1.drawBackground();
    background2.drawBackground();
    background3.drawBackground();
    background4.drawBackground();
    background5.drawBackground();
    background6.drawBackground();
    
    
    //obstacles
    obstacleController.controlObstacles();
    
    waves.drawWaves();
    character.drawCharacter();
    
    //starts minigame
    if(rythmGame){
      miniGame.StartMinigame();
    }
    score.Update();
    
    if (gameOver) {
      gameOverScreen.drawScreen();
      score.endGame = true;
      
      if(Musicisplaying){
      samplebank.musicPlayer.mute();
      Musicismuted = true;
    }
      
      if (key == 32) {
        obstacleController.obstacleGameOver();
        gameOver = false;
        score.currentScore = 0;
        score.endGame = false;
        button.gameActive = false;
        button.gameMenu = true;
        clear();
      }
    }
  }
  
  void moveCharacter()
  {
    character.moveCharacter();
   }
}
