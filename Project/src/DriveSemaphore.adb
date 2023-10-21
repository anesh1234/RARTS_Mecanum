package body RartsDriveSemaphore is
   protected body DriveBool is
      
      function Read return Boolean is
      begin
         return Value;
      end Read;
      
      procedure Write is

      begin
         if Value = True then
            Value := False;
         elsif Value = False then
         Value := True;
         end if;
      
      end Write;

   end DriveBool;
      
end RartsDriveSemaphore;
