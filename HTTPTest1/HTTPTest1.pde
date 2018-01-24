import processing.net.*;
import processing.serial.*;


Server  server;
Client client; 

int port = 10002;


void setup(){
  
  size(300,300);
  print(Serial.list());
  server = new Server(this,port);
  client = server.available();
  
}

void draw(){
  
  server.write("H");
  
  if(client != null && client.available() > 0) {
            text("mesage from: " + client.ip() + " : " + client.readString(), 15, 0);
  }
}
    
    
  