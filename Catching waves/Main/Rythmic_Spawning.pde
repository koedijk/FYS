import java.util.Random;

Random randomNum = new Random();
Rythmic_Objects Objects;

//START OF THE CLASS
public class Rythmic_Spawning{
  PImage target;
  PImage target_pressed_left;
  PImage target_pressed_right;
  PImage target_pressed_up;
  PImage target_pressed_down;
  
  public boolean gameStart = true;
  public boolean gamePlaying = true;
  private boolean canPress = false;
  public boolean miniGameLost = false;
  
  private int keyNumber = 0;
  public int maxObjects = 6;
  public int speed = 5;
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
      if(gameStart){
        SetupRythm();
        gameStart = false;
        miniGameLost = false;
      }
      
      target = loadImage("Images/Target.png");
      target_pressed_left = loadImage("Images/Target_pressed_left.png");
      target_pressed_right = loadImage("Images/Target_pressed_right.png");
      target_pressed_up = loadImage("Images/Target_pressed_up.png");
      target_pressed_down = loadImage("Images/Target_pressed_down.png");
      
      if(keyPressed == true)
      {
        
        switch(keyCode){
          case(37):
          image(target_pressed_left, targerLocationX, 0);
          break;
          case(39):
          image(target_pressed_right, targerLocationX, 0);
          break;
          case(38):
          image(target_pressed_up, targerLocationX, 0);
          break;
          case(40):
          image(target_pressed_down, targerLocationX, 0);
          break;
        }
        
        if (canPress == true) {
          keyNumber = keyCode;
        }
      } else {
        keyNumber = 0;
        
      image(target, targerLocationX, 0);
      }
      
      SpawnObjects();
      CheckCollision();
  }
  
  //Spawns the objects and keeps them moving with the given speed
  private void SpawnObjects() {
    for(int i = 0; i < maxObjects; i++){
      Objects[i].x = Objects[i].x-speed;
      Objects[i].SpawnImage();
    }
  }
  
  // COLLISION CHECK PART
  void CheckCollision() {   
    for(int i = 0; i < maxObjects; i++)
    {
      if(Objects[i].x < targerLocationX && Objects[i].x > targerLocationX - target.width/2)
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
    gameStart = true;
    print("Game Over ");
    for(int i = 0; i < 6; i++){
      Objects[i].x = -100;
    }
    miniGameLost = true;
    rythmGame = false;
    score.SetMultiplier(1);  //reset combo
  }
  
  void miniGameWon(){
    gamePlaying = false;
    gameStart = true;
    rythmGame = false;
    score.SetMultiplier(score.multiplier*2);  //double the combo
  }
}
