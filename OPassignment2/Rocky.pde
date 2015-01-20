class Rocky
{
  int gHeight;
  int rockyH = 100;
  int rockyW = 100;
  float rockyx = 50;
  
  
   Rocky(int gHeight)
   {
     this.gHeight = gHeight;
   }
 
   void run()
   {
     keyPressed();
   }
   void keyPressed()
  {
   if(key == CODED)
    {
      if (keyCode == LEFT)
      {   
        if(rockyx > 0)
        {
          rockyx -= 3;
        }       
      }//end left if 
      if (keyCode == RIGHT)
      {   
        if(rockyx < width)
        {
          rockyx += 3;
        }       
      }//end left if 
    }
}
   
}
