class Tree{
  
  Node head;
  
  //adds node to tree 
  void add(int val){
    
    Node node = new Node(val);
    
    if(head == null){
      head = node;
    }else{
      add(node,head);
    }
  }
  
  
  //recursively finds appropriate location for new node, then adds 
  void add(Node node, Node cur){
    //go left if less than go right if less than
    if(node.data < cur.data){
      
      //add node if branch is null
      if(cur.left == null){
        cur.left = node;
        return;
      }
      
      //recurse if not 
      add(node, cur.left);
      
    }else if(node.data >= cur.data){
      
       //add node if branch is null
      if(cur.right == null){
        cur.right = node;
        return;
      }
      
      //recurse if not 
      add(node, cur.right);
    } 
  }
  
  
  //prints entire tree beginning at node, depth first 
  void printTreeDepth(Node node,int a, int b, int x, int y){
    
    if(node == null)
      return;
    
    fill(0);
    line(a,b+25,x,y);
      
    fill(255);
    ellipseMode(CENTER);
    ellipse(x,y,50,50);
    
    fill(0);
    textAlign(CENTER);
    text(node.data,x,y);
    
    
    println(node.data);
    
    printTreeDepth(node.left,  x, y, x-50, y+50);
    printTreeDepth(node.right, x, y, x+50,y+50);
    
  }
  
  //prints entire tree beginning at node, breadth first
  ArrayList<Node> q = new ArrayList();
  
  void printTreeBreadth(Node node){
    
    if(node == null)
      return;
     
     q.add(node);
     
     while(!q.isEmpty()){
       Node n = q.get(0);
       q.remove(0);
       
       println(n.data);
       
       if(n.left  != null) q.add(n.left);
       if(n.right != null) q.add(n.right);
     }   
  }
}