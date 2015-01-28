class Grass
{
  int gHeight;
  float grassH = random(2,10);
  float grassW;
  float grassX = random(0,1000);
  float Gacc;
   
   Grass(int gHeight)
  {
    grassW = 5;
    Gacc = 4;
    this.gHeight = gHeight;
  } 
  
  void run()
  {
     move();
     reset(); 
  }
  // moves grass
  void move()
  {
     grassX -= Gacc *(p.acc/100);
  }
  // resets grass
  void reset()
  {
     if(grassX < 0 - grassW)
     {
        grassX = random(1000,1500);
        grassH = random(2,5);
     }
  }
}
