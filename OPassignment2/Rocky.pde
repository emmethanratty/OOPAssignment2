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
  
  
  
  
   Rocky(int gHeight )
   {
     
     this.gHeight = gHeight;
     rockyY = this.gHeight - rockyH;
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
     if(rockyY == gHeight - rockyH)
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
        }       
      }//end left if 
      if (keyCode == RIGHT)
      {   
        if(rockyX < width)
        {
          rockyX += 3;
        }       
      }//end left if 
   }
   
    
  }
}    //end left if 


