with MicroBit.MotorDriver; use MicroBit.MotorDriver; --using the procedures defined here
with DFR0548;  -- using the types defined here

package body rarts_servo is
   procedure RunServo is

      Max : DFR0548.Degrees := 90;
      Min : DFR0548.Degrees := 0;

   begin

      loop

         MotorDriver.Servo(8, Max);
         delay(0.02);
         MotorDriver.Servo(8, Min);
         delay(0.02);

      end loop;

   end RunServo;

end rarts_servo;
