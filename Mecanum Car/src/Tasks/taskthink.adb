with RartsMotorDriver; use RartsMotorDriver;

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
            Brain.SetDirection (Forward); --our decision what to do based on the sensor values        
         else
            Brain.SetDirection (Stop); 
         end if;
   end DriveAutomatic;
   
   
   procedure InterpretRadio is
   begin
      if MyRxdata > 0 then
         case MyRxdata is
            when 0     =>   null;
            when 1     =>   Brain.SetModeBool (True);
            when 2     =>   Brain.SetModeBool (False);
            when 3     =>   Brain.SetDirection (Forward);
            when 4     =>   Brain.SetDirection (Back);
            when 5     =>   Brain.SetDirection (Left);
            when 6     =>   Brain.SetDirection (Right);
            when 7     =>   Brain.SetDirection (Dia_Fl);
            when 8     =>   Brain.SetDirection (Dia_FR);
            when 9     =>   Brain.SetDirection (Dia_BL);
            when 10    =>   Brain.SetDirection (Dia_BR);
            when 11    =>   Brain.SetDirection (Stop);
         end case;
      end if;
   end InterpretRadio;

end TaskThink;
