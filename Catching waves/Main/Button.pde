class Button
{
  color rectColor, baseColor, backgroundColor;
  color rectHighlight;
  color currentColor;
  ArrayList<ButtonData> buttonList = new ArrayList<ButtonData>(); 
  int index = 0;
  int AmountMainMenuButtons = 2;
  //Tutorial tutorial;
  public boolean tutorialActive = false;
  boolean gameActive = false;
  boolean gameMenu = true;
  boolean settingsMenu = false;
  int songNumber = 1;
  String songString = "1 ";
    
  void Setup() 
  {
    backgroundColor = color(150, 210, 255);
    background(backgroundColor);
    rectColor = color(100);
    rectHighlight = color(150, 210, 255);  
    //Adding New Button to list and gives X,Y,Width,Heigth to set location via ButtonData Class.
    //Start Button
    buttonList.add(new ButtonData(400,200,150,50));
    //Exit Button
    buttonList.add(new ButtonData(400,300,150,50));
    //Highscore
    buttonList.add(new ButtonData(400,400,150,50));
    ShowButton();
  }
  
  void Draw()
  {
    background(backgroundColor);
    rectColor = color(100);
    rectHighlight = color(150, 210, 255);  
    ShowButton();
    if(gameActive) {
      game.drawGame();  
    } else if(gameMenu) {
      Settings();
      HighlightButton();
      textAlign(CENTER);
      text("Highscore:", buttonList.get(2).data.get(0),buttonList.get(2).data.get(1)-10);
      text(score.highScore, buttonList.get(2).data.get(0),buttonList.get(2).data.get(1)+10);
    }
    
  }
  

  void ShowButton()
  {
    for(int i = 0; i < buttonList.size() - 2; i++)
    {
      stroke(0);
      strokeWeight(2);
      rectMode(CENTER);
      fill(rectColor);
      rect(buttonList.get(i).data.get(0),buttonList.get(i).data.get(1),buttonList.get(i).data.get(2),buttonList.get(i).data.get(3));
    }
  }
  
  void HighlightButton()
  {         
    
    switch(index)
    {
      case 0:  // start
        fill(rectHighlight);
        rect(buttonList.get(index).data.get(0),buttonList.get(index).data.get(1),buttonList.get(index).data.get(2),buttonList.get(index).data.get(3));        
        fill(rectColor);
        rect(buttonList.get(1).data.get(0),buttonList.get(1).data.get(1),buttonList.get(1).data.get(2),buttonList.get(1).data.get(3));
        //rect(buttonList.get(2).data.get(0),buttonList.get(2).data.get(1),buttonList.get(2).data.get(2),buttonList.get(2).data.get(3));
        break;
      case 1:   // exit
        fill(rectHighlight);
        rect(buttonList.get(index).data.get(0),buttonList.get(index).data.get(1),buttonList.get(index).data.get(2),buttonList.get(index).data.get(3));        
        fill(rectColor);
        rect(buttonList.get(0).data.get(0),buttonList.get(0).data.get(1),buttonList.get(0).data.get(2),buttonList.get(0).data.get(3));
        //rect(buttonList.get(2).data.get(0),buttonList.get(2).data.get(1),buttonList.get(2).data.get(2),buttonList.get(2).data.get(3));
        break;
    }
    if(gameMenu){
      fill(10);
      textAlign(CENTER,CENTER);
      textSize(14);
      text("Start Game",buttonList.get(0).data.get(0), buttonList.get(0).data.get(1));
      
      fill(10);
      textAlign(CENTER,CENTER);
      textSize(14);
      text("Exit",buttonList.get(1).data.get(0), buttonList.get(1).data.get(1));
    }
  }
  
  void SelectButton()
  {
    if(gameActive)
      game.moveCharacter();
    else if(gameMenu)
    {      
      if(keyCode == 38 && index <= AmountMainMenuButtons && index > 0)
      { 
        index--;
      }
      else if(keyCode == 38 && index == 0)
      {
        index = AmountMainMenuButtons - 1;
      }
      else if(keyCode == 40 && index < AmountMainMenuButtons - 1 && index >= 0)
      { 
        index++;
      }
      else if(keyCode == 40 && index == AmountMainMenuButtons - 1)
      {
        index = 0;
      }
      if(key == 32 && index == 0)
      {
        //Start Button initialize
        gameActive = true;
        gameMenu = false;
        settingsMenu = false;
      }
      else if(key == 32 && index == 1)
      {
        //Exit initialize
        exit();
      }
    }
    else if(settingsMenu)
    {
      if(keyCode == 38 && index == 4)
      { 
        index = 4;
      }
      else if(keyCode == 38 && index == 3)
      {
        index = 3;
      }
      else if(keyCode == 40 && index == 3)
      { 
        index = 4;
      }
      else if(keyCode == 40 && index == 4)
      {
        index = 3;
      }
      if(key == 32 && index == 3)
      {
        songNumber++;
        if(songNumber > 3)
        {  
          songNumber = 1;
        }
      }
      else if(key == 32 && index == 4)
      {
        //Return to MainMenu
        gameMenu = true;
        settingsMenu = false;
        ShowButton();
        setup();
        Settings();
      }
    }    
  }
  
  void Settings()
  {
    clear();
    background(backgroundColor);
    stroke(0);
    strokeWeight(4);
    fill(255);
    rect(width / 2,height / 2,layer1,layer1);
    strokeWeight(2);
  }
  
  
  class ButtonData
  {
    public IntList data;
    
    ButtonData(int posX, int posY, int sizeX, int sizeY)
    {
      data = new IntList();
      int[] tempData = { posX,posY,sizeX,sizeY};     
      for(int i = 0; i < tempData.length; i++ )
      {
        data.append(tempData[i]);
      }
    }      
  }
}
