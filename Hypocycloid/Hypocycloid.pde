Circle c1; 
Circle c2;
Circle c3;
Circle c4;

ArrayList<int[]> path;

int xp;
int yp;

void setup(){
  size(500,500);
  frameRate(20);
  
  c1 = new Circle(width/2,height/2,50);
  
  Circle prev = c1;
  
  for(int i=0; i<10; i++){
     prev = new Circle(prev);
    
  }
  
  
  
  
  path = new ArrayList();
}


float theta = .1;


void draw(){
  
  
  background(100);

  Circle cur = c1;

  while(cur != null){
    
   strokeWeight(2);
   cur.drawShape();
    
    if(cur.child == null){
      strokeWeight(5);
      path.add(new int[]{cur.x,cur.y});
    }
   
    cur.update();
    cur = cur.child;

  }
  
  for(int[] x: path){
    point(x[0],x[1]);
  }
  
}
  
  