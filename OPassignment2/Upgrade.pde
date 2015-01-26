class Upgrade
{
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  
  int button11 = 155;
  int button22 = 155;
  int button3 = 155;
  int button4 = 155;
  

  
  Upgrade()
  {
    
  }
  
  Upgrade(char up, char down, char left, char right, char start, char button1, char button2)
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
  
  Upgrade(XML xml)
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
     update(); 
     display();
  }
  
  void display()
  {
     fill(button11);     
     rect(10,10,10,10);
     fill(button22);
     rect(10,20,10,10);
     fill(button3);
     rect(20,10,10,10);
     fill(button4);
     rect(20,20,10,10); 
  }
  
  void update()
  {
    if (checkKey(up))
    {
      button11 = 255;
      button22 = 155;
      button3 = 155;
      button4 = 155;
      
    }
    if (checkKey(down))
    {
      button11 = 155;
      button22 = 255;
      button3 = 155;
      button4 = 155;
    }
    if (checkKey(left))
    {
      button11 = 155;
      button22 = 155;
      button3 = 255;
      button4 = 155;
    }    
    if (checkKey(right))
    {
       button11 = 155;
      button22 = 155;
      button3 = 155;
      button4 = 255;
    }
    if (checkKey(start))
    {
  
    }
    if (checkKey(button1))
    {
      
    }
    if (checkKey(button2))
    {
      //if(option == '2')
     // {
        p.option = '0';
     // }
    }    
  }
}
