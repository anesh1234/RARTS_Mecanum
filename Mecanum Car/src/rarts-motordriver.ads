with DFR0548; use DFR0548;
with HAL;     use HAL;

package RARTS.MotorDriver is

   type Directions is (Forward, 
                       Left,
                       Right,
                       Dia_FL,
                       Dia_FR,
                       Dia_BL,
                       Dia_BR,
                       Stop);

   type Speeds is record
      rf: UInt12;
      rb: UInt12;
      lf: UInt12;
      lb: UInt12;
   end record;

   procedure Drive (Direction : Directions;
                    Speed : Speeds := (4095,4095,4095,4095));

   procedure Servo (ServoPin : ServoPins ;
                    Angle : Degrees);

private
   procedure Drive_Wheels(rf : Wheel;
                         rb : Wheel;
                         lf : Wheel;
                         lb : Wheel);

   procedure Initialize;

end RARTS.MotorDriver;
