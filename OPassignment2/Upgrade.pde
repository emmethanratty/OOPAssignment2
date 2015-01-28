class Upgrade
{
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  
  int button11;
  int button22;
  int button3;
  int button4;
  
  float jumpP;
  float accP;
  float magP;
  float moveP;
  
  char selected;

  
  Upgrade()
  {
    jumpP = 10;
    accP = 10;
    magP = 10;
    moveP = 10;
    
    button11 = 155;
    button22 = 155;
    button3 = 155;
    button4 = 155;
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
     display();
     update(); 
  }
  
  //displays text and boxes
  void display()
  {
     fill(button11);     
     rect(width/2 - 100,height/2 -50,200,100);
     textSize(20);
     fill(0);
     text("Upgrade Jump \n Price: " + jumpP, width/2 - 60,height/2 );
     fill(button22);
     rect(width/2 - 100,height-220,200,100);
     textSize(20);
     fill(0);
     text("Upgrade Acceleration \n Price: " + accP, width/2 - 80,height-180 );
     fill(button3);
     rect(10,height/2,200,100);
     textSize(20);
     fill(0);
     text("Magma Cube \n frequency \n Price: " + magP, 10,height/2 + 20 );
     fill(button4);
     rect(width-220,height/2,200,100);
     textSize(20);
     fill(0);
     text("Upgrade Movement \n speed \n Price: " + moveP,width-220,height/2 + 20 );
    
    fill(255);
    textSize(100);
    text("Upgrades", width/2 - 105, height/4);
    textSize(50);
    text("Magma points:"  + gameover.magmaT, 500, 550); 
    textSize(30);
    text("Press Button 2 to go back", 0, 550); 
  }
  
  void update()
  {
    //changes colour depended on what is selected
    if (checkKey(up))
    {
      selected = '0'; 
     button11 = 255;
         button22 = 155;
         button3 = 155;
         button4 = 155; 
    }
    if (checkKey(down))
    {
      selected = '1';
      button11 = 155;
         button22 = 255;
         button3 = 155;
         button4 = 155;       
    }
    if (checkKey(left))
    {
      selected = '2';
       button11 = 155;
          button22 = 155;
          button3 = 255;
          button4 = 155;
    }    
    if (checkKey(right))
    {
      selected = '3';
      button11 = 155;
         button22 = 155;
         button3 = 155;
         button4 = 255; 
    }
    if (checkKey(button1))
    {
      switch(selected)
      {
        case '0':
        {
          //if magma power is more then the price upgrades
           if( gameover.magmaT > jumpP)
           {
             p.currentJH -= 10;
             gameover.magmaT = gameover.magmaT - jumpP;
             println("worked");
             selected = '5';
             jumpP = jumpP * 1.2;
             fill(255,0,0);
             textSize(30);
             text("Upgraded!", width/2 - 100 ,height/2); 
           }
           else
           {
             fill(255,0,0);
             textSize(30);
             text("Not Enough Magma Points", width/2 - 100 ,height/2); 
           }
           break;
        }
        case '1':
        {
          //if magma power is more then the price upgrades
           if( gameover.magmaT > accP)
           {
             p.Cacc += 20;
             gameover.magmaT = gameover.magmaT - accP;
             println("worked");
             selected = '5';
             accP = accP * 1.2;
              fill(255,0,0);
             textSize(30);
             text("Upgraded!", width/2 - 100 ,height/2); 
           }
           else
           {
              fill(255,0,0);
             textSize(30);
             text("Not Enough Magma Points", width/2 - 100 ,height/2);  
           } 
           break;
        }
        case '2':
        {
          //if magma power is more then the price upgrades
          if( gameover.magmaT > magP)
           {
             magma.frequency -= 20;
             gameover.magmaT = gameover.magmaT - magP;
             println("worked");
             selected = '5';
             magP = magP * 1.2;
              fill(255,0,0);
             textSize(30);
             text("Upgraded!", width/2 - 100 ,height/2); 
           }
           else
           {
              fill(255,0,0);
             textSize(30);
             text("Not Enough Magma Points", width/2 - 100 ,height/2);  
           }
           break;
        }
        case '3':
        {
          //if magma power is more then the price upgrades
          if( gameover.magmaT > moveP)
           {
             p.moveS++;
             gameover.magmaT = gameover.magmaT - moveP;
             println("worked");
             selected = '5';
             moveP = moveP * 1.2;
              fill(255,0,0);
             textSize(30);
             text("Upgraded!", width/2 - 100 ,height/2);  
           }
           else
           {
              fill(255,0,0);
             textSize(30);
             text("Not Enough Magma Points", width/2 - 100 ,height/2);  
           }
           break;
        }      
      }
    }
    // goes back to main menu
    if (checkKey(button2))
    {
     p.option = '0';
    }    
  }
}
