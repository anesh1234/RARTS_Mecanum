with MicroBit.Ultrasonic;
with MicroBit.Console; use MicroBit.Console;
with MicroBit.Types; use MicroBit.Types;
use MicroBit;

package body ultrasonic_sensors is

   procedure ReadBack with Priority => 0 is
      package sensor1 is new Ultrasonic(MB_P16, MB_P15);

      DistanceBack : Distance_cm := 0;
   begin
      loop
         Put_Line ("x");
         DistanceBack := sensor1.Read;
         Put_Line ("Back: " & Distance_cm'Image(DistanceBack)); -- a console line delay the loop significantly

      --NOTE: A delay directly after a read of about 50ms is needed if only 1 sensor
      -- or when multiple, have more than 1 sensor face the same direction
      -- we use a delay here because our Serial port gets flooded otherwise
         delay 0.05; --50 ms
   end loop;

   end ReadBack;

   procedure ReadFront with Priority => 0 is
      package sensor2 is new Ultrasonic(MB_P13, MB_P12);
      DistanceFront : Distance_cm := 0;
   begin
      loop
         Put_Line ("y");
         DistanceFront := sensor2.Read;
         Put_Line ("Front: " & Distance_cm'Image(DistanceFront)); -- a console line delay the loop significantly
         delay 0.05; --50 ms
      end loop;

   end ReadFront;

end ultrasonic_sensors;
