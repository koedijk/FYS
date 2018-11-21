class Tutorial
{
  final String WELCOME_TEXT = "Welcome to catching waves";
  final String TUTORIAL_EXPLANATION_TEXT = "In this tutorial you learn to play this game";
  final String MOVE_TEXT_UP = "Press z to go up";
  final String MOVE_TEXT_DOWN = "Press x to go down";
  final String COMPLIMENT_MOVING = "Good job now try to dodge the obsctacles";
  final String TUTORIAL_TEXT_MINIGAME = "Nice! now try out the minigame";
  
  int obstacleCounter = 0;
  
  String text = WELCOME_TEXT;
  void tutorialSetup()
  {
    button = new HightlightButton();
    score = new Score();
    button.Setup();
    score.Start();
    waves = new Waves();
    character = new Character();
    miniGame = new Rythmic_Spawning();
    obstacleController = new ObstacleController();
    tutorialText = new TutorialText();
    //obstacle[0] = new Obstacle(24, lane1, 9);
    waves.waveSetup();
    character.setupCharacter();
  }
  void drawGame()
  {
    background(73, 149, 255);
    if(text == WELCOME_TEXT || text == TUTORIAL_EXPLANATION_TEXT)
    {
      tutorialText.drawScreen(text, width/2, height/2);
    }
    else if(text == MOVE_TEXT_UP || text == MOVE_TEXT_DOWN)
    {
      waves.drawWaves();
      character.drawCharacter();
      tutorialText.drawScreen(text, width/2, height/3);
    }
    else if(text == COMPLIMENT_MOVING)
    {
      waves.drawWaves();
      character.drawCharacter();
      tutorialText.drawScreen(text, width/2, height/3);
      obstacleCounter = obstacleController.controlObstacles();
      if(obstacleCounter == 10)
      {
        text = TUTORIAL_TEXT_MINIGAME;
      }
    }
    //obstacles
    /*obstacleController.controlObstacles();
    
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
    }*/
  }
  
  void moveCharacter()
  {
    if(text == COMPLIMENT_MOVING)
    character.moveCharacter();
  }
  void changeTutorialText()
  {
    if(keyCode == 32)
    {
      if(text == WELCOME_TEXT)
      {
        text = TUTORIAL_EXPLANATION_TEXT;
      }
      else if(text == TUTORIAL_EXPLANATION_TEXT)
      { 
        text = MOVE_TEXT_UP;
      }
    }
    if(text == MOVE_TEXT_UP)
      {
        if(key == 'z')
        {
          character.moveCharacterUp();
          text = MOVE_TEXT_DOWN;
        }
      }
      else if(text == MOVE_TEXT_DOWN)
      {
        if(key == 'x')
        {
          character.moveCharacterDown();
          text = COMPLIMENT_MOVING;
        }
      }
  }
}
