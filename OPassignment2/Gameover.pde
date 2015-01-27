class Gameover
{
  float magmaP;
  
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  
  Gameover()
  {
     magmaP = 0f;
  } 
  
  Gameover( char up, char down, char left, char right, char start, char button1, char button2)
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
  
  Gameover(XML xml)
  {
    this( buttonNameToKey(xml, "up")
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
    magmaP = p.distance/100;
    update();
  }
}

 void update()
  {
//    if (checkKey(up))
//    {
//      pos.y -= 1;
//    }
//    if (checkKey(down))
//    {
//      pos.y += 1;
//    }
//    if (checkKey(left))
//    {
//      pos.x -= 1;
//    }    
//    if (checkKey(right))
//    {
//      pos.x += 1;
//    }
//    if (checkKey(start))
//    {
//      println("Player " + index + " start");
//    }
    if (checkKey(button1))
    {
      
    }
//    if (checkKey(button2))
//    {
//      println("Player " + index + " butt2");
//    }    
  }
