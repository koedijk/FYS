class Button
{
  color rectColor, baseColor;
  color rectHighlight;
  color currentColor;
  ArrayList<ButtonData> buttonList = new ArrayList<ButtonData>(); 
  int index = 0;
  Tutorial tutorial;
  public boolean tutorialActive = false;
  boolean gameActive = false;
    
  void Setup() 
  {
    tutorial = new Tutorial();
    rectColor = color(100);
    rectHighlight = color(255);
    buttonList.add(new ButtonData(400,200,150,50));
    buttonList.add(new ButtonData(400,300,150,50));
    buttonList.add(new ButtonData(400,400,150,50));    
    ShowButton();
  }
  
  void Draw()
  {
    if(tutorialActive)
    tutorial.drawGame();
    else if(gameActive)
    game.drawGame();
    else
    HighlightButton();
  }
  

  void ShowButton()
  {
    for(int i = 0; i < buttonList.size(); i++)
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
      case 0:
        fill(rectHighlight);
        rect(buttonList.get(index).data.get(0),buttonList.get(index).data.get(1),buttonList.get(index).data.get(2),buttonList.get(index).data.get(3));
        
        fill(rectColor);
        rect(buttonList.get(1).data.get(0),buttonList.get(1).data.get(1),buttonList.get(1).data.get(2),buttonList.get(1).data.get(3));
        fill(rectColor);
        rect(buttonList.get(2).data.get(0),buttonList.get(2).data.get(1),buttonList.get(2).data.get(2),buttonList.get(2).data.get(3));
        break;
      case 1:
        fill(rectHighlight);
        rect(buttonList.get(index).data.get(0),buttonList.get(index).data.get(1),buttonList.get(index).data.get(2),buttonList.get(index).data.get(3));
        
        fill(rectColor);
        rect(buttonList.get(0).data.get(0),buttonList.get(0).data.get(1),buttonList.get(0).data.get(2),buttonList.get(0).data.get(3));
        fill(rectColor);
        rect(buttonList.get(2).data.get(0),buttonList.get(2).data.get(1),buttonList.get(2).data.get(2),buttonList.get(2).data.get(3));
        break;
      case 2:
        fill(rectHighlight);
        rect(buttonList.get(index).data.get(0),buttonList.get(index).data.get(1),buttonList.get(index).data.get(2),buttonList.get(index).data.get(3));
        
        fill(rectColor);
        rect(buttonList.get(0).data.get(0),buttonList.get(0).data.get(1),buttonList.get(0).data.get(2),buttonList.get(0).data.get(3));
        fill(rectColor);
        rect(buttonList.get(1).data.get(0),buttonList.get(1).data.get(1),buttonList.get(1).data.get(2),buttonList.get(1).data.get(3));
        break;
      default:
        ShowButton();
        break;
    }
    
    fill(10);
    textAlign(CENTER,CENTER);
    textSize(14);
    text("Start Game",buttonList.get(0).data.get(0), buttonList.get(0).data.get(1));
    
    fill(10); 
    textAlign(CENTER,CENTER);
    textSize(14);
    text("Tutorial",buttonList.get(1).data.get(0), buttonList.get(1).data.get(1));
    
    fill(10);
    textAlign(CENTER,CENTER);
    textSize(14);
    text("Exit",buttonList.get(2).data.get(0), buttonList.get(2).data.get(1));
  }
  
  void SelectButton()
  {
    if(tutorialActive)
      tutorial.changeTutorialText();
    else if(gameActive)
      game.moveCharacter();
    else
    if(keyCode == 38 && index <= buttonList.size() && index > 0)
    { 
      index--;
    }
    else if(keyCode == 38 && index == 0)
    {
      index = buttonList.size() - 1;
    }
    else if(keyCode == 40 && index < buttonList.size() - 1 && index >= 0)
    { 
      index++;
    }
    else if(keyCode == 40 && index == buttonList.size() - 1)
    {
      index = 0;
    }
    print(index);
    if(key == 32 && index == 0)
    {
      gameActive = true;
      print("game");
    }
    else if(key == 32 && index == 1)
    {
      tutorialActive = true;
      print("tutorial");
    }
    else if(key == 32 && index == 2)
    {
       print("exit");
       exit();
    }
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
