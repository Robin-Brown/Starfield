Particle[] it;
int part = 1;
double thatX = 0;
void setup()
{
  size(700, 600);
  frameRate(90);
  it = new Particle[1000];
  for(int i = 0; i < it.length; i++)
  {
    it[i] = new OddballParticle();

  }
}
void draw()
{
  background(206,251,255);
  for(int i = 0; i < part; i++)
  {
    it[i].move();
    it[i].show();
    if(it[i].myY < 150 && part != 100)
    {
      for(int j = 0; j < it.length; j++)
      {
        thatX = it[0].myX;
        it[j] = new Particle();
        part = 100;

      }
    }
  }

}
void mousePressed()
{
  redraw();
  part = 1;
  for(int i = 0; i < it.length; i++)
  {
    it[i] = new OddballParticle();

  }
  

}
class Particle
{
  double myX,myY,angle,speed;
  Particle()
  {
    myX = thatX;
    myY = 150;
    speed = (int)(Math.random()*20);
    angle = Math.random()*2*Math.PI;
  }
  void move()
  {

    myX += Math.cos(angle)*speed;
    myY += Math.sin(angle)*speed;

  }

  void show()
  {
    fill(255);
    noStroke();
    ellipse((float)myX, (float)myY, 10.0, 10.0);

  }
}
class OddballParticle extends Particle{
  int boundary;
  OddballParticle()
  {
    myX = mouseX;
    myY = 700;
    speed = 20;
    boundary = 0;
  }

  void move()
  {
    myX += (int)(Math.random()*10) - 5;
    myY -= Math.random()*speed;

    if(myY < boundary)
    {
      speed = 5;
    }
  }

  void show()
  {
    fill(255);
    rect((float)myX, (float)myY, 10.0, 10.0);
  }

}
