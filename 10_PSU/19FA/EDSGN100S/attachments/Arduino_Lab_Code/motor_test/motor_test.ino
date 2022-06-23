
#include <Arduino.h>
#include <stdint.h>
#include "SCMD.h"
#include "SCMD_config.h" //Contains #defines for common SCMD register names and values
#include "Wire.h"

// SPEED sets the nominal speed

#define SPEED 55  // This sets the nominal speed. Set to any number from 0 - 255.

SCMD myMotorDriver; //This creates the main object of one motor driver and connected slaves.

void setup()
{
  pinMode(8, INPUT_PULLUP); //Use to halt motor movement (ground)

  Serial.begin(9600);
  Serial.println("Starting sketch.");

  //***** Configure the Motor Driver's Settings *****//
  //  .commInter face can be I2C_MODE or SPI_MODE
  myMotorDriver.settings.commInterface = I2C_MODE;
  //myMotorDriver.settings.commInterface = SPI_MODE;

  //  set address if I2C configuration selected with the config jumpers
  myMotorDriver.settings.I2CAddress = 0x5A; //config pattern "0101" on board for address 0x5A
 // Accedentily did pattern "1010" on the chip, so address is 0x5f 
  //  set chip select if SPI selected with the config jumpers
  Serial.println("Finding SCMD");
  // myMotorDriver.settings.chipSelectPin = 10;

  //*****initialize the driver get wait for idle*****//
  while ( myMotorDriver.begin() != 0xA9 ) //Wait until a valid ID word is returned
  {
    Serial.println( "ID mismatch, trying again" );
    delay(500);
  }
  Serial.println( "ID matches 0xA9" );

  //  Check to make sure the driver is done looking for slaves before beginning
  Serial.print("Waiting for enumeration...");
  while ( myMotorDriver.ready() == false );
  Serial.println("Done.");
  Serial.println();

  //*****Set application settings and enable driver*****//
/*EDSGNBased on how you set up your motor, 
you may need to invert the motors. 
(If a wheel is going backwards when you want it to go forward, 
it needs to be inverted)*/

//EDSGN: Uncomment code for motor 0 inversion
  //while( myMotorDriver.busy() );
  //myMotorDriver.inversionMode(0, 1); //invert motor 0
//EDSGN: End uncomment code for motor 0 inversion

 //EDSGN: Uncomment the following code for motor 1 inversion
 // while ( myMotorDriver.busy() ); //Waits until the SCMD is available.
//myMotorDriver.inversionMode(1, 1); //invert motor 1
//EDSGN: End of where you need to uncomment code for motor 1 inversion
  while ( myMotorDriver.busy() );
  myMotorDriver.enable(); //Enables the output driver hardware

   // Serial.begin(9600);
    Serial.println("Arduino Lab: Motor Test");
    Serial.println("------------------------------------------");
    delay(2000);
    Serial.println("IR Sensor Readings: ");
    delay(500);
}
/*EDSGN: Switch motor definitions here if the right motor and left motor
are switched during the test. Make sure to update in the final code
as well*/

#define LEFT_MOTOR 1 
#define RIGHT_MOTOR 0

/*EDSGN: End of code you need to switch*/

void loop()
{
   Serial.println( "Test wheels");
   myMotorDriver.setDrive( LEFT_MOTOR, 0, SPEED);
   myMotorDriver.setDrive( RIGHT_MOTOR, 0, SPEED);
   delay(3000);
   Serial.println( "Test right");
   myMotorDriver.setDrive( LEFT_MOTOR, 0, 0);
   myMotorDriver.setDrive( RIGHT_MOTOR, 0, SPEED);  
      delay(3000);
   Serial.println( "Test left");
   myMotorDriver.setDrive( LEFT_MOTOR, 0, SPEED);
   myMotorDriver.setDrive( RIGHT_MOTOR, 0, 0);
        delay(3000);
   Serial.println( "Test reverse");
  // myMotorDriver.inversionMode(1, 1);
  // myMotorDriver.inversionMode(0, 1);
   myMotorDriver.setDrive( LEFT_MOTOR, 1, SPEED);
   myMotorDriver.setDrive( RIGHT_MOTOR, 1, SPEED); 
   //myMotorDriver.inversionMode(1, 0);
   //myMotorDriver.inversionMode(0, 0); 
        delay(3000);  // 
   Serial.println( "Pause");
   myMotorDriver.setDrive( LEFT_MOTOR, 1, 0);
   myMotorDriver.setDrive( RIGHT_MOTOR, 1, 0); 
}
