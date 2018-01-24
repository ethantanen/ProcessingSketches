
int x=0, y=1;
ArrayList<float[]> pts;
int n;
int rad; 
void setup(){
  
  background(255);
  
  size(500,500);
  
  
  pts = new ArrayList<float[]>();
  n=-1;
  rad = 10;
  
  noLoop();
}

void draw(){
  
  background(255);
 for(float[] pt : pts){
    ellipse(pt[x],pt[y],rad*2,rad*2);
  }
  
  if(pts.size() <= 2 || pts.size() > 30){
    return;
  }
  
  
  
  float xp=0, yp=0, oxp=pts.get(0)[x], oyp=pts.get(0)[y];
  
  for(float t=0; t<1; t+=.01){
    
    xp=0;
    yp=0;
    
    for(int i=0; i<n+1; i++){
      xp += bern(i,n,t) * pts.get(i)[x];
      yp += bern(i,n,t) * pts.get(i)[y];
    }
    
    
    line(oxp,oyp,xp,yp);

    oxp=xp;
    oyp=yp;
    
  }
   
 
  
}

void mousePressed(){
  if(mouseButton == RIGHT){
    pts.add(new float[]{mouseX,mouseY});
    n++;
    redraw();
  }
}

void mouseDragged(){
  
  for(float[] pt : pts){
    
    float dist = dist(pt[0],pt[1],mouseX,mouseY);
    
    if(dist < rad + 30){
      pt[0] = mouseX;
      pt[1] = mouseY;
      break;
    }
  }
  redraw();
}

float bern(int i, int n, float t){
  return bernPoly(i,n) * exponent(1-t,n-i) * exponent(t,i);
}


//returns num to the power of exp 
float exponent(float num, float exp){
  float x = 1; 
  for(int i=0; i<exp; i++){
    x*=num;
  }
  return x; 
}


//returns n factorial 
float factorial(int n){
  float fact = 1;
  for(int i=n; i>1; i--){ 
    fact *= n;
    n--;
  }
  return fact;
}

//retruns a bernstein polynomial 
float bernPoly(int i, int n){
  return (factorial(n))/(factorial(i)*factorial(n-i));
}