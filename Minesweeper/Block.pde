//Class to describe a single block in the minefield 
class Block {
  
  //Block states 
  boolean isClicked;
  boolean isFlagged;
  boolean isMine;
  
  //Block value, -1 is a mine
  int neighbors; 
  
  //Location and dimension of block
  int x,y;
  int dim;
  
  //Constructor 
  Block(int x_, int y_, int dim_) {
    
    x = x_;
    y = y_;
    dim = dim_;
    
    isClicked = false;
    isFlagged = false;
    isMine = false;
    
  }
  
  //Draw the block
  void display() {
    
    //Draw box
    fill(123);
    strokeWeight(2);
    rect(x,y,dim,dim);
    
    if(isClicked) { 
      
      //Draw box
      fill(200);
      strokeWeight(2);
      rect(x,y,dim,dim);
      
      if(isMine){
        
        fill(30,200,30);
        ellipseMode(CENTER);
        ellipse(x + dim/2, y + dim/2, dim/3, dim/3);
        
        
      } else {
        
        if(neighbors != 0) {
      
          //Draw number of neighbors if clicked 
          fill(255);
          textAlign(CENTER);
          textMode(CORNER);
          textSize(dim/2);
          text(neighbors,x + dim/2, y + dim/1.5);
        } 
          
      }
     
    } else if(isFlagged) { 
      
      //Draw red ellipse if flagged
      fill(200,30,30);
      ellipseMode(CENTER);
      ellipse(x + dim/2, y + dim/2, dim/3, dim/3);
      
    }
    
  }  
}