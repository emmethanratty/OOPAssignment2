
PImage BG;
PImage Tree;
PImage Mountain;
PImage Grass;
PImage Rocky;

int gHeight = 458;
int treeH = 200;
int treeW = 200;
int rockyH = 100;
int rockyW = 100;
int mountainH = 300;
int mountainW = 300;
int grassH = 5;
int grassW = 5;
float treex;
float mountainx;
float grassx;
float rockyx;

void setup()
{
   size(1000,600); 
   translate(0, 0);
   
   mountainx = random(0,500);
   treex = random(0,500);
   grassx = random(0,500);
   rockyx = 200;
   
   BG = loadImage("background.png");
   Tree = loadImage("tree.png");
   Mountain = loadImage("mountain.png");
   Grass = loadImage("grass.png");
   Rocky = loadImage("rocky.V2.png");
}  

void draw()
{
  background(BG);
  smooth();
  stroke(255);
  image(Mountain,mountainx,gHeight - mountainH,mountainW,mountainH);
  image(Tree,treex,gHeight-treeH,treeW,treeH);
  image(Grass,grassx,gHeight-grassH,grassW,grassH);
  
  
  pushMatrix();
  rotate(HALF_PI);
  translate(width>>1, height>>1);
  image(Rocky,rockyx,gHeight - rockyH,rockyW,rockyH);
  popMatrix();
  
  treex -= 4;
  grassx -= 4;
  mountainx -= .1f;
  if(treex < 0 - treeW)
  {
    treex = random(800,2000); 
  }
  if(mountainx < 0 - mountainW)
  {
    mountainx = random(700,2000); 
  }
  if(grassx < 0 - grassW)
  {
    grassx = random(800,2000); 
  }
}
void keyPressed()
{
   if(key == CODED)
    {
      if (keyCode == LEFT)
      {   
        if(rockyx > 0)
        {
          rockyx -= 3;
        }       
      }//end left if 
      if (keyCode == RIGHT)
      {   
        if(rockyx < width)
        {
          rockyx += 3;
        }       
      }//end left if 
    }
}
