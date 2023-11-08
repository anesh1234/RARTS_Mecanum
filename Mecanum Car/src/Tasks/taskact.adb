With Ada.Real_Time; use Ada.Real_Time;
With MicroBit.Console; use MicroBit.Console;
with MicroBit.MotorDriver.Servo;
With MicroBit.IOsForTasking; use MicroBit.IOsForTasking;
with DFR0548;  -- using the types defined here

with MyBrain; use MyBrain;

package body TaskAct is

   task body act is
      myClock : Time;      
   begin
      
      Setup; -- we do Setup once at the start of the task;
      
      loop
         myClock := Clock;
         Drive(Brain.GetDirection, (4095,4095,4095,4095));
         
         Put_Line ("Direction is: " & MotorDriver.GetDirection'Image);
         
         TurnServo;
         
         delay until myClock + Milliseconds(50);  --random period, but faster than 20 ms is no use because Set_Analog_Period_Us(20000) !
                                                  --faster is better but note the weakest link: if decisions in the thinking task come at 100ms and acting come at 20ms 
                                                  --then no change is set in the acting task for at least 5x (and is wasting power to wake up and execute task!)
      end loop;
   end act;
   
   procedure Setup is
   begin
      
      --For example set the PWM period, as you only need to do this once
      Set_Analog_Period_Us (20_000); --20 ms = 50 Hz, typical for many actuators. You can change this, check the motor behavior with an oscilloscope.
      
      Microbit.MotorDriver.Servo(8,0);
      delay 1.0;
   end Setup;
   
   procedure TurnServo is
   begin
      
      Microbit.MotorDriver.Servo(8,45);
      delay 1.0;
      Microbit.MotorDriver.Servo(8,135);
      
      
      --  for I in reverse DFR0548.Degrees range 0..90 loop
      --     MicroBit.MotorDriver.Servo(8,I);
      --      delay 0.001; --20 ms
      --  end loop;
      --  
      --  for I in DFR0548.Degrees range 90..180 loop
      --     MicroBit.MotorDriver.Servo(8,I);
      --     delay 0.001; --20 ms
      --  end loop;
      --  
      --  for I in reverse DFR0548.Degrees range 90..180 loop
      --     MicroBit.MotorDriver.Servo(8,I);
      --      delay 0.001; --20 ms
      --  end loop;
      
   end TurnServo;

end TaskAct;
