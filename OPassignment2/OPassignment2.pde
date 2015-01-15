
PImage BG;
PImage Tree;
PImage Mountain;
PImage Grass;

int gHeight = 458;
int treeH = 100;
int treeW = 100;
int mountainH = 300;
int mountainW = 300;
int grassH = 5;
int grassW = 5;
float treex;
float mountainx;
float grassx;

void setup()
{
   size(1000,600); 
   
   mountainx = random(0,500);
   treex = random(0,500);
   grassx = random(0,500);
   
   BG = loadImage("background.png");
   Tree = loadImage("tree.png");
   Mountain = loadImage("mountain.png");
   Grass = loadImage("grass.png");
}  

void draw()
{
  background(BG);
  smooth();
  stroke(255);
  image(Mountain,mountainx,gHeight - mountainH,mountainW,mountainH);
  image(Tree,treex,gHeight-treeH,treeW,treeH);
  image(Grass,grassx,gHeight-grassH,grassW,grassH);
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
