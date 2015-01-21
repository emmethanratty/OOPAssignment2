
PImage BG;
PImage TreeI;
PImage MountainI;
PImage GrassI;
PImage RockyI;

int gHeight = 458;
float i = 0;
float counter;

Rocky rocky = new Rocky(gHeight);
Tree tree = new Tree(gHeight);
Grass grass = new Grass(gHeight);
Mountain mountain = new Mountain(gHeight);


void setup()
{
   size(1000,600); 
   
   counter=0.0;
   BG = loadImage("background.png");
   TreeI = loadImage("tree.png");
   MountainI = loadImage("mountain.png");
   GrassI = loadImage("grass.png");
   RockyI = loadImage("rsz_rockyv2.png");
   
}  

void draw()
{
  background(BG);
  smooth();
  stroke(255);
  
  
    image(MountainI,mountain.mountainX,gHeight - mountain.mountainH,mountain.mountainW,mountain.mountainH);
  
    image(TreeI,tree.treeX,gHeight-tree.treeH,tree.treeW,tree.treeH);
  
    image(GrassI,grass.grassX,gHeight-grass.grassH,grass.grassW,grass.grassH);
  
   counter+=rocky.rollspeed;

   translate(rocky.rockyX, rocky.rockyY);
   rotate(counter*TWO_PI/360);
   translate(-rocky.rockyW/2, -rocky.rockyW/2);
   
  image(RockyI,0,0,rocky.rockyW,rocky.rockyH);  
  
  
  rocky.run();
  tree.run();
  grass.run();
  mountain.run();
}

void keyPressed()
{
 if (keyCode == ' ')
    {   
      if(rocky.rockyY > rocky.jumpH)
      {  
         rocky.rockyY -= 5;
      } 
      else
      {
        rocky.nofloor = true;
      }       
    } 
}
   

