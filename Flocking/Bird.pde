class Bird{
  
  PVector pos,vel,acc;
  float rad,max,radinf;
  
  Bird(float x, float y){
    pos = new PVector(x,y);
    vel = PVector.random2D().normalize();
    acc = new PVector(0,0);
    
    rad = 10;
    max = 3;
    radinf = 30;
  }
  
  void update(ArrayList<Bird> flock){

    //begin w/ random small random acc
    acc.x = (random(20)-10)/10;
    acc.y = (random(20)-10)/10;
    //calc forces 
    PVector align  = alignment(flock);
    PVector cohere = cohesion(flock);
    PVector avoid  = avoidance(flock);
    
    //weight forces
    align.mult(1);
    cohere.mult(1);
    avoid.mult(1);
    
    //add to intial acc
    acc.add(align);
    acc.add(cohere);
    acc.add(avoid);
    
    //update position 
    vel.add(acc);
    vel.limit(max);
    pos.add(vel);
    wrap();
    
    
    //reset acceleration
    acc.mult(0);
   
  }
  
  void display(){
    PVector dir = new PVector();
    ellipse(pos.x,pos.y,rad*2,rad*2);
    dir.x = vel.x;
    dir.y = vel.y;
    dir.normalize();
    dir.mult(rad);
    line(pos.x,pos.y,pos.x + dir.x,pos.y + dir.y);
  }
  
  
 
  //Average vel of nearby birds
  PVector alignment(ArrayList<Bird> flock){
    
    PVector avg = new PVector(0,0);
    int count = 0;
    
    for(Bird b: flock){
      if(b.vel.dist(this.vel) != 0 && b.vel.dist(this.vel) < radinf){
        count ++;
        avg.add(b.vel);
      }
    }
    
    if(count == 0){
      return PVector.random2D();
    }  
    
    avg.div(count);
    return avg.normalize(); 
  }
  
  
  PVector cohesion(ArrayList<Bird> flock){
    
    PVector avg = new PVector(0,0);
    int count = 0;
    
    for(Bird b: flock){
      if(b.pos.dist(this.vel) != 0 && b.pos.dist(this.vel) < radinf){
          avg.add(b.pos);
          count++;
      }
    }
    
    if(count == 0){
      return PVector.random2D();
    }
    
    avg.div(count);
    
    PVector dir = new PVector(avg.x-pos.x,avg.y-pos.y);
      
    return dir.normalize();
  }
  
  PVector avoidance(ArrayList<Bird> flock){
    PVector avoid = new PVector(0,0);
    int count = 0;
    
    for(Bird b : flock){
      if(b.pos.dist(this.pos) > 0 && b.pos.dist(this.pos) < radinf){
     
        count++;
        PVector dir = PVector.sub(this.pos,b.pos);
        dir.normalize();
        dir.mult(b.pos.dist(this.pos));
        avoid.add(dir);
        
   
      }
    }
    
    if(count > 0)
      avoid.div(count);
      
    return avoid;
  }
  
  
  //limit how fast a bird can fly...lol
  void limit(){
    if(vel.x > max){
      vel.x = max;
    }
    if(vel.y > max){
      vel.y = max;
    } 
  }
  
  void wrap(){
    if(pos.x < 0) pos.x = width;
    if(pos.x > width) pos.x = 0;
    if(pos.y < 0) pos.y = height;
    if(pos.y > height) pos.y = 0;
  }
  
}
    
  
  