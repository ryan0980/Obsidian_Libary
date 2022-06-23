void setup() {
  // put your setup code here, to run once:
 Serial.begin(9600); //This sets the baud rate of comments
 Serial.println("This is from the set up code, it will only run once.");
}

void loop() {
  // put your main code here, to run repeatedly:
 Serial.println("This is from the loop code, and will keep running.");
  delay(1000); //This causes a 1 second delay before repeating
}

