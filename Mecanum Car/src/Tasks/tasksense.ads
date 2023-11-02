With MyBrain; use MyBrain;
with MicroBit.Radio;
with HAL; use HAL;
with MicroBit.Console; use MicroBit.Console;
With Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Ultrasonic;
with MicroBit.Types; use MicroBit.Types;
use MicroBit;

package TaskSense is

   task Sense with Priority => 1; --random priority. argue and calculate what these values should be
  
end TaskSense;
