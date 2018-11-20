class Button
{
  color rectColor, baseColor;
  color rectHighlight;
  color currentColor;
  ArrayList<ButtonData> buttonList = new ArrayList<ButtonData>(); 
  int index = 0;
    
  void Setup() 
  {
    rectColor = color(100);
    rectHighlight = color(255);
    buttonList.add(new ButtonData(400,250,150,50));
    buttonList.add(new ButtonData(400,350,150,50));
    ShowButton();
  }
  
  void Draw()
  {
    HighlightButton();
    SelectButton(); 
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
        rect(buttonList.get(1).data.get(0),buttonList.get(1).data.get(1),buttonList.get(index).data.get(2),buttonList.get(index).data.get(3));
        break;
      case 1:
        fill(rectHighlight);
        rect(buttonList.get(index).data.get(0),buttonList.get(index).data.get(1),buttonList.get(index).data.get(2),buttonList.get(index).data.get(3));
        fill(rectColor);
        rect(buttonList.get(0).data.get(0),buttonList.get(0).data.get(1),buttonList.get(index).data.get(2),buttonList.get(index).data.get(3));
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
    text("Exit",buttonList.get(1).data.get(0), buttonList.get(1).data.get(1));
  }
  
  void SelectButton()
  {
    if(keyCode == 40)
    { 
      index = 1;
    }
    else if(keyCode == 38)
    {
      index = 0;
    } 
    
    if(key == 32 && index == 0)
    {
      menu.menuActive = false;
    }
    else if(key == 32 && index == 1)
    {
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
