class Score {
  
  int currentScore = 0;
  int gainScore = 1;
  float multiplier = 1;
  int highScore = 0;
  String lines[];
  boolean endGame = false;
  PFont fontMedium = createFont("Arial", 24, false);
  PFont fontMediumBold = createFont("Arial Bold", 24, false);
  
  void Start()
  {
    lines = loadStrings("HighScore.txt");
    highScore = Integer.parseInt(lines[0]);
    color c = color(0, 126, 255, 102);

    float value = alpha(c);
    fill(value);    
    tint(255);
    textFont(fontMedium);
    textAlign(RIGHT);
  }
  
  void Update()
  {    
    AddScore();
  }
  
  private void AddScore()
  {
    if(!endGame)
    {
      currentScore += (gainScore * multiplier);
      if(currentScore > highScore)
      {
         highScore = currentScore;       
         String newHighScore = str(highScore);
         lines = split(newHighScore,' ');
         saveStrings("HighScore.txt",lines);
      }
      
      scoreText();
    }    
 }
  
  public void SetMultiplier(float i)
  {
    multiplier = i;
    if (multiplier > 3) multiplier = 3;
  }
  
  void scoreText()
  {
    fill(alpha(color(0, 126, 255, 102)));
    textAlign(RIGHT);
    
    
    textFont(fontMedium);
    text("Score:",width, 85);
    textFont(fontMediumBold);
    String currentScoreString = str(currentScore);
    text(currentScoreString,width,105);
    
    textFont(fontMedium);
    text("HighScore:",width,130);
    textFont(fontMediumBold);
    for(int i = 0; i < lines.length; i++)
    {
      text(lines[i],width,150 + 35*i);
    }
    
    textFont(fontMedium);
    text("Combo/Health:",width,175);
    fill(color(255, 0, 0));
    textFont(fontMediumBold);
    textSize(28);
    text(multiplier + "x",width,197);
  }
}
