
// Arduino Notes

/*
block comments
*/

// single line comments

// define interget variable
int mypin = 10;

// built in pin is 13
pinMode(13, OUTPUT);

/*
Digital Voltage 
LOW is <3v
HIGH is >3v
*/


// PWM/digital pins go from 0-255

// analog pins range from 0-1023



// to print to monitor
void setup() {
  Serial.begin(9600);
  }

void loop() {
  Serial.println(currentMillis);
  }


// to print multiple values in a line
Serial.print("sensor = ");
Serial.print(sensorValue);
Serial.print("\t output = ");
Serial.println(outputValue); // prints and adds carriage return
Serial.print("\n"); // carriage return

