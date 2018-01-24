class Flock{
  
  ArrayList<Bird> flock;
  
  Flock(){
    
    flock = new ArrayList();
    
    //add inital birds
    for(int i=0; i<20; i++){
      flock.add(new Bird(height/2,width/2));
    }
    
    
  }
  
  void fly(){
    for(Bird b : flock){
      b.update(flock);
      b.display();
    }
  }
  
  
  
}