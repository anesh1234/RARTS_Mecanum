with MicroBit.Types; use MicroBit.Types;
with MicroBit.Radio; use MicroBit.Radio;
with MicroBit.Console; use MicroBit.Console;
with HAL; use HAL;

--Important: use Microbit.IOsForTasking for controlling pins as the timer used there is implemented as an protected object
With MicroBit.IOsForTasking; use MicroBit.IOsForTasking; -- we only depend on this for Analog_Value definition and Pin_Id. This could be abstracted so there is a smaller dependency!
with RartsMotorDriver; use RartsMotorDriver;
with DFR0548;  -- using the types defined here

package MyBrain is
   
   protected Brain is
      function GetMeasurementSensorFront return Distance_cm; -- concurrent read operations are now possible
      function GetMeasurementSensorBack return Distance_cm; -- concurrent read operations are now possible
      function GetDirection return Directions; -- concurrent read operations are now possible
      function GetModeBool return Boolean;
      function GetRXdata return UInt8;
      function GetSpeed return Speeds;
      
      procedure SetMeasurementSensorFront (V : Distance_cm); -- but concurrent read/write are not!
      procedure SetMeasurementSensorBack (V : Distance_cm); -- but concurrent read/write are not!
      procedure SetDirection (V : Directions); -- but concurrent read/write are not!
      procedure SetModeBool (I : Integer);
      procedure SetRXdata (Data : UInt8);
      procedure SetSpeed (I : Integer);
      
   private  
      MeasurementSensorFront : Distance_cm := 0;
      MeasurementSensorBack : Distance_cm := 0;
      ModeBool : Boolean := False;
      MyRxdata : UInt8 := 0;
      DriveDirection : Directions := Stop;
      Speed : Speeds;
   end Brain;

end MyBrain;
