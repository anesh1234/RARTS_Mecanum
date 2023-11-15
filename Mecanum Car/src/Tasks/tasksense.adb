with MyBrain; use MyBrain;

package body TaskSense is

   task body sense is
      
      myClock : Time;
      
      package sensorFront is new Ultrasonic(MB_P13, MB_P12);
      package sensorBack is new Ultrasonic(MB_P16, MB_P15);
      
      DistanceFront : Distance_cm;
      DistanceBack : Distance_cm;
      
      RXdata : Radio.RadioData;
      TxData : Radio.RadioData;
      
   begin
      
      TxData.Length := 3+1; -- This is important! Header is 4-1=3, payload is 2 bytes. If higher payload needed change this to a max of 32.
      TxData.Version:= 12;  -- Since CRC is a bit buggy (see Radio package), current implementation uses both length and version as additional hardcoded crc check so make sure they match in both sender and receiver
      TxData.Group := 201;    -- Since messages are broadcasted, a group can be used as unique ID to only use message of a certain ID
      TxData.Protocol := 14;-- Protocol can be used for setting up a handshake for example. This could be useful to confirm if a package with message ID is actually received by sending an acknowledgement to the Sender. The Sender can then stop with sending message that messageID and send the next package.

      Radio.Setup(RadioFrequency => 2407,
                  Length => TxData.Length,
                  Version => TxData.Version,
                  Group => TxData.Group,
                  Protocol => TxData.Protocol);

      Radio.StartReceiving;
      Put_Line(Radio.State); -- this should report Status: 3, meaning in RX mode

      loop
         myClock := Clock;
         
         while Radio.DataReady loop
            RXdata := Radio.Receive;
            Put("Raven Received: " & UInt8'Image(RXdata.Payload(1)));
            Brain.SetRXdata(RXdata.Payload(1));
         end loop;
         
         DistanceFront := sensorFront.Read;
         Brain.SetMeasurementSensorFront (DistanceFront);
         
         DistanceBack := sensorBack.Read;
         Brain.SetMeasurementSensorBack (DistanceBack);
            
         delay until myClock + Milliseconds(65);
      end loop;
   end sense;

end TaskSense;
