Firework [] sparks;
int countdown = 10;
void setup()
{
  size(500, 500);
  background(0);
  sparks = new Firework[500];
  for (int i = 0; i < 451; i++) {
    sparks[i] = new Firework();
  }
  for (int i = 451; i < 500; i++) {
    sparks[i] = new Countdown();
  }
}
void draw()
{
  background(0);
  for (int i = 0; i < sparks.length; i++) {
    sparks[i].show();
    sparks[i].move();
  }
}
void mousePressed()
{
   for (int i = 0; i < 451; i++) {
    sparks[i] = new Firework();
  }
  for (int i = 451; i < 500; i++) {
    sparks[i] = new Countdown();
  }
 countdown = countdown - 1;
}
class Firework
{
  double myX;
  double myY;
  int myColor;
  double mySpeed;
  double myAngle;
  int mySize;

  Firework() {
    myX = 250;
    myY = 250;
    myColor = color(#FC1225);
    mySpeed = (double)(Math.random() * 5);
    myAngle = (double)(Math.random() * 100);
    mySize = 5;
  }

  void move() {
    myX = myX + (double)(Math.cos(myAngle) * mySpeed);
    myY = myY + (double)(Math.sin(myAngle) * mySpeed);
  }

  void show() {
    fill(myColor);
    ellipse((float)myX, (float)myY, 5, 5);
  }
}

class Countdown extends Firework
{
  Countdown() {
    myX = 250;
    myY = 250;
    myColor = color(#F7F243);
    mySpeed = (double)(Math.random() * 5);
    myAngle = (double)(Math.random() * 100);
    mySize = 5;
  }
  void show() {
    fill(myColor);
    textSize(20);
    if (countdown == 10 || countdown == 9 || countdown == 8 || countdown == 7 ||  countdown == 6 || countdown == 5 || countdown == 4 || countdown == 3 || countdown == 2 || countdown == 1){
      text(countdown, (float)myX, (float)myY);
    }
    if (countdown == 0){
      text("Happy New Year!", (float)myX, (float)myY);
    }
    if(countdown < 0){
      countdown = 10;
      text(countdown, (float)myX, (float)myY);
    }
    
  }
}
