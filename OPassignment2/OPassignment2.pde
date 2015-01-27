
PImage BG;
PImage SBG;
PImage TreeI;
PImage MountainI;
PImage GrassI;
PImage RockyI;
PImage RockyEye;

int gHeight = 458;
float i = 0;
float counter;
char option = '0';

//Rocky rocky = new Rocky(gHeight);
Tree tree = new Tree(gHeight);
Grass grass = new Grass(gHeight);
Mountain mountain = new Mountain(gHeight);
Fall fall = new Fall();
Magma magma = new Magma();
Gameover gameover;
Start start;
Upgrade upgrade;
Player p;

boolean[] keys = new boolean[526];


void setup()
{
   size(1000,600); 
   
   setUpPlayerControllers();
   
   counter=0.0;
   SBG = loadImage("Volcano.png");
   BG = loadImage("background.png");
   TreeI = loadImage("tree.png");
   MountainI = loadImage("mountain.png");
   GrassI = loadImage("grass.png");
   RockyI = loadImage("rsz_rockyv3.png");
   RockyEye = loadImage("rsz_1rockyeye.png");
   
}  

void draw()
{
  switch(p.option)
  {
    case '0':
    {
      background(SBG);
      start.run();
      
      break;
    }
    case '1':
    {
      background(BG);
      smooth();
      stroke(255);
        
      image(MountainI,mountain.mountainX,gHeight - mountain.mountainH,mountain.mountainW,mountain.mountainH);
      
      image(TreeI,tree.treeX,gHeight-tree.treeH,tree.treeW,tree.treeH);
      
      image(GrassI,grass.grassX,gHeight-grass.grassH,grass.grassW,grass.grassH);
      //image(RockyI,rocky.rockyX - rocky.rockyW/2,rocky.rockyY - rocky.rockyH/2,rocky.rockyW,rocky.rockyH);  
      
     //counter += rocky.rollspeed;
     // rocky.run();
      tree.run();
      grass.run();
      mountain.run();
      fall.run();
      magma.run();
      hitbox();
      
      //for(Player player:players)
      //{
      p.run();
      //}
      
      //translate(p.pos.x, p.pos.y);
      // rotate(counter*TWO_PI/360);
      // translate(-rocky.rockyW/2, -rocky.rockyW/2);
      //image(RockyEye,0,0,rocky.rockyW,rocky.rockyH);             
      break;
    }
    case '2':
    {
      background(0);
      upgrade.run();
      
      break;
    }
    case '3':
    {
      background(0);
      gameover.run();
      
       break; 
    }
  }
}

void keyPressed()
{
  
   keys[keyCode] = true;
   
//   if (key == 'e')
//   { 
//       if(option == '0')
//       {
//         if(start.selected == '0')
//         {
//           p.option = '1';
//         }
//         if(start.selected == '1')
//         {
//            p.option = '2'; 
//         }
//         
//       }
//   }       
}
void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML playerXML = xml.getChild("player");
  
  
  gameover = new Gameover(playerXML);
  start = new Start(playerXML);
  upgrade = new Upgrade(playerXML);
  
  p = new Player( playerXML);
}

void hitbox()
{
   if(dist(p.pos.x,p.pos.y,magma.magmaX,magma.magmaY) <= p.rockyH) 
     {
        magma.magmaX = random(1000,1500);
        magma.magmaY = random(50,458);
        p.acc = p.acc + 20;
     }
     println(dist(p.pos.x,p.pos.y,magma.magmaX,magma.magmaY));
}

