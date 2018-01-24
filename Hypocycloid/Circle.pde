class Circle{
  
  int x,y,r;
  float angle,increment;
  Circle parent,child;
  
  
  Circle(int x_, int y_, int r_){
    x = x_;
    y = y_;
    r = r_;
    angle = .1;
    parent = null;
    child = null;
    increment = .1;
  }
  
  Circle(Circle p){
    r = p.r/2;
    angle = 0;
    x = (int)(p.x + (p.r + r)*cos(angle));
    y = (int)(p.y + (p.r + r)*sin(angle));
    p.child = this;
    parent = p;
    increment = parent.increment*-1*1.3 ;
  }
  
  void drawShape(){
    noFill();
    println(x + " " + y);
    ellipse(x,y,r*2,r*2);
    
    
    
    
  }
  
  void update(){
    if(parent == null){
      return;
    }
    angle += increment;
    x = (int)(parent.x + (parent.r + r)*cos(angle));
    y = (int)(parent.y + (parent.r + r)*sin(angle));
   
  }

}