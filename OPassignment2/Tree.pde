class Tree
{
  int gHeight;
  float treeH = random(200,350);
  float treeW = random(150,250);
  float treeX = random(0,1000);
  
  Tree(int gHeight)
  {
     this.gHeight = gHeight;
  } 
  
  void run()
  {
    move();
    reset();
  }
  
  void move()
  {
     treeX -= 4; 
  }
  void reset()
  {
     if(treeX < 0 - treeW)
     {
       treeX = random (1000,1500);
       treeH = random(200,350);
       treeW = random(150,250);
     } 
  }
  
  
}
