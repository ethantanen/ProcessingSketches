class Board { 

  Block[][] board;
  boolean gameOver;
  int numBombs;


  Board() {

    int dim = 20;
    //Instantiate board class and gameOver flag
    board = new Block[dim][dim];
    gameOver = false;

    //Determine width of a single block
    int w = width/board.length;

    //Prepare board for play
    init(w);
  }

  void init(int w) {
    //Setupboard
    for (int i=0; i<board.length; i++) {
      for (int j=0; j<board[0].length; j++) {
        board[i][j] = new Block(j * w, i * w, w);
      }
    }

    //Random number of mines
    numBombs = board.length/2 + (int)random(board.length);

    ArrayList<int[]> list = new ArrayList();
    
    while(list.size() != numBombs){
      
      //add coord
      list.add(new int[]{(int)random(board.length),(int)random(board[0].length)});
      
      for(int i=0; i<list.size()-2; i++){
        if(list.get(list.size()-1).equals(list.get(i))){
          list.remove(list.size()-1);
          break;
        }
      } 
      
      for(int[] l : list) {
        board[l[0]][l[1]].isMine = true;
      }
      
    }
    
   
      
      
    




    //Update values of all other blocks
    for (int i=0; i<board.length; i++) {
      for (int j=0; j<board[0].length; j++) {

        Block b = board[i][j];

        //Cycle through surrounding blocks
        for (int x = i-1; x <= i+1; x++) {
          for (int y = j-1; y <= j+1; y++) {

            //Determine if the indexes are valid
            if (x >= 0 && x < board.length && y >= 0 && y < board[0].length) {

              //Update neighbor count if neightbor is mine
              if (board[x][y].isMine) {
                b.neighbors++;
              }
            }
          }
        }
      }
    }
  }

  //Draws each block
  void display() {
    for (int i=0; i<board.length; i++) {
      for (int j=0; j<board[0].length; j++) {  
        board[i][j].display();
      }
    }
  }

  //Determines game flow 
  void mousePressed() {

    //Cursor location
    int x = mouseX;
    int y = mouseY;

    Block block;

    //Cycle through each block in the board 
    for (int i=0; i<board.length; i++) {
      for (int j=0; j<board[0].length; j++) {

        Block b = board[i][j];

        //Determine if the cursor fell within the block
        if (b.x < x && b.x + b.dim > x && b.y < y && b.y + b.dim > y) {

          //Determine to flag or to click 
          if (mouseButton == RIGHT) {
            b.isFlagged = !b.isFlagged;
          } else {

            if (!b.isFlagged) {

              b.isClicked = true;
              if (b.isMine) {
                gameOver = true;
              } else if (b.neighbors == 0) {
                isZero(i, j);
              }
            }
          }
          break;
        }
      }
    }
  }


  //Clicks all other zeros 
  void isZero(int x, int y) {

    board[x][y].isClicked = true;


    for(int i=x-1; i<= x+1; i++) {
      for(int j=y-1; j <= y+1; j++) {
        
        
        if(i >= 0 && j >= 0 && i < board.length && j <board[0].length && board[i][j].isClicked == false) {
          
          board[i][j].isClicked = true;
          
          if(board[i][j].neighbors == 0){
            isZero(i,j);
          } 
        } 
      }
    }
        
        
  
 }
            
      
        
        



    /*
    if (x+1 < board.length && board[x+1][y].neighbors == 0 && board[x+1][y].isClicked == false) {
      isZero(x+1, y);
    } 

    if (x-1 >= 0 && board[x-1][y].neighbors == 0 && board[x-1][y].isClicked == false) {
      isZero(x-1, y);
    }

    if (y+1 < board[0].length && board[x][y+1].neighbors == 0 && board[x][y+1].isClicked == false) {
      isZero(x, y+1);
    }

    if (y-1 >= 0 && board[x][y-1].neighbors == 0 && board[x][y-1].isClicked == false) {
      isZero(x, y-1);
    }*/
  




  boolean checkForWin() {
    
    int count = 0;
    
    
    for(Block[] row : board) {
      for(Block b : row) {
        
        if(b.isMine && b.isFlagged) {
          count++;
        }
      }
    }
    
        
    if(count == numBombs) {
      return true;
      
    }
    
    
    return false;
    
  }
    
    


  /*TODO: 
   init:
   -determine location of bombs, set bomb flag 
   -cycle through each block
   -check if its a bomb
   -!bomb then check neighbors and update value 
   
   
   clicked:
   -mouse event if user clicks
   -determine location of click
   -find associated block
   -if right clicked flip flag flag
   -if bomb gameover() else flip is clicked 
   
   display board:
   -cycle through board
   -call block display function 
   */
}