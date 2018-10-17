/*class Score {
  
  float currentScore = 0;
  float gainScore = 0.1;
  float multiplier = 1;
  float highScore = 0;
  String lines[];
  
  void Start()
  {
    lines = loadStrings("HighScore.txt");
    
  }
  
  void Update()
  {
    background(0);
    fill(255);
    lines = loadStrings("HighScore.txt");
    
    highScore = float(lines[0]);
    println(highScore);
    scoreText();
    AddScore();
    for(int i = 0; i < lines.length; i++)
    {
      text(lines[i],720,80 + 35*i);
    }
  }
  
  private void AddScore()
  {    
    currentScore += (gainScore * multiplier);
    String currentScoreString = nf(currentScore,0,1);
    text(currentScoreString,720,40);
    if(currentScore > highScore)
    {
       highScore = currentScore;       
       String newHighScore = nf(highScore,0,1);
       lines = split(newHighScore,' ');
       saveStrings("HighScore.txt",lines);
    }
    delay(100);
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
  
}*/
