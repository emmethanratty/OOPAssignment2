class Start
{
  String title = "Rock Run";
  PFont font = createFont("Adobe Caslon Pro", 40);
  char selected;
  int startS;
  int upgradeS;
 
  
  Start()
  {
    selected = '0';
    startS = 155;
    upgradeS = 155;
  } 
  
  
  
  void run()
  {
     display();
     buttons();
     selected(); 
     keyPressed();
  }
  void display()
  {
    textFont(font, 100);
     fill(#8787A3);
     stroke(0);
     text("Rocky Run!", width/2 - 105, height/4);
     println(selected);
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
  void keyPressed()
  {
    if(key == CODED)
    {
      if (keyCode == UP)
      {  
        selected = '0';
      }
      if (keyCode == DOWN)
      {  
        selected = '1';
      }
    }
  }
}
