-- pragma Profile (Ravenscar);

-- Our packages:


-- Predefined child packages of package Ada:
with Ada.Real_Time;

-- Packages for interfacing with Microbit and the DFR0548 driver card:
with MicroBit.Types; use MicroBit.Types;
with MicroBit.IOsForTasking;  use MicroBit.IOsForTasking;
with MicroBit.MotorDriver; use MicroBit.MotorDriver; --using the procedures defined here
with DFR0548;  -- using the types defined here
with MicroBit.Console; use MicroBit.Console; -- for serial port communication
use MicroBit; --for pin names

procedure Main is
Threshold : Distance_cm := 5;

   task CheckFront;
   task CheckBack;

   task body CheckFront is
      package sensor1 is new Ultrasonic(MB_P13, MB_P12);
      DistanceFront : Distance_cm := 0;
   begin
      loop
         Put_Line ("y");
         DistanceFront := sensor1.Read;
         Put_Line ("Front: " & Distance_cm'Image(DistanceFront)); -- a console line delay the loop significantly
         delay 0.05; --50 ms
      end loop;
   end CheckFront;

   task body CheckBack is
      package sensor2 is new Ultrasonic(MB_P16, MB_P15);
      DistanceBack : Distance_cm := 0;
      begin
         loop
            Put_Line ("x");
            DistanceBack := sensor2.Read;
            Put_Line ("Back: " & Distance_cm'Image(DistanceBack)); -- a console line delay the loop significantly
         delay 0.05; --50 ms
      end loop;
      end CheckBack;

begin
   MotorDriver.Servo(1,90);
   delay 1.0; -- equivalent of Time.Sleep(1000) = 1 second

   loop
      --   DEMONSTRATION ROUTINE 4 MOTORS (useful for checking your wiring)
      --  MotorDriver.Drive(Forward,(4095,0,0,0)); --right front wheel to M4
      --  delay 1.0;
      --  MotorDriver.Drive(Forward,(0,4095,0,0)); --right back wheel to M3
      --  delay 1.0;
      --  MotorDriver.Drive(Forward,(0,0,4095,0)); --left front wheel to M2
      --  delay 1.0;
      --  MotorDriver.Drive(Forward,(0,0,0,4095)); --left back wheel to M1
      --  delay 1.0;
      --  MotorDriver.Drive(Stop);


      MotorDriver.Drive(Forward);
      delay 1.0;
      MotorDriver.Drive(stop);

      delay 3.0;


   end loop;
end Main;
