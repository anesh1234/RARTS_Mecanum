with MicroBit.Types; use MicroBit.Types;
With Ada.Real_Time; use Ada.Real_Time;
with MyBrain; use MyBrain;
with HAL;     use HAL;

package TaskThink is

   task Think with Priority=> 2;
   procedure DriveAutomatic;
   procedure InterpretRadio;
   
private 
   Threshold : Distance_cm := 10;
end TaskThink;
