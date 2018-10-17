
HightlightButton button;
Score score;
PFont font; 

void setup()
{
  button = new HightlightButton();
  score = new Score();
  size(800, 600);
  button.Setup();
  score.Start();
}

void draw()
{
  //button.Draw();
  score.Update();
  //showMenu();
}

public void showMenu() 
{  
  background(255, 204, 0);
  fill(0);
  textSize(32);
  text(" Your football program ", 150, 100, 3);
  textSize(14);
  text("Press 1 See chart football ", 100, 200);
  text("Press 2 See football statistics ", 100, 220);
  text("Press x to quit ", 100, 260);
} 
