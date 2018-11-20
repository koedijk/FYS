class Score {
  
  int currentScore = 0;
  int gainScore = 1;
  float multiplier = 1;
  int highScore = 0;
  String lines[];
  
  void Start()
  {
    lines = loadStrings("HighScore.txt");
    highScore = Integer.parseInt(lines[0]);
  }
  
  void Update()
  {    
    AddScore();
    scoreText();
    for(int i = 0; i < lines.length; i++)
    {
      text(lines[i],720,80 + 35*i);
    }
  }
  
  private void AddScore()
  {    
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
  }
  
  public void SetMultiplier(float i)
  {
    multiplier = i;
  }
  
  void scoreText()
  {
    textSize(14);
    text("Score:",720, 20);
    textSize(14);
    text("HighScore:",720,60);
  }
  
}
