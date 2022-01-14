#include "HX711.h"
#define OUT 3
#define CLK 2
HX711 scale;
float calibration_factor = 5000; //Assuming a random value
void setup() {
Serial.begin(9600);
Serial.println("HX711 calibration is beginning");
Serial.println("Enter + or A to increase calibration factor by
10");
Serial.println("Enter - or Z to decrease calibration factor by
10");
scale.begin(OUT, CLK);
scale.set_scale();
scale.tare(); //Reset scale to 0
long zero_fact = scale.read_average(); //Obtain baseline reading
Serial.print("Zero factor:   ");
Serial.println(zero_factor);
}
void loop() {
scale.set_scale(calibration_factor); //Set this calibration factor
Serial.print("Reading: ");
Serial.print(scale.get_units(), 1);
Serial.print(" kg");
Serial.print(" using the calibration_factor: ");
Serial.print(calibration_factor);
Serial.println();
if(Serial.available())
{
char temp = Serial.read();
if(temp == '+' || temp == 'A')
calibration_factor += 10;
else if(temp == '-' || temp == 'Z')
calibration_factor -= 10;
}
}
