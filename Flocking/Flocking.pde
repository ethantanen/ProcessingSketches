Flock flock;

void setup(){
  size(1000,500);
  flock = new Flock();
 
}

void draw(){
  background(100);
  flock.fly();
}

void mousePressed(){
    flock.flock.add(new Bird(mouseX,mouseY));
}