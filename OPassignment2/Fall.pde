class Fall extends GameObjects
{
  float gHeight;
  float fallX;
  float Facc = 4;
  float fallW = 200;
  float fallH = 300;
  
   Fall()
  {
     gHeight = 458;
     fallX = random(2000,3000);
  }
 
  void run()
 {
   display();
   move();
   reset();
   stopped();
 } 
 
 void display()
 {
   fill(0);
   stroke(0);
   //println(fallX);
   rect(fallX,gHeight,fallW,fallH);
   //println(gHeight - 50);
   //println(p.pos.y);
 }
 
 void move()
 {
     fallX -= Facc*(p.acc/100);; 
 }
 
 void reset()
 {
    if(fallX < 0 - fallW)
     {
        fallX = random(1500,2500);        
     } 
 }
 
 void stopped()
 {
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
        }
      }
    }
 }
}
