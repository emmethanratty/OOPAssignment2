/*class Rocky
{
  boolean nofloor;
  boolean jump;
  
  int gHeight;
  float rockyH = 100;
  float rockyW = 100;
  float rockyX = 50;
  float rockyY;
  float gravityF = 5;
  float rockyISize;
  float jumpH;
  float rollspeed = 10;
  
  
  
  
   Rocky(int gHeight )
   {
     
     this.gHeight = gHeight;
     rockyY = gHeight - rockyH/2;
     jumpH = gHeight - 200;
   }
 
   void run()
   {
     keyPressed();
     gravity();
   }
   
   void gravity()
   {
     if(nofloor)
     {
        rockyY += gravityF; 
     }
     if(rockyY == gHeight - rockyH/2)
     {
       nofloor = false;
     }
   }
   
  void keyPressed()
  {
   
      if (key == 'a')
      {   
        if(rockyX > 0)
        {
          rockyX -= 3;
          rollspeed = 5;
        }       
      }
      if (key == 'd')
      {   
        if(rockyX < width)
        {
          rockyX += 3;
          rollspeed = 15;
        }       
      } 
  }
}
*/


