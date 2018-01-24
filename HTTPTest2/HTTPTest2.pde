import processing.net.*;
import processing.serial.*;

Client client;

void setup(){
  size(300,300);
  client = new Client(this,"10.177.85.17",60000);
}


void draw(){
  
  if(mousePressed == true){
    client.write("GAME ON");
  }
  
  if(client.available() > 0){
      
    String input = client.readString();
    println("RETURNED: " + input); 
  }  
}
  