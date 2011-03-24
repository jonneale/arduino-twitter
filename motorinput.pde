//LeftWheel pins are 6 and 8
int leftWheelSpeedPin = 6;
int leftWheelDirectionPin = 8;
//RightWheel pins are 7 and 9
int rightWheelSpeedPin = 9;
int rightWheelDirectionPin = 7;

int fwd = LOW;
int back = HIGH;

void setup()
{
  pinMode(leftWheelSpeedPin, OUTPUT);
  pinMode(leftWheelDirectionPin, OUTPUT);
  pinMode(rightWheelSpeedPin, OUTPUT);
  pinMode(rightWheelDirectionPin, OUTPUT);
  Serial.begin(9600);
}

boolean done = false;
int val;

void loop()
{
  val = Serial.read();
  if (val == 'f') {
    forward();
  }
  if (val == 'b') {
    backward();
  } 
  if (val == 'l') {
    left(45);
  }
  if (val == 'r') {
    right(45);
  }   
  if (val == 'a') {
    left(90);
  }   
  if (val == 'c') {
    right(90);
  }
  if (val == 's') {
    spinLeft();
  }
  if (val == 'd') {
    spinLeft();
    spinRight();
  } 
  stop();
}

void stop(){
  digitalWrite(leftWheelSpeedPin, LOW);
  digitalWrite(rightWheelSpeedPin, LOW);
}

void forward() {
  digitalWrite (leftWheelDirectionPin, fwd); 
  digitalWrite (rightWheelDirectionPin, fwd);
  analogWrite (leftWheelSpeedPin, 255);
  analogWrite (rightWheelSpeedPin, 255);
  delay(200);
}
void backward() {
  digitalWrite (leftWheelDirectionPin, back); 
  digitalWrite (rightWheelDirectionPin, back);
  analogWrite (leftWheelSpeedPin, 255);
  analogWrite (rightWheelSpeedPin, 255);
  delay(200);
}

void spinLeft() {
  digitalWrite (leftWheelDirectionPin, back);
  analogWrite (leftWheelSpeedPin, 255);
  digitalWrite (rightWheelDirectionPin, fwd);
  analogWrite (rightWheelSpeedPin, 255);
  delay(1000);
}


void spinRight() {
  digitalWrite (rightWheelDirectionPin, back);
  analogWrite (rightWheelSpeedPin, 255);
  digitalWrite (lefttWheelDirectionPin, fwd);
  analogWrite (leftWheelSpeedPin, 255);
  delay(1000);
}

void left(int degree) {
 turn(rightWheelSpeedPin, rightWheelDirectionPin, leftWheelSpeedPin, leftWheelDirectionPin, degree);
} 

void right(int degree) {
  turn(leftWheelSpeedPin, leftWheelDirectionPin, rightWheelSpeedPin, rightWheelDirectionPin, degree);
}

void turn(int backSpeed, int backDirection, int fwdSpeed, int fwdDirection, int degree) {
  analogWrite (backSpeed, 0);
  if (degree == 90) {
    digitalWrite (backDirection, back);
    analogWrite (backSpeed, 255);
  }
  digitalWrite (fwdDirection, fwd);
  analogWrite (fwdSpeed, 255);
  delay(200);
} 
  
  

