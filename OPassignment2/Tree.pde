class Tree
{
  int gHeight;
  float treeH = random(200,350);
  float treeW = random(150,250);
  float treeX = random(0,1000);
  float Tacc = 4;
  
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
     treeX -= Tacc*(p.acc/100); 
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
