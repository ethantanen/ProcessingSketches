Board board;

void setup() {
  size(600,600);
  board = new Board();
  
}

void draw() {
  
  background(0);
  board.display();

  //Resets board if gameover
  if(board.gameOver) {
    gameOver();
  }else if(board.checkForWin()) {
    gameWin();
  
  }
}




void mousePressed() {
  board.mousePressed();
  
 
  
}

void mouseClicked(){
  if(board.gameOver || board.checkForWin()){
    board = new Board();
  }
}


void gameOver() { 
  //Display game over screen
  rectMode(CENTER);
  fill(0);
  rect(width/2, height/2, 450, 200);
  rectMode(CORNER);
  fill(255);
  textMode(CENTER);
  textSize(70);
  text("GAME OVER", width/2, height/2);
  
  
}

void gameWin() {
  
    //Display game over screen
  rectMode(CENTER);
  fill(0);
  rect(width/2, height/2, 450, 200);
  rectMode(CORNER);
  fill(255);
  textMode(CENTER);
  textSize(70);
  text("WINNER", width/2, height/2);
  
}