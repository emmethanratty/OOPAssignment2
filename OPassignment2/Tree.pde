class Tree
{
  int gHeight;
  float treeH;
  float treeW;
  float treeX;
  float Tacc;
  
  Tree(int gHeight)
  {
    this.gHeight = gHeight;
    treeH = random(200,350);
    treeW = random(150,250);
    treeX = random(0,1000);
    Tacc = 4;
  } 
  
  void run()
  {
    move();
    reset();
  }
  
  //moves tree
  void move()
  {
     treeX -= Tacc*(p.acc/100); 
  }
  
  //resets tree
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
