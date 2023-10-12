package DriveSemaphore is

   protected driveBool is
      function Get return Boolean;
      procedure Change;
   private
      Value : Boolean := True;
   end driveBool;

end DriveSemaphore;
