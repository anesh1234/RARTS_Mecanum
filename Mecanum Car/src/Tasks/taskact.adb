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
            delay until myClock + Milliseconds(30);  -- approximately the time the sensor needs to return to the position in which it found an obstacle
         end if;
         
         if Brain.GetModeBool = True then
            Display('M');
         else
            Display('A');
            TurnServo;
         end if;
         
         delay until myClock + Milliseconds(50);  --random period, but faster than 20 ms is no use because Set_Analog_Period_Us(20000) !
                                                  --faster is better but note the weakest link: if decisions in the thinking task come at 100ms and acting come at 20ms 
                                                  --then no change is set in the acting task for at least 5x (and is wasting power to wake up and execute task!)
      end loop;
   end act;
   
   procedure Setup is
   begin
      --For example set the PWM period, as you only need to do this once
      Set_Analog_Period_Us (20_000); --20 ms = 50 Hz, typical for many actuators. You can change this, check the motor behavior with an oscilloscope.
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
