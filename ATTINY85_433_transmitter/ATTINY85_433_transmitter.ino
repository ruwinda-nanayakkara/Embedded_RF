//Transmitter code (ProMini)

int TX = 9;
int front = 2;
int back = 3;

void setup() {
pinMode(TX,OUTPUT); 
pinMode(front,INPUT); 
pinMode(back,INPUT); 
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
