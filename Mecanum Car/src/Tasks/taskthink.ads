with MyMotorDriver; use MyMotorDriver;
with MicroBit.Types; use MicroBit.Types;
With Ada.Real_Time; use Ada.Real_Time;
with MicroBit.MotorDriver; use MicroBit.MotorDriver;
with MyBrain; use MyBrain;

package TaskThink is

   task Think with Priority=> 2;
  
end TaskThink;
