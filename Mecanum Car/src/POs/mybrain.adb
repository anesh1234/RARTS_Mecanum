package body MyBrain is

   protected body Brain is

      procedure SetMeasurementSensorFront (V : Distance_cm) is
      begin
         MeasurementSensorFront := V;
      end SetMeasurementSensorFront;

      
      function GetMeasurementSensorFront return Distance_cm is
      begin
         return MeasurementSensorFront;
      end GetMeasurementSensorFront;
      

      procedure SetMeasurementSensorBack (V : Distance_cm) is
      begin
         MeasurementSensorBack := V;
      end SetMeasurementSensorBack;


      function GetMeasurementSensorBack return Distance_cm is
      begin
         return MeasurementSensorBack;
      end GetMeasurementSensorBack;
      
      
      procedure SetModeBool (I : Integer) is
      begin
          Put_Line("Entered SetModeBool");
         if I = 1 then
            ModeBool := True;
            Put_Line("ModeBool set to True");
         elsif I = 2 then
            ModeBool := False;
         end if;
      end SetModeBool;
   
      
      function GetModeBool return Boolean is
      begin
         return ModeBool;
      end GetModeBool;
      
      
      procedure SetRXdata (Data : UInt8) is
      begin
         MyRxdata := Data;
      end SetRXdata;
      
      
      function GetRXdata return UInt8 is
      begin
         return MyRxdata;
      end GetRXdata;
      
      
      procedure SetDirection (V : Directions) is
      begin
         DriveDirection := V;
      end SetDirection;

      
      function GetDirection return Directions is
      begin
         return DriveDirection;
      end GetDirection;
      
      procedure SetSpeed (I : Integer) is
      begin
         if I = 1 then
            Speed := (2047, 2047, 2047, 2047);
         elsif I = 2 then
            Speed := (4095, 4095, 4095, 4095);
         end if;
      end SetSpeed;
      
      function GetSpeed return Speeds is
      begin
         return Speed;
      end GetSpeed;
      
      
   end Brain;
end MyBrain;
