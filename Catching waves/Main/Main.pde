Waves waves;
Character character;

void setup() {
  size(800, 600);
  waves = new Waves();
  character = new Character();
  waves.waveSetup();
}

void draw() {
  background(73, 149, 255);
  //calcWave();
  //renderWave();
  waves.drawWaves();
  character.drawCharacter();
}

void keyPressed(){
  character.moveCharacter();
}
