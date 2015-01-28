class Mountain
{
  int gHeight;
  
  float mountainH;
  float mountainW;
  float mountainX;
  float Macc;
  
  Mountain(int gHeight)
  {
    this.gHeight = gHeight;
    mountainH = random(200,400);
    mountainW = random(200,400);
    mountainX = random(0,1000); 
    Macc = 0.1f;
  }
  
  void run()
  {
    move();
    reset(); 
  }
  
  //moves mountains... it must be love
  void move()
  {
     mountainX -= Macc *(p.acc/100);
  }
  
  //resets the mountains
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
