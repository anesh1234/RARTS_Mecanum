package drive_semaphores is

   protected type FrontDriveBool is

      function Read return Boolean;
      procedure Write;

   private
      Value : Boolean := False;

   end FrontDriveBool;

   protected type BackDriveBool is

      function Read return Boolean;
      procedure Write;

   private
      Value : Boolean := False;

   end BackDriveBool;

end drive_semaphores;
