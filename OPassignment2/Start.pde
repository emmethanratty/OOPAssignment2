class Start
{
  String title = "Rock Run";
  PFont font = createFont("Adobe Caslon Pro", 40);
  int selected = 0;
  int startS;
  int upgradeS;
  
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
 
  
  Start()
  {
    
    startS = 155;
    upgradeS = 155;
  } 
  
    Start( char up, char down, char left, char right, char start, char button1, char button2)
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
  
  Start( XML xml)
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
     display();
     buttons();
     selected(); 
     update();
  }
  void display()
  {
    textFont(font, 100);
     fill(#8787A3);
     stroke(0);
     text("Rocky Run!", width/2 - 105, height/4);
     text(gameover.magmaP, 500, 500);
     //println(selected);
  }
  void buttons()
  {
    fill(startS);
    rect(100,100,100,100);
    fill(upgradeS);
    rect(100,250,100,100);
  }
  void selected()
  {
    if(selected == '0')
    {
      startS = 255;
      upgradeS = 155;
    }
    if(selected == '1')
    {
      upgradeS = 255;
      startS = 155;
    }
  }
//  void keyPressed()
//  {
//   
//      if (key == 'w')
//      {  
//        selected = '0';
//      }
//      if (key == 's')
//      {  
//        selected = '1';
//      }
//  }
  
  void update()
  {
    if (checkKey(up))
    {
      selected = '0';
    }
    if (checkKey(down))
    {
      selected = '1';
    }
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
     // println("Player  button 1");
      if(option == '0')
      {
          if(selected == '0')
         {
           p.option = '1';
         }
         if(selected == '1')
         {
            p.option = '2'; 
         }
      }
    }
//    if (checkKey(button2))
//    {
//      println("Player " + index + " butt2");
//    }    
  }
}
