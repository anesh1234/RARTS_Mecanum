with LSM303AGR;                  use LSM303AGR;
with MicroBit.Radio;
with HAL;                        use HAL;
with MicroBit.Console;           use MicroBit.Console;
with MicroBit.Buttons;           use MicroBit.Buttons;
with MicroBit.Accelerometer;
with MicroBit.DisplayRT;
with MicroBit.DisplayRT.Symbols; use MicroBit;
procedure Main is
   RXdata : Radio.RadioData;
   TxData : Radio.RadioData;

   --Defining accelData and threshold for acceleromenter
   accelData      : All_Axes_Data;
   accelThreshold : constant := 150;

   procedure TransmitData (TXdata : Radio.RadioData; Data : UInt8);

begin
   TxData.Length   :=
     3 +
     2; -- This is important! Header is 4-1=3, payload is 2 bytes. If higher payload needed change this to a max of 32.
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
   Put_Line (Radio.State); -- this should report Status: 3, meaning in RX mode

   loop
      --Read accel data
      AccelData := Accelerometer.AccelData;

      --Logic for the accelerometer
      MicroBit.DisplayRT.Clear;

      if MicroBit.Buttons.State (Button_A) = Pressed and
        MicroBit.Buttons.State (Button_B) = Pressed
      then
         TransmitData (TxData, 1);

      elsif accelData.X > accelThreshold then
         if accelData.Y > accelThreshold then
            --Dia FL
            TransmitData (TxData, 7);
         else
            MicroBit.DisplayRT.Symbols.Left_Arrow;
            TransmitData (TxData, 5);
         end if;

      elsif accelData.X < -accelThreshold then
         if accelData.Y < -accelThreshold then
            --Dia BR
            TransmitData (TxData, 10);
         else
            MicroBit.DisplayRT.Symbols.Right_Arrow;
            TransmitData (TxData, 6);
         end if;

      elsif accelData.Y > accelThreshold then
         if accelData.X < -accelThreshold then
            --Dia FR
            TransmitData (TxData, 8);
         else
            MicroBit.DisplayRT.Symbols.Left_Arrow;
            TransmitData (TxData, 5);
         end if;
         MicroBit.DisplayRT.Symbols.Up_Arrow;
         TransmitData (TxData, 3);

      elsif accelData.Y < -accelThreshold then
         if accelData.X > accelThreshold then
            --Dia BL
            TransmitData (TxData, 9);
         else
            MicroBit.DisplayRT.Symbols.Right_Arrow;
            TransmitData (TxData, 6);
         end if;
         MicroBit.DisplayRT.Symbols.Down_Arrow;
         TransmitData (TxData, 4);

      else
         MicroBit.DisplayRT.Symbols.Heart;
         TransmitData (TxData, 11);

      end if;
      --End of logic for accelerometer

      -- repeat every 500ms
      delay (0.5);

   end loop;
end Main;

procedure TransmitData (TXdata : Radio.RadioData; Data : UInt8) is
begin
   TxData.Payload (1) := Data;
   Radio.Transmit (TXdata);
end TransmitData;
