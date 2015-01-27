class Gameover
{
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  
  float magmaP;
  float magmaT;
  int counter = 0;
     
  Gameover()
  {
    magmaP = 0;
    magmaT = 0;
  }
  
  Gameover(char up, char down, char left, char right, char start, char button1, char button2)
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
     magmaP();
     println(magmaP);
     println(magmaT);
     
  }
  
  void magmaP()
  {
    counter++;
    if(counter == 1)
    {
      magmaP = p.Gdis/100;
      magmaT = magmaT + magmaP;
      
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
      p.option = '0';
    }
    if (checkKey(button2))
    {
      p.option = '0';
    }   
  }
  
}
