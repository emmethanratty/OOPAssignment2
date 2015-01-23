class Start
{
  String title = "Rock Run";
  PFont font = createFont("Adobe Caslon Pro", 40);
  char selected = '0';
 
  /*
  Start()
  {
  font = createFont("Adobe Caslon Pro", 40);
  textFont(font, 50);
  }
  */
  
  
  void run()
  {
     display();
     buttons();
     selected(); 
  }
  void display()
  {
    textFont(font, 100);
     fill(#8787A3);
     stroke(0);
     text("Rocky Run!", width/2 - 105, height/4);
  }
  void buttons()
  {
  }
  void selected()
  {
  }
}
