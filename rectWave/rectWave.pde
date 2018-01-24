float w,h;
float angle,offset;

void setup(){
  size(600,400,P3D);
  w = 10;
  angle=0;
  
}

void draw(){
  
  background(255);
  translate(width/2,height/2);
  rectMode(CENTER);

  offset = .00;
  directionalLight(51, 102, 126, -1, -1, 0);

  camera(200, 200, 200, 0, 0, 0, 1, 0, 1);
  noStroke();
  fill(200,255,200);
  shininess(200);

  for(int z=0; z<width/4; z += w+10){

    for(int x=0; x<width/4; x += w+10){

        float d = map(dist(0,0,0,x,0,z),50,140,0,1);
        stroke(255);
        h =  Math.abs((100 * sin(angle+d)));   
        
        pushMatrix();
        translate(x,0,z);
        box(w, h+50, w);
        popMatrix();
        
        pushMatrix();
        translate(x,0,-z);
        box(w, h+50, w);
        popMatrix();
        
        pushMatrix();
        translate(-x,0,-z);
        box(w, h+50, w);
        popMatrix();
        
        pushMatrix();
        translate(-x,0,z);
        box(w, h+50, w);
        popMatrix();
        
        offset += .001;
        
    }
  }
  angle+=.01;
  
}