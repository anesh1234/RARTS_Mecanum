package body MyBrain is

     
    protected body Brain is
      --  procedures can modify the data
      procedure SetMeasurementSensorFront (V : Distance_cm) is
      begin
         MeasurementSensorFront := V;
      end SetMeasurementSensorFront;

      --  functions cannot modify the data
      function GetMeasurementSensorFront return Distance_cm is
      begin
         return MeasurementSensorFront;
      end GetMeasurementSensorFront;
      
      --  procedures can modify the data
      procedure SetMeasurementSensorBack (V : Distance_cm) is
      begin
         MeasurementSensorBack := V;
      end SetMeasurementSensorBack;

      --  functions cannot modify the data
      function GetMeasurementSensorBack return Distance_cm is
      begin
         return MeasurementSensorBack;
      end GetMeasurementSensorBack;
   end Brain;

end MyBrain;
