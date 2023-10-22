package body drive_semaphores is
   
   protected body FrontDriveBool is
      
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

   end FrontDriveBool;
   
   
   
   protected body BackDriveBool is
      
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

   end BackDriveBool;
   
end drive_semaphores;
