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

      if Brain.GetMeasurementSensorFront > Threshold and Brain.GetMeasurementSensorBack < Threshold then
         Brain.SetDirection (Forward);
         Brain.SetSpeed(2);
      elsif Brain.GetMeasurementSensorFront > Threshold then
         Brain.SetDirection (Forward);
         Brain.SetSpeed(1);
      else
         Brain.SetDirection (Stop);
         Brain.SetSpeed(1);
      end if;

   end DriveAutomatic;
   
   procedure InterpretRadio is
   begin

      case Brain.GetRXdata is
         when 0      =>   null;
         when 1      =>   Brain.SetModeBool (1);
         when 2      =>   Brain.SetModeBool (2);
         when others => null;
      end case;

      if Brain.GetModeBool = True then
         case Brain.GetRXdata is
            when 3      =>   Brain.SetDirection (Forward);
            when 4      =>   Brain.SetDirection (Back);
            when 5      =>   Brain.SetDirection (Left);
            when 6      =>   Brain.SetDirection (Right);
            when 7      =>   Brain.SetDirection (Dia_FL);
            when 8      =>   Brain.SetDirection (Dia_FR);
            when 9      =>   Brain.SetDirection (Dia_BL);
            when 10     =>   Brain.SetDirection (Dia_BR);
            when 11     =>   Brain.SetDirection (Stop);
            when 12     =>   Brain.SetDirection (RotateLeft);
            when 13     =>   Brain.SetDirection (RotateRight);
            when others =>   null;
         end case;
      end if;

   end InterpretRadio;
   
end TaskThink;
