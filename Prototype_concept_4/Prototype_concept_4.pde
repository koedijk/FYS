
//Get player variables
float playerX = 250;
float playerY = 20;
float playerVelocityX = 0;
float playerVelocityY = -2;
float playerHorizontalSpeed = 2;
float playerJetpackSpeed = .2;
float playerSize = 12;
float playerMaxSpeed = 6;
int playerMove;

//get constants
float GRAVITY = .1;
boolean onGround;

//Get input variables
float jetpackKey;
float leftKey;
float rightKey;
float jumpLeftKey;
float jumpRightKey;
boolean keyz[] = new boolean [4];


void setup() {
  size(500, 500);
}

void keyPressed() {
  if (key == 'd')  keyz[0] = true;
  if (key == 'a')  keyz[1] = true;
  if (key == ' ')  keyz[2] = true;
  if (key == 'w')  keyz[3] = true;
}

void keyReleased() {
  if (key == 'd')  keyz[0] = false;
  if (key == 'a')  keyz[1] = false;
  if (key == ' ')  keyz[2] = false;
  if (key == 'w')  keyz[3] = false;
}

////Get input
//void keyPressed()
//{
//  if (key == ' ')
//  {
//    playerVelocityY -= playerJetpackSpeed;
//  }
//   
//   
//  if (key == CODED)
//  {
//    if (keyCode == LEFT)
//    {
//      leftKey = 1;
//    }
//    if (keyCode == RIGHT)
//    {
//      rightKey = 1;
//    }
//  }
//}


void draw() {
  frameRate(60);
  background(0);
  
  //move the player
  playerVelocityY += GRAVITY;      //gravity
  if (keyz[2] == true) {
    playerVelocityY -= playerJetpackSpeed;
  }
  if (keyz[0] == true) {
    playerMove += 1;
  }
  if (keyz[1] == true) {
    playerMove -= 1;
  }
  
  
  playerVelocityX = playerMove * playerHorizontalSpeed;
  if (playerVelocityY > playerMaxSpeed) playerVelocityY = playerMaxSpeed;
  if (playerVelocityX > playerMaxSpeed) playerVelocityX = playerMaxSpeed;
  
  playerX += playerVelocityX;         //add velocities
  playerY += playerVelocityY;
  rect(playerX-(playerSize/2), playerY-(playerSize/2), playerSize, playerSize);       //draw the player with the center point in the middle of the square
  
  playerMove = 0;
  
}
