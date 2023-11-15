With TaskSense;
With TaskThink;
With TaskAct;

--Empty main running as a task currently set to lowest priority. Can be used as it is a normal task!

Procedure Main with Priority => 0 is
begin
   loop -- We need a main loop, otherwise it constantly reboots!
        -- A reboot can be seen in the Serial Ports (View -> Serial Port, select com port, set baudrate to 115200 and press reset button on Microbit)
        -- Every time the Micro:Bit reboots it will begin with a "0" symbol in your Serial Port monitor.
      null;
   end loop;
end Main;
