package body TaskThink is

  task body think is
      myClock : Time;
   begin
      loop
         myClock := Clock;
         InterpretRadio;
         
         if Brain.GetModeBool = False then
            DriveAutomatic;
         end if;

         delay until myClock + Milliseconds(100);  --random period
      end loop;
   end think;

   
      procedure DriveAutomatic is
      begin
         if Brain.GetMeasurementSensorFront > Threshold then
            MotorDriver.SetDirection (Forward); --our decision what to do based on the sensor values        
         else
            MotorDriver.SetDirection (Stop); 
         end if;
   end DriveAutomatic;
   
   
   procedure InterpretRadio is
   begin
      if MyRxdata > 0 then
         case MyRxdata is
            when 1     =>   SetModeBool (True);
            when 2     =>   SetModeBool (False);
            when 3     =>   MotorDriver.SetDirection (Forward);
            when 4     =>   MotorDriver.SetDirection (Back);
            when 5     =>   MotorDriver.SetDirection (Left);
            when 6     =>   MotorDriver.SetDirection (Right);
            when 7     =>   MotorDriver.SetDirection (DiaFl);
            when 8     =>   MotorDriver.SetDirection (DiaFR);
            when 9     =>   MotorDriver.SetDirection (DiaBL);
            when 10    =>   MotorDriver.SetDirection (DiaBR);
            when 11    =>   MotorDriver.SetDirection (Stop);
         end case;
      end if;
   end InterpretRadio;

end TaskThink;
