class Player
{
  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  
  boolean nofloor;
  boolean nojump;
  
  int gHeight = 458;
  
  float rockyH = 100;
  float rockyW = 100;
  float rockyX = 50;
  float rockyY;
  float gravityF = 5;
  float rockyISize;
  float jumpH = 300;
  float rollspeed = 10;
  
  char option = '0';
    
  Player()
  {
    pos = new PVector(width / 2, height / 2);
    pos.y = gHeight - rockyH/2;
    pos.x = width/2;
  }
  
  Player( char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player( XML xml)
  {
    this(
          buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
  void run()
  {
     update();
    display();
    gravity(); 
  }
  
  
  void update()
  {
    if (checkKey(up))
    {
      if(option == '1')
      {
         if(pos.y > jumpH && nofloor == false)
          {        
               pos.y -= 5;
          } 
          else
          {
            nojump = false;
            nofloor = true;
          } 
      }
    }
    else
    {
      if(option == '1')
      {
        if(pos.y < gHeight - rockyH/2)
          {        
               nofloor = true;
          } 
      }
    }
    /*
    if (checkKey(down))
    {
      pos.y += 1;
    }
    */
    if (checkKey(left))
    {
      pos.x -= 3;
      rollspeed = 5;
    }    
    if (checkKey(right))
    {
      pos.x += 3;
      rollspeed = 15;
    }
    if (checkKey(start))
    {
      println("Player start");
    }
    if (checkKey(button1))
    {
      println("Player button 1");
    }
    if (checkKey(button2))
    {
      println("Player butt2");
    }    
  }
  
  void display()
  { 
    
     image(RockyI,pos.x - rockyW/2,pos.y -rockyH/2,rockyW,rockyH);      
     translate(pos.x, pos.y);
       
     rotate(counter*TWO_PI/360);
     
     translate(-rocky.rockyW/2, -rocky.rockyW/2);
       
     image(RockyEye,0,0,rocky.rockyW,rocky.rockyH);
  } 
 
  void gravity()
   {
     
     println(pos.y - rockyH/2);
     if(nofloor)
     {
        pos.y += gravityF; 
     }
     if(pos.y == gHeight - rockyH/2)
     {
       nofloor = false;
     }
     
   }
}
