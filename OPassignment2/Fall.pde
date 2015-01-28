class Fall extends GameObjects
{
  float gHeight;
  float fallX;
  float Facc;
  float fallW;
  float fallH;
  
   Fall()
  {
     Facc = 4;
     fallW = 200;
     fallH = 300;
     gHeight = 458;
     fallX = random(2000,3000);
  }//end Fall constuctor
 
 //runs the methods
  void run()
 {
   display();
   move();
   reset();
   stopped();
 }//end run()

 //display code
 void display()
 {
   fill(0);
   stroke(0);
   rect(fallX,gHeight,fallW,fallH);
 }// end display()
 
 //movement code
 void move()
 {
     fallX -= Facc*(p.acc/100);; 
 }//end move()
 
 //reset code
 void reset()
 {
    if(fallX < 0 - fallW)
     {
        fallX = random(1500,2500);        
     } 
 }//end reset
 
 //stopped code
 void stopped()
 {
    //checks to see if player falls down the hole
    if( p.pos.x > fallX + p.rockyW/2 && p.pos.x < fallX + fallW )
    {
      if(p.pos.y >= gHeight - (p.rockyH)/2)
      {
        p.nofloor = true;
        p.acc = 10;
        p.falling = true;
        
        
        if(p.pos.y > height)
        {
           p.option = '3';
           p.pos.y = p.gHeight - p.rockyH/2;
           p.acc = 300;
           fallX = random(1500,2500);
           p.nofloor = false;
           p.Gdis = p.distance;
           p.distance = 0;
        }//end inner if
      }//end inner if
    }//end outer if
 }//end stopped()
}//end class
