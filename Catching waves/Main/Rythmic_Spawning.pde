import java.util.Random;

Random randomNum = new Random();
Rythmic_Objects Objects;

//START OF THE CLASS
public class Rythmic_Spawning{
  PImage target;
  
  public boolean gameStart = true;
  private boolean gamePlaying = true;
  private boolean canPress = false;
  
  private int keyNumber = 0;
  public int maxObjects = 6;
  public int speed = 2;
  int targerLocationX = 100;
  
  public Rythmic_Objects[] Objects = new Rythmic_Objects[maxObjects];
    
  //Set up initial objects in array and spawns them on screen.
  private void SetupRythm(){
    for(int i = 0; i < maxObjects; i++){
      Objects[i] = new Rythmic_Objects();
      int number = randomNum.nextInt(4) + 1;
      Objects[i].imageNumber = number;
      Objects[i].x = i*200+1000;
    }
  }
    
  //Is being called from the main scene and runs the minigame
  public void StartMinigame(){  
    if(gamePlaying){
      if(gameStart){
        SetupRythm();
        gameStart = false;
      }
      
      SpawnObjects();
      CheckCollision();
      
      if(keyPressed == true && canPress == true)
      {
        keyNumber = keyCode;
      }else{keyNumber = 0;}
    }
  }
  
  //Spawns the objects and keeps them moving with the given speed
  private void SpawnObjects(){
    target = loadImage("Images/Target.png");
    image(target,targerLocationX,0);
    
    for(int i = 0; i < maxObjects; i++){
      Objects[i].x = Objects[i].x-speed;
      Objects[i].SpawnImage();
    }
  }
  
  // COLLISION CHECK PART
  void CheckCollision(){   
    for(int i = 0; i < maxObjects; i++)
    {
      if(Objects[i].x < target.width + targerLocationX && Objects[i].x > target.width + targerLocationX - target.width)
      {
        canPress = true;
        if(keyNumber == Objects[i].correctInput){
          Objects[i].y = -100;
        }else if(keyNumber != Objects[i].correctInput && keyNumber != 0){
          miniGameOver();
        }
      }
      if(Objects[i].x < target.width - target.width && Objects[i].y == 0){
          miniGameOver();
      }
      
      if(Objects[maxObjects-1].y <= -100 )
      {
        miniGameWon();
      }
    }
  }
  
  void miniGameOver(){
    gamePlaying = false;
    print("Game Over ");
    for(int i = 0; i < 6; i++){
      Objects[i].x = -100;
    }
    gameStart = true;
  }
  
  void miniGameWon(){
    gamePlaying = false;
    print("YOU DID IT");
    gameStart = true;
  }
}
