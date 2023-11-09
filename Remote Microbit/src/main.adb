with LSM303AGR;                  use LSM303AGR;
with MicroBit.Radio;
with HAL;                        use HAL;
with MicroBit.Console;           use MicroBit.Console;
with MicroBit.Buttons;           use MicroBit.Buttons;
with MicroBit.Accelerometer;
with MicroBit.DisplayRT;
with MicroBit.DisplayRT.Symbols; use MicroBit;


procedure Main is
   RXdata                                               : Radio.RadioData;
   TxData                                               : Radio.RadioData;

   --Defining accelData and threshold for acceleromenter
   accelData                                            : All_Axes_Data;
   accelThreshold                                       : constant := 100;
   diaAccelThreshold                                       : constant := 50;
   temp : UInt8 := 0;
   --function TransmitData (TXdata                      : Radio.RadioData; Data : UInt8);

begin
   TxData.Length   :=
     3 +
       1; -- This is important! Header is 4-1=3, payload is 2 bytes. If higher payload needed change this to a max of 32.
   TxData.Version  :=
     12;  -- Since CRC is a bit buggy (see Radio package), current implementation uses both length and version as additional hardcoded crc check so make sure they match in both sender and receiver
   TxData.Group    :=
     201;    -- Since messages are broadcasted, a group can be used as unique ID to only use message of a certain ID
   TxData.Protocol :=
     14;-- Protocol can be used for setting up a handshake for example. This could be useful to confirm if a package with message ID is actually received by sending an acknowledgement to the Sender. The Sender can then stop with sending message that messageID and send the next package.

   Radio.Setup
     (RadioFrequency => 2_407, Length => TxData.Length,
      Version        => TxData.Version, Group => TxData.Group,
      Protocol       => TxData.Protocol);

   Radio.StartReceiving;
   Put_Line (Radio.State); -- this should report Status : 3, meaning in RX mode

   loop

      --Read accel data
      AccelData := Accelerometer.AccelData;

      --Logic for the accelerometer
      MicroBit.DisplayRT.Clear;

      if MicroBit.Buttons.State (Button_A) = Pressed and
        MicroBit.Buttons.State (Button_B) = Pressed
      then
         TxData.Payload(1) := 1;
         Radio.Transmit(TxData);

      elsif accelData.X > diaAccelThreshold and accelData.Y > diaAccelThreshold then
         TxData.Payload(1) := 7;
         Radio.Transmit(TxData);

      elsif accelData.X > diaAccelThreshold and accelData.Y < -diaAccelThreshold then
         TxData.Payload(1) := 8;
         Radio.Transmit(TxData);

      elsif accelData.X < -diaAccelThreshold and accelData.Y > diaAccelThreshold then
         TxData.Payload(1) := 9;
         Radio.Transmit(TxData);


      elsif accelData.X < -diaAccelThreshold and accelData.Y < -diaAccelThreshold then
         TxData.Payload(1) := 10;
         Radio.Transmit(TxData);


      elsif accelData.X > accelThreshold then
         MicroBit.DisplayRT.Symbols.Left_Arrow;
         TxData.Payload(1) := 5;
         Radio.Transmit(TxData);


      elsif accelData.X < -accelThreshold then
         MicroBit.DisplayRT.Symbols.Right_Arrow;
         TxData.Payload(1) := 6;
         Radio.Transmit(TxData);


      elsif accelData.Y > accelThreshold then
         MicroBit.DisplayRT.Symbols.Up_Arrow;
         TxData.Payload(1) := 3;
         Radio.Transmit(TxData);

      elsif accelData.Y < -accelThreshold then
         MicroBit.DisplayRT.Symbols.Down_Arrow;
         TxData.Payload(1) := 4;
         Radio.Transmit(TxData);

      else
         MicroBit.DisplayRT.Symbols.Heart;
         TxData.Payload(1) := 11;
         Radio.Transmit(TxData);

      end if;
      --End of logic for accelerometer

      Put(UInt8'Image(temp));
      temp := temp +1;
      Put_Line(UInt8'Image(TxData.Payload(1)));
      delay (0.6);

   end loop;
end Main;
