-- USN PROJECT TEMPLATE INTELLIGENT REAL-TIME SYSTEMS
-- Project name: [RARTS Mecanum Car]
-- Project members: [Stian Nordholm, Anders Minde]


--This is a project template for a Jorvik profile (a less restrictive Ravenscar) for the MicroBit v2 such that we have a language supported real-time OS for embedded targets
--It requires the nRF52833 Jorvik runtime files. They can be found in the folder "runtime profiles" and need to be copied to your earm-eabi compiler toolchain
--In future version of GNATstudio this profile is automatically available and this step can be skipped (for status see: https://github.com/AdaCore/bb-runtimes/pull/67)

--Check out the many examples in the ADL for the MicroBit v2 to see:
--  1) How the various drivers can be used like the accelerometer,speaker  or wireless communication via radio
--  2) How ADA features like the Math library and Bounded_Vectors (Containers) can be used
--  3) How to structure your Ada tasks with a protected object to synchronize data or with entries to synchronize flow
--  4) How to perform a execution time analysis
--  5) How to integrate your Ada project with a Unity project over USB

-- Open a View > Cross Platforms > Serial Ports to see Put_Line output. Set the baud rate to 115.200

-- COM4 B115200
with MicroBit.Ultrasonic;
with MicroBit.Console; use MicroBit.Console;
with MicroBit.Types; use MicroBit.Types;
use MicroBit;

procedure Main with Priority => 0 is
   package sensor1 is new Ultrasonic(MB_P16, MB_P0);
  -- package sensor2 is new Ultrasonic;

   Distance : Distance_cm := 0;
begin
   loop
      Put_Line ("x");
      Distance := sensor1.Read;
      Put_Line ("Front: " & Distance_cm'Image(Distance)); -- a console line delay the loop significantly
     -- Distance := sensor2.Read;
     -- Put_Line ("Left: " & Distance_cm'Image(Distance)); -- a console line delay the loop significantly

      --NOTE: A delay directly after a read of about 50ms is needed if only 1 sensor
      -- or when multiple, have more than 1 sensor face the same direction
      -- we use a delay here because our Serial port gets flooded otherwise
      delay 0.05; --50 ms
   end loop;

end Main;
