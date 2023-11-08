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
      
      
      procedure SetModeBool (V : Boolean) is
      begin
         ModeBool := V;
      end SetModeBool;
   
      
      function GetModeBool return Boolean is
      begin
         return ModeBool;
      end GetModeBool;
      
      
      procedure SetRXdata (Data : UInt8) is
      begin
         MyRxdata := Data;
      end SetRXdata;
      
      
      function GetRXdata return RartsUInt8 is
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
      
      
   end Brain;
end MyBrain;
