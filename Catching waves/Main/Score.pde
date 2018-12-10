class Score {
  
  int currentScore = 0;
  int gainScore = 1;
  int multiplier = 1;
  int highScore = 0;
  String lines[];
  boolean endGame = false;
  
  void Start()
  {
    lines = loadStrings("HighScore.txt");
    highScore = Integer.parseInt(lines[0]);
  }
  
  void Update()
  {    
    AddScore();
  }
  
  private void AddScore()
  {
    if(!endGame)
    {
      for(int i = 0; i < lines.length; i++)
      {
        text(lines[i],720,80 + 35*i);
      }
      scoreText();
      currentScore += (gainScore * multiplier);
      String currentScoreString = str(currentScore);
      text(currentScoreString,720,40);
      if(currentScore > highScore)
      {
         highScore = currentScore;       
         String newHighScore = str(highScore);
         lines = split(newHighScore,' ');
         saveStrings("HighScore.txt",lines);
      }
      text(multiplier,720,120);
    }    
 }
  
  public void SetMultiplier(int i)
  {
    multiplier = i;
  }
  
  void scoreText()
  {
    textSize(14);
    text("Score:",720, 20);
    textSize(14);
    text("HighScore:",720,60);
    textSize(14);
    text("Combo:",720,100);
  }
}
