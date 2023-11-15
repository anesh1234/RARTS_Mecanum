With Ada.Real_Time; use Ada.Real_Time;
With MicroBit.Console; use MicroBit.Console;
With MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
with MicroBit.DisplayRT; use MicroBit.DisplayRT;
with DFR0548;  -- using the types defined here

with RartsMotorDriver; use RartsMotorDriver;

package body TaskAct is

   task body act is
      myClock : Time;      
   begin
      Setup; -- we do Setup once at the start of the task;
      loop
         myClock := Clock;
         

         Drive(Brain.GetDirection, Brain.GetSpeed);
         
         if Brain.GetDirection = Stop then
         delay until myClock + Milliseconds(28);  -- approximately the time the sensor needs to return to the position in which it found an obstacle
         end if;
         
         Clear;
         if Brain.GetModeBool = True then
            Display('M');
         else
            Display('A');
            TurnServo;
         end if;
         
         delay until myClock + Milliseconds(150);
      end loop;
   end act;
   
   procedure Setup is
   begin
      Set_Analog_Period_Us (20_000); --20 ms = 50 Hz, typical for many actuators.
      Servo(8,0);
      delay 1.0;
   end Setup;
   
   procedure TurnServo is
   begin
         for I in DFR0548.Degrees range 0 .. 25 loop
            Servo(8,I);
            delay 0.01; --10 ms
         end loop;
   end TurnServo;
   
end TaskAct;
