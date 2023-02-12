//Transmitter code (ProMini)

int TX = 3;
int front = 0;
int back = 1;
int left = 2;
int rght = 4;

void setup() {
pinMode(TX,OUTPUT); 
pinMode(front,INPUT); 
pinMode(back,INPUT); 
pinMode(left,INPUT); 
pinMode(rght,INPUT); 
}

void loop() {

  if(digitalRead(front))
  {
    write_freq(1000);
  }
  
  else if(digitalRead(back))
  {
    write_freq(1500);
  }
  
   else if(digitalRead(left))
  {
    write_freq(2000);
  }
  
  else if(digitalRead(rght))
  {
    write_freq(2500);
  }   
  else
  {
    write_freq(3000);
  }


}


void write_freq(int DELAY)
{
  digitalWrite(TX,LOW);
  delayMicroseconds(DELAY);
  digitalWrite(TX,HIGH);
  delayMicroseconds(DELAY);
}

