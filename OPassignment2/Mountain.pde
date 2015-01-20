class Mountain
{
  int gHeight;
  
  float mountainH = random(200,400);
  float mountainW = random(200,400);
  float mountainX = random(0,1000);
  
  Mountain(int gHeight)
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
     mountainX -= .1f;
  }
  
  void reset()
  {
    if(mountainX < 0 - mountainW)
    {
       mountainH = random(200,400);
       mountainW = random(200,400);
       mountainX = random(1000,1500); 
    }
  
  }  
}
