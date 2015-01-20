class Grass
{
  int gHeight;
  float grassH = random(2,10);
  float grassW = 5;
  float grassX = random(0,1000);
  
  
   Grass(int gHeight)
  {
     this.gHeight = gHeight;
  } 
  
  void run()
  {
     move();
     reset(); 
  }
  
  void move()
  {
     grassX -= 4; 
  }
  
  void reset()
  {
     if(grassX < 0 - grassW)
     {
        grassX = random(1000,1500);
        grassH = random(2,5);
     }
  }
}
