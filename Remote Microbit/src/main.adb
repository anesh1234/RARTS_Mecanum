with LSM303AGR; use LSM303AGR;
with MicroBit.Radio;
with HAL; use HAL;
with MicroBit.Console; use MicroBit.Console;
with MicroBit.Buttons; use MicroBit.Buttons;
with MicroBit.Accelerometer;
with MicroBit.DisplayRT;
with MicroBit.DisplayRT.Symbols;
use MicroBit;
procedure Main is
   RXdata : Radio.RadioData;
   TxData : Radio.RadioData;

   --Defining accelData and threshold for acceleromenter
   accelData: All_Axes_Data;
   accelThreshold : constant := 150;
begin
   TxData.Length := 3+2; -- This is important! Header is 4-1=3, payload is 2 bytes. If higher payload needed change this to a max of 32.
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
      --  --check if some data received and if so print it. Note that the framebuffer can max contain x messages (currently set to 4).
      --important! Sometimes data received contains junk since we dont do any package verification and radio transmission is noisy!
      while Radio.DataReady loop
         RXdata :=Radio.Receive;
         Put("Raven Received D1: " & UInt8'Image(RXdata.Payload(1)));
         Put_Line(" D2: " & UInt8'Image(RXdata.Payload(2)));
      end loop;
      --
      --  -- setup some data to be transmitted and transmit it

      --Read accel data
   AccelData := Accelerometer.AccelData;

   --Logic for the accelerometer
    MicroBit.DisplayRT.Clear;

   if accelData.X > accelThreshold then
      MicroBit.DisplayRT.Symbols.Left_Arrow;
      --Todo: add data to radio packet
   elsif accelData.X < -accelThreshold then
      MicroBit.DisplayRT.Symbols.Right_Arrow;
      --todo
   elsif accelData.Y > accelThreshold then
      MicroBit.DisplayRT.Symbols.Up_Arrow;
      --todo
   elsif accelData.Y < -accelThreshold then
      MicroBit.DisplayRT.Symbols.Down_Arrow;
      --todo
      else
         MicroBit.DisplayRT.Symbols.Heart;

   end if;
   --End of logic for accelerometer


      if MicroBit.Buttons.State (Button_A) = Pressed and MicroBit.Buttons.State (Button_B) = Pressed then

         TxData.Payload(1) := 10;
         Put("Transmit D1: " & UInt8'Image(TXdata.Payload(1)));
         Put_Line(" D2: " & UInt8'Image(TXdata.Payload(1)));
         Radio.Transmit(TXdata);

      end if;
      --
      -- repeat every 500ms
        delay(0.5);

   end loop;
end Main;
