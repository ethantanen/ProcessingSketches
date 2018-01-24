
Tree tree;

void setup(){
  size(600,600);
  background(123);
  
  tree = new Tree();
  
  int[] data = {1,2,-1,3,5,4};
  
  for(int i=0; i<random(100); i++){
    tree.add((int)random(100));
  }
  
  tree.printTreeDepth(tree.head,width/2,100,width/2,100); //<>//
  
}

void draw(){
}