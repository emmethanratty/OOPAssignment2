
PImage BG;
PImage TreeI;
PImage MountainI;
PImage GrassI;
PImage RockyI;
PImage RockyEye;

int gHeight = 458;
int ii = 1;
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
   RockyI = loadImage("rsz_rockyv3.png");
   RockyEye = loadImage("rsz_1rockyeye.png");
   
}  

void draw()
{
  background(BG);
  smooth();
  stroke(255);
  
  
    image(MountainI,mountain.mountainX,gHeight - mountain.mountainH,mountain.mountainW,mountain.mountainH);
  
    image(TreeI,tree.treeX,gHeight-tree.treeH,tree.treeW,tree.treeH);
  
    image(GrassI,grass.grassX,gHeight-grass.grassH,grass.grassW,grass.grassH);
    image(RockyI,rocky.rockyX - rocky.rockyW/2,rocky.rockyY - rocky.rockyH/2,rocky.rockyW,rocky.rockyH);  
  
   counter+=rocky.rollspeed;

   translate(rocky.rockyX, rocky.rockyY);
   rotate(counter*TWO_PI/360);
   translate(-rocky.rockyW/2, -rocky.rockyW/2);
   
  image(RockyEye,0,0,rocky.rockyW,rocky.rockyH);  
  
  
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
        else if(rocky.rockyY < gHeight)
        {
           rocky.nofloor = true; 
        }
        else
        {
          rocky.nofloor = true;
        }  
   }       
}
   

