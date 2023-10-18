package RartsDriveSemaphore is

   protected type DriveBool is

      function Get return Boolean;
      procedure Change;

   private
      Value : Boolean := True;

   end DriveBool;

end RartsDriveSemaphore;
