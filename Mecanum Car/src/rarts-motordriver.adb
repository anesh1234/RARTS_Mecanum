with MicroBit.I2C;
package body rarts.MotorDriver is


   MD  : DFR0548.MotorDriver (MicroBit.I2C.ControllerExt);

   procedure Initialize is
   begin
      if not MicroBit.I2C.InitializedExt then
         MicroBit.I2C.InitializeExt;
      end if;

      MD.Initialize;
      MD.Set_Frequency_Hz (50); --50 Hz
   end Initialize;

   procedure Drive (Direction : Directions;
                    Speed : Speeds := (4095,4095,4095,4095)) is
   begin
      case Direction is
         when Forward =>
            Drive_Wheels(rf => (Speed.rf, 0),
                         rb => (Speed.rb, 0),
                         lf => (Speed.lf, 0),
                         lb => (Speed.lb, 0));
         when Left =>
            Drive_Wheels(rf => (Speed.rf ,0),
                         rb => (0, Speed.rb),
                         lf => (0, Speed.lf),
                         lb => (Speed.lb, 0));
         when Right =>
            Drive_Wheels(rf => (0, Speed.rf),
                         rb => (Speed.rb, 0),
                         lf => (Speed.lf ,0),
                         lb => (0, Speed.lb));
         When Dia_FL =>
            Drive_Wheels(rf => (Speed.rf,0),
                         lb => (Speed.lb, 0),
                         lf => (0,0),
                         rb => (0,0));
         When Dia_FR =>
            Drive_Wheels(rf => (0,0),
                         lb => (0, 0),
                         lf => (speed.rf,0),
                         rb => (speed.rb,0));
         When Dia_BL =>
            Drive_Wheels(rf => (0,0),
                         lb => (0, 0),
                         lf => (0,speed.lf),
                         rb => (0,speed.rb));
         When Dia_BR =>
            Drive_Wheels(rf => (0,Speed.rf),
                         lb => (0, speed.lb),
                         lf => (0,0),
                         rb => (0,0));
         when Stop =>
            Drive_Wheels(rf => (0, 0),
                         rb => (0, 0),
                         lf => (0, 0),
                         lb => (0, 0));
      end case;
   end Drive;

   procedure Drive_Wheels(rf : Wheel;
                         rb : Wheel;
                         lf : Wheel;
                         lb : Wheel ) is
   begin
         MD.Set_PWM_Wheels (rf, rb, lf, lb);
   end Drive_Wheels;

   procedure Servo (ServoPin : ServoPins ;
                    Angle : Degrees)
   is
   begin
         MD.Set_Servo(ServoPin, Angle);
   end Servo;

begin
   Initialize;
end rarts.MotorDriver;
