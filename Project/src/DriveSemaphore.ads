package DriveSemaphore is

   protected DriveBool is
      function Get return Boolean;
      procedure Change;
   private
      Value : Boolean := True;
   end DriveBool;

end DriveSemaphore;
