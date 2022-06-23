
#include <Arduino.h>

int QRE1113_Pinl = 0; //connected to analog 0
int QRE1113_Pinc = 1; //connected to analog 1
int QRE1113_Pinr = 2; //connected to analog 2

void setup()
{

    Serial.begin(9600);
    Serial.println("Arduino Lab: Line Sensor Calibration");
    Serial.println("------------------------------------------");
    delay(2000);
    Serial.println("IR Sensor Readings: ");
    delay(500);
}

void loop()
{
int right = analogRead(QRE1113_Pinr);

int left = analogRead(QRE1113_Pinl);

int center = analogRead(QRE1113_Pinc);

Serial.print("Left sensor: ");
Serial.print(left);
Serial.print(" Center sensor: ");
Serial.print(center);
Serial.print(" Right sensor: ");
Serial.println(right);

    
    delay(3000);  // add a delay to decrease sensitivity.
}
