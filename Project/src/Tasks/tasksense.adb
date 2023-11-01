With Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Ultrasonic;
with MicroBit.Types; use MicroBit.Types;
use MicroBit;

with MyBrain; use MyBrain;

package body TaskSense is

    task body sense is
      myClock : Time;
      package sensorFront is new Ultrasonic(MB_P13, MB_P12);
      package sensorBack is new Ultrasonic(MB_P16, MB_P15);
      DistanceFront : Distance_cm;
      DistanceBack : Distance_cm;
   begin
      
      null; -- note that you can place Setup code here that is only run once for the entire task
      
      loop
         myClock := Clock; --important to get current time such that the period is exactly 200ms.
                           --you need to make sure that the instruction NEVER takes more than this period. 
                           --make sure to measure how long the task needs, see Tasking_Calculate_Execution_Time example in the repository.
                           --What if for some known or unknown reason the execution time becomes larger?
                           --When Worst Case Execution Time (WCET) is overrun so higher than your set period, see : https://www.sigada.org/ada_letters/dec2003/07_Puente_final.pdf
                           --In this template we put the responsiblity on the designer/developer.
         
         DistanceFront := sensorFront.Read;
         DistanceBack := sensorBack.Read;
    
         Brain.SetMeasurementSensorFront (DistanceFront);
         Brain.SetMeasurementSensorBack (DistanceBack);
            
         delay until myClock + Milliseconds(200); --random period
      end loop;
   end sense;

end TaskSense;
