
ArrayList<PVector> tail;
PVector vel, apple;
int w, score, speed;

void setup(){
  
  //square canvas 
  size(500,500);
  
  //box width
  w = 20;
  
  //score begins at zero
  score = 0;
  
  //initial velocity
  vel = new PVector(-w,0);
  
  //initialize intial apple location
  apple = new PVector();
  apple.x = constrain((int)random(width/w)  * w,0, width  - w);
  apple.y = constrain((int)random(height/w) * w,0, height - w);
  
  //intialize tail
  tail = new ArrayList();
  
  //add intial boxes 
  for(int i=0; i<10; i++){
    tail.add(new PVector(i*w,0));
  }
  
  //speed of game 
  speed = 5;
  frameRate(speed);
}
  
void draw(){
  
  background(0);
  
  //draw snake
  for(int i=0; i<tail.size(); i++){
    PVector p = tail.get(i);
    rect(p.x,p.y,w,w);
  }
  
  //draw apple
  rect(apple.x,apple.y,w,w);
  
  //move snake
  for(int i=tail.size()-1; i>0; i--){
    tail.get(i).x = tail.get(i-1).x;
    tail.get(i).y = tail.get(i-1).y;
  }
  tail.get(0).add(vel);
  
  //wrap playing field 
  for(PVector p : tail){
    if(p.x < 0)      p.x = width-w;
    if(p.x > width-w)  p.x = 0;
    if(p.y < 0)      p.y = height-w;
    if(p.y > height-w) p.y = 0;
  }
   
  //check for collision with itself
  for(int i=1; i<tail.size(); i++){
    if(tail.get(0).x == tail.get(i).x && tail.get(0).y == tail.get(i).y){
      setup();
    }
  }
  
  //check for collision with apple;
  if(tail.get(0).x == apple.x && tail.get(0).y == apple.y){
    tail.add(new PVector(tail.get(tail.size()-1).x - vel.x, tail.get(tail.size()-1).y - vel.y));
    apple.x = constrain((int)random(width/w)  * w,0, width  - w);
    apple.y = constrain((int)random(height/w) * w,0, height - w);
    score++;
  }
  
  //print score 
  textAlign(LEFT,TOP);
  textSize(20);
  text(score,0,0);
}

//change velocity vector based on arrow keys 
void keyPressed(){
  if(keyCode == UP && vel.y != w){
    vel.x = 0;
    vel.y = -w;
  }else if(keyCode == DOWN && vel.y != -w){
    vel.x = 0;
    vel.y = w;
  }else if(keyCode == LEFT && vel.x != w){
    vel.x = -w;
    vel.y = 0;
  }else if(keyCode == RIGHT && vel.x != -w){
    vel.x = w;
    vel.y = 0;
  }else if(key == 'w'){
    frameRate(speed++);
  }else if(key == 'q'){
    if(speed > 2)
      frameRate(speed--);
  }
}