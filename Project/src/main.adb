with MicroBit.IOsForTasking;  use MicroBit.IOsForTasking;
with MicroBit;
with MicroBit.MotorDriver; use MicroBit.MotorDriver; --using the procedures defined here
with DFR0548;  -- using the types defined here
with MicroBit.Console; use MicroBit.Console; -- for serial port communication
use MicroBit; --for pin names

procedure Main is
begin
   loop
      MotorDriver.Drive(Forward_Left);
      delay 1.0;
      MotorDriver.Drive(Forward_Right);
      delay 1.0;

      MotorDriver.Drive(stop);
      delay 4.0;

   end loop;
end Main;
