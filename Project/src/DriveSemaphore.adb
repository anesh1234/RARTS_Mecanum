package body RartsDriveSemaphore is
   protected body DriveBool is
      
      function Get return Boolean is
      begin
         return Value;
      end Get;
      
      procedure Change is

      begin
         if Value = True then
            Value := False;
         elsif Value = False then
         Value := True;
         end if;
      
      end Change;

   end DriveBool;
      
end RartsDriveSemaphore;
