with MicroBit.Servos;  use MicroBit.Servos;


procedure RartsServo is
   -- this example requires you to wire two 2 servo motors to pin Microbit 1 and 2. It is recommended to power the servos's with 5V (check the spec sheet)
   -- while the IO signal from the microbit s 3.3V

   -- define the micro:bit v2 pins where 2 servo's are attached.
   Pin_Id : Servo_Pin_Id := 8;
   Angle : Servo_Set_Point := 0;

begin
   loop

      Go (Pin_Id, Angle + 180);
      delay(0.02);
      Go (Pin_Id, Angle);
      delay(0.02);

   end loop;
end RartsServo;
