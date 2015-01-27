class Magma
{
  int gHeight;
  int magmaW;
  int magmaH;
  float magmaX;
  float magmaY;
  float Macc = 4;
   
  Magma()
  {
    magmaW = 30;
    magmaH = 30;
    magmaX = random(500,1000);
    magmaY = random(100  , gHeight - magmaH);
    gHeight = 458;
  }
  
  void run()
  {
     display();
     move(); 
     reset();
  }
  
  void display()
  {
    fill(255);
    rect(magmaX,magmaY,magmaW,magmaH);
   // println(magmaX);
   // println(magmaY);
  }
  
  void move()
  {
    magmaX -= Macc *(p.acc/100);
  }
  
  void reset()
  {
     if(magmaX < 0 - magmaW)
     {
        magmaX = random(1000,1500);
        magmaY = random(50,458);
     }
  }
}
