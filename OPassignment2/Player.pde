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
  int index;
  color colour;
  
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
    
  Player()
  {
    pos = new PVector(width / 2, height / 2);
  }
  
  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player(int index, color colour, XML xml)
  {
    this(index
        , colour
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
  void update()
  {
    if (checkKey(up))
    {
       if(pos.y > jumpH)
        {  
           pos.y -= 5;
        }
        else
        {
          rocky.nofloor = true;
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
    }    
    if (checkKey(right))
    {
      pos.x += 3;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      println("Player " + index + " button 1");
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
    }    
  }
  
  void display()
  { 
    
     image(RockyI,pos.x - rockyW/2,pos.y -rockyH/2,rocky.rockyW,rocky.rockyH);      
     translate(pos.x, pos.y);
       
     rotate(counter*TWO_PI/360);
     
     translate(-rocky.rockyW/2, -rocky.rockyW/2);
       
      image(RockyEye,0,0,rocky.rockyW,rocky.rockyH);
  } 
 
  void gravity()
   {
     if(nofloor)
     {
        pos.y += gravityF; 
     }
     if(rockyY == gHeight - rockyH/2)
     {
       nofloor = false;
     }
   }
    
}
