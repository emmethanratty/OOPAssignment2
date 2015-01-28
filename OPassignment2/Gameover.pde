class Gameover
{
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  
  String CHSS;
  String NHS;
  
  float magmaP;
  float magmaT;
  int counter;
  float CHS;
  float NS;
     
  Gameover()
  {
    magmaP = 0;
    magmaT = 0;
    counter = 0;
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
     display(); 
     
     //loading high score from file
     String lines[] = loadStrings("Highscore.txt");

     String CHSS = lines[0];
      
     CHS =  Float.parseFloat(CHSS);
     text("High Score: " + CHS, 500,500);
  }

  
  
  void magmaP()
  {
    counter++;
    //only executes once
    if(counter == 1)
    {
      magmaP = p.Gdis/100;
      magmaT = magmaT + magmaP;
      
      NS = p.Gdis;
      
      //if the new score if bigger then current high score it sets it to new score
      if(NS > CHS)
      {
         String NHS = Float.toString(NS);
         String[] list = split(NHS, ' ');
         saveStrings("Highscore.txt", list);
         println(list);
      }//end inner if 
    } 
  }
  
  //drawing text and boxes
  void display()
  {
    fill(255);
    textSize(100);
    text("Game Over", width/2, height/2 - height/4);
    textSize(30);
    text("Button 1 to Restart", width - width/4,height - height/4);
    textSize(30);
    text("Button 2 to Get to Main Menu", 0,height - height/4);
    text("You scored " + magmaP + " Magma Points", width/2 - 30,height/2);
  }
  
  
  void update()
  {
    //resets game
    if (checkKey(button1))
    {
      p.option = '0';
    }
    //goes to main menu
    if (checkKey(button2))
    {
      p.option = '0';
    }   
  } 
}
