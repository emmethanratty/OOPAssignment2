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
  boolean falling;
  
  int gHeight = 458;
  int moveS = 3;
  
  float rockyH = 100;
  float rockyW = 100;
  float rockyX = 50;
  float rockyY;
  float gravityF = 5;
  float rockyISize;
  float currentJH = 300;
  float jumpH = currentJH;
  float rollspeed = 4;
  float distance = 0;
  float Cacc = 300f;
  float acc = Cacc;
  float Gdis;
  
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
    stopped();
    
    jumpH = currentJH;
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
        //checks ti make sure player is still on screen
        if(pos.y < gHeight - rockyH/2)
          {        
               nofloor = true;
          } 
      }
    }
    if (checkKey(left))
    {
      if(falling == false)
      {
        //checks ti make sure player is still on screen
        if(pos.x > 0)
        {
          pos.x -= moveS;
          rollspeed = 2 *(acc/100);
          distance -= .1f;  
        }
      }
    }
    //changes rollspeed back to normal
    else
    {
      rollspeed = 4*(acc/100);
    }    
    if (checkKey(right))
    {
      if(falling == false)
      {
        if(pos.x < width)
        {
          pos.x += moveS;
          rollspeed = 6*(acc/100);
          distance += .1f;
        }
      }
    }
    //changes rollspeed back to normal
     else
    {
      rollspeed = 4*(acc/100);
    }   
  }

  //displays text and images  
  void display()
  { 
    textSize(30);
    text("Distance: " + distance,30,50);
    text("Acceleration: " + acc,30,100);
    
     image(RockyI,pos.x - rockyW/2,pos.y -rockyH/2,rockyW,rockyH);      
     translate(pos.x, pos.y);
       
     rotate(counter*TWO_PI/360);
     
     translate(-rockyW/2, -rockyW/2);
       
     image(RockyEye,0,0,rockyW,rockyH);
     
     counter += rollspeed *(acc/100);
  } 
 
  //makes gravity
  void gravity()
  {
     if(nofloor)
     {
        pos.y += gravityF; 
     }
     if(pos.y == gHeight - rockyH/2)
     {
       nofloor = false;
     }   
   }
   
   //when stopped
   void stopped()
   {
     if(option == '1')
     {
       distance+= .2f*(acc/100);
       acc -= .1f;
       // checks to see if stopped
       if( acc < 0 )
       {
          option = '3';
         Gdis = distance;
         distance= 0f;
         acc = Cacc; 
       }
     }
   }
}
