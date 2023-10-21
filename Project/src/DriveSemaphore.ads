package RartsDriveSemaphore is

   protected type DriveBool is

      function Read return Boolean;
      procedure Write;

   private
      Value : Boolean := True;

   end DriveBool;

end RartsDriveSemaphore;
