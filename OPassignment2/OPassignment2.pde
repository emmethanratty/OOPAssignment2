import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer music;

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
ArrayList<Tree> tree = new ArrayList<Tree>(gHeight);
ArrayList<Grass> grass = new ArrayList<Grass>(gHeight);
ArrayList<Mountain> mountain = new ArrayList<Mountain>(gHeight);
//Mountain mountain = new Mountain(gHeight);
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
  
   minim = new Minim(this);
   music = minim.loadFile("music.mp3");
  
   
   music.loop();
   
   setUpPlayerControllers();
   
   counter=0.0;
   SBG = loadImage("Volcano.png");
   BG = loadImage("background.png");
   TreeI = loadImage("tree.png");
   MountainI = loadImage("mountain.png");
   GrassI = loadImage("grass.png");
   RockyI = loadImage("rsz_rockyv3.png");
   RockyEye = loadImage("rsz_1rockyeye.png");
   
   for(int i = 0; i < 150; i++)
   {
     grass.add(new Grass(gHeight));
   }
   for(int i = 0; i < 5; i++)
   {
     mountain.add(new Mountain(gHeight));
   }
   for(int i = 0; i < 5; i++)
   {
     tree.add(new Tree(gHeight));
   }
   
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
      gameover.counter = 0;
      
      for(int i = 0; i < mountain.size(); i++)
      {  
        image(MountainI,mountain.get(i).mountainX,gHeight - mountain.get(i).mountainH,mountain.get(i).mountainW,mountain.get(i).mountainH);
      }
      for( int i = 0; i < tree.size(); i++)
      {
        image(TreeI,tree.get(i).treeX,gHeight-tree.get(i).treeH,tree.get(i).treeW,tree.get(i).treeH);
      }
      for(int i = 0; i < grass.size(); i++)
      {
        image(GrassI,grass.get(i).grassX,gHeight-grass.get(i).grassH,grass.get(i).grassW,grass.get(i).grassH);
      }
      //image(RockyI,rocky.rockyX - rocky.rockyW/2,rocky.rockyY - rocky.rockyH/2,rocky.rockyW,rocky.rockyH);  
      
     //counter += rocky.rollspeed;
     // rocky.run();
     for (Tree branch : tree) 
      {
        branch.run();
      }
      for (Grass blade : grass) 
      {
        blade.run();
      }
      for (Mountain rock : mountain) 
      {
        rock.run();
      }
     
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
   if(dist(p.pos.x,p.pos.y,magma.magmaX,magma.magmaY) <= p.rockyH - magma.magmaH) 
     {
        magma.magmaX = random(1000,1500);
        magma.magmaY = random(50,458);
        p.acc = p.acc + 20;
     }
     println(dist(p.pos.x,p.pos.y,magma.magmaX,magma.magmaY));
}


