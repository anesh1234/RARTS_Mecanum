with MicroBit.Types; use MicroBit.Types;

package MyBrain is

   protected Brain is
      function GetMeasurementSensorFront return Distance_cm; -- concurrent read operations are now possible
      function GetMeasurementSensorBack return Distance_cm; -- concurrent read operations are now possible
  
      procedure SetMeasurementSensorFront (V : Distance_cm); -- but concurrent read/write are not!
      procedure SetMeasurementSensorBack (V : Distance_cm); -- but concurrent read/write are not!
   private
         MeasurementSensorFront : Distance_cm := 0;
         MeasurementSensorBack : Distance_cm := 0;
   end Brain;

end MyBrain;
