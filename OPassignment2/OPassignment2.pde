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
PImage MagmaCore;

int gHeight;
float i = 0;
float counter;
char option = '0';

ArrayList<Tree> tree = new ArrayList<Tree>(gHeight);
ArrayList<Grass> grass = new ArrayList<Grass>(gHeight);
ArrayList<Mountain> mountain = new ArrayList<Mountain>(gHeight);

GameObjects[] gameObjects;

Magma magma;
Gameover gameover;
Start start;
Upgrade upgrade;
Player p;

boolean[] keys = new boolean[526];

void setup()
{
   size(1000,600);
   
   gHeight = 458;
  
   minim = new Minim(this);
   music = minim.loadFile("music.mp3");
   music.loop();
   
   gameObjects =new GameObjects[1];
   
   gameObjects[0] = new Fall();
   magma = new Magma();
   
   setUpPlayerControllers();
   
   counter=0.0;
   SBG = loadImage("Volcano.png");
   BG = loadImage("background.png");
   TreeI = loadImage("tree.png");
   MountainI = loadImage("mountain.png");
   GrassI = loadImage("grass.png");
   RockyI = loadImage("rsz_rockyv3.png");
   RockyEye = loadImage("rsz_1rockyeye.png");
   MagmaCore = loadImage("magmacore.png");
   
   for(int i = 0; i < 100; i++)
   {
     grass.add(new Grass(gHeight));
   }//end for to add 100 grass classes
   for(int i = 0; i < 5; i++)
   {
     mountain.add(new Mountain(gHeight));
   }//end for to add 5 Mountain classes
   for(int i = 0; i < 5; i++)
   {
     tree.add(new Tree(gHeight));
   }//end for to add 5 tree classes 
}//end setup 

void draw()
{
  //Switch to change the game mode
  switch(p.option)
  {
    case '0':
    {
      background(SBG);
      start.run(); 
      
      break;
    }//end case 0 (Start Menu)
    case '1':
    {
      background(BG);
      smooth();
      stroke(255);
      gameover.counter = 0;
      
      for(int i = 0; i < mountain.size(); i++)
      {  
        image(MountainI,mountain.get(i).mountainX,gHeight - mountain.get(i).mountainH,mountain.get(i).mountainW,mountain.get(i).mountainH);
      }//end for to move a certain mountain of the arraylist
      for( int i = 0; i < tree.size(); i++)
      {
        image(TreeI,tree.get(i).treeX,gHeight-tree.get(i).treeH,tree.get(i).treeW,tree.get(i).treeH);
      }//end for to move a certain Tree of the arraylist
      for(int i = 0; i < grass.size(); i++)
      {
        image(GrassI,grass.get(i).grassX,gHeight-grass.get(i).grassH,grass.get(i).grassW,grass.get(i).grassH);
      }//end for to move a certain Grass of the arraylist
      image(MagmaCore,magma.magmaX,magma.magmaY,magma.magmaW,magma.magmaH);  
      
      for (Tree branch : tree) 
      {
        branch.run();
      }//end for to run the class
      for (Grass blade : grass) 
      {
        blade.run();
      }//end for to run the class
      for (Mountain rock : mountain) 
      {
        rock.run();
      }//end for to run the class
     
      gameObjects[0].run();
      magma.run();
      p.run();
      
      hitbox();
            
      break;
    }// end case 1 (Running the game)
    case '2':
    {
      background(0);
      upgrade.run();
      
      break;
    }// end case 2 (Upgrade Menu)
    case '3':
    {
      background(0);
      gameover.run();
      p.falling = false;
      
      break; 
    }//end case 3 (Gameover screen)
  }//end Switch (Decides the game mode)
}

void keyPressed()
{
  
   keys[keyCode] = true;         
}//end key pressed
void keyReleased()
{
  keys[keyCode] = false;
}//end key released

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}//End checkKey()

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
}//end buttonNametoKey()

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML playerXML = xml.getChild("player");
  
  
  gameover = new Gameover(playerXML);
  start = new Start(playerXML);
  upgrade = new Upgrade(playerXML);
  
  p = new Player( playerXML);
}//end setUpPlayerController

void hitbox()
{
   if(dist(p.pos.x,p.pos.y,magma.magmaX,magma.magmaY) <= p.rockyH - magma.magmaH) 
     {
        magma.magmaX = random(2000,magma.frequency);
        magma.magmaY = random(50,458);
        p.acc = p.acc + 20;
     }
     println(dist(p.pos.x,p.pos.y,magma.magmaX,magma.magmaY));
}//end hitbox


