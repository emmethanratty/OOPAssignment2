class Magma
{
  int gHeight;
  int magmaW;
  int magmaH;
  float magmaX;
  float magmaY;
  float Macc;
  float frequency;
   
  Magma()
  {
    Macc = 4;
    frequency = 5000;
    magmaW = 30;
    magmaH = 30;
    magmaX = random(500,1000);
    magmaY = random(100  , gHeight - magmaH);
    gHeight = 458;
  }
  
  void run()
  {
     move(); 
     reset();
  }
  
  //moves the core
  void move()
  {
    magmaX -= Macc *(p.acc/100);
  }
  
  //rsets the core
  void reset()
  {
     if(magmaX < 0 - magmaW)
     {
        magmaX = random(2000,frequency);
        magmaY = random(100  , gHeight - magmaH);
     }
  }
}
