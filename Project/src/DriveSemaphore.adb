package body driveBool is

   protected body driveBool is
      function Get return Boolean is
      begin
         return Value;
      end Get;
      
      procedure Change is
      begin
         if Value = True then
            Value := False;
         elsif Value = False then
            Value := True
      end Change;
      
end driveBool;
