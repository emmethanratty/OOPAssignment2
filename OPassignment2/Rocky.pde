class Rocky
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
   if(key == CODED)
   {
      if (keyCode == LEFT)
      {   
        if(rockyX > 0)
        {
          rockyX -= 3;
          rollspeed = 5;
        }       
      }//end left if 
      if (keyCode == RIGHT)
      {   
        if(rockyX < width)
        {
          rockyX += 3;
          rollspeed = 15;
        }       
      }//end left if 
      if (keyCode == DOWN)
      {   
        if(rockyX < width)
        {
          rollspeed = 10;
        }       
      }//end left if 
   }
   
    
  }
}    //end left if 


