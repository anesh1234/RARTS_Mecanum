pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E062 : Short_Integer; pragma Import (Ada, E062, "ada__tags_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__strings__text_buffers_E");
   E060 : Short_Integer; pragma Import (Ada, E060, "system__bb__timing_events_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "ada__exceptions_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "system__soft_links_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "system__exception_table_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "ada__streams_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "system__finalization_root_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "ada__finalization_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "system__storage_pools_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "system__finalization_masters_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "ada__real_time_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "ada__real_time__timing_events_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "ada__strings__maps_E");
   E199 : Short_Integer; pragma Import (Ada, E199, "ada__strings__unbounded_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "system__pool_global_E");
   E217 : Short_Integer; pragma Import (Ada, E217, "system__tasking__protected_objects_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "system__tasking__restricted__stages_E");
   E215 : Short_Integer; pragma Import (Ada, E215, "generic_timers_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "hal__gpio_E");
   E187 : Short_Integer; pragma Import (Ada, E187, "hal__i2c_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "hal__spi_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "hal__uart_E");
   E224 : Short_Integer; pragma Import (Ada, E224, "memory_barriers_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "cortex_m__nvic_E");
   E241 : Short_Integer; pragma Import (Ada, E241, "nrf__events_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "nrf__gpio_E");
   E243 : Short_Integer; pragma Import (Ada, E243, "nrf__gpio__tasks_and_events_E");
   E245 : Short_Integer; pragma Import (Ada, E245, "nrf__interrupts_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "nrf__rtc_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "nrf__spi_master_E");
   E228 : Short_Integer; pragma Import (Ada, E228, "nrf__tasks_E");
   E226 : Short_Integer; pragma Import (Ada, E226, "nrf__adc_E");
   E265 : Short_Integer; pragma Import (Ada, E265, "nrf__clock_E");
   E247 : Short_Integer; pragma Import (Ada, E247, "nrf__ppi_E");
   E263 : Short_Integer; pragma Import (Ada, E263, "nrf__radio_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "nrf__timers_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "nrf__twi_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "nrf__uart_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "nrf__device_E");
   E193 : Short_Integer; pragma Import (Ada, E193, "microbit__console_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "dfr0548_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "microbit__displayrt_E");
   E270 : Short_Integer; pragma Import (Ada, E270, "microbit__i2c_E");
   E219 : Short_Integer; pragma Import (Ada, E219, "microbit__iosfortasking_E");
   E260 : Short_Integer; pragma Import (Ada, E260, "microbit__radio_E");
   E276 : Short_Integer; pragma Import (Ada, E276, "microbit__timehighspeed_E");
   E278 : Short_Integer; pragma Import (Ada, E278, "microbit__ultrasonic_E");
   E268 : Short_Integer; pragma Import (Ada, E268, "rartsmotordriver_E");
   E258 : Short_Integer; pragma Import (Ada, E258, "mybrain_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "taskact_E");
   E274 : Short_Integer; pragma Import (Ada, E274, "tasksense_E");
   E281 : Short_Integer; pragma Import (Ada, E281, "taskthink_E");

   Sec_Default_Sized_Stacks : array (1 .. 4) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := 0;
      Time_Slice_Value := 0;
      WC_Encoding := 'b';
      Locking_Policy := 'C';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := 'F';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 1;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 4;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Ada.Strings.Text_Buffers'Elab_Spec;
      E005 := E005 + 1;
      System.Bb.Timing_Events'Elab_Spec;
      E060 := E060 + 1;
      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E062 := E062 + 1;
      System.Exception_Table'Elab_Body;
      E097 := E097 + 1;
      E099 := E099 + 1;
      E012 := E012 + 1;
      Ada.Streams'Elab_Spec;
      E153 := E153 + 1;
      System.Finalization_Root'Elab_Spec;
      E160 := E160 + 1;
      Ada.Finalization'Elab_Spec;
      E158 := E158 + 1;
      System.Storage_Pools'Elab_Spec;
      E162 := E162 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E157 := E157 + 1;
      Ada.Real_Time'Elab_Body;
      E128 := E128 + 1;
      Ada.Real_Time.Timing_Events'Elab_Spec;
      E197 := E197 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E203 := E203 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E199 := E199 + 1;
      System.Pool_Global'Elab_Spec;
      E164 := E164 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E217 := E217 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E123 := E123 + 1;
      E215 := E215 + 1;
      HAL.GPIO'ELAB_SPEC;
      E155 := E155 + 1;
      HAL.I2C'ELAB_SPEC;
      E187 := E187 + 1;
      HAL.SPI'ELAB_SPEC;
      E180 := E180 + 1;
      HAL.UART'ELAB_SPEC;
      E191 := E191 + 1;
      E224 := E224 + 1;
      E222 := E222 + 1;
      E241 := E241 + 1;
      Nrf.Gpio'Elab_Spec;
      Nrf.Gpio'Elab_Body;
      E146 := E146 + 1;
      E243 := E243 + 1;
      E245 := E245 + 1;
      E175 := E175 + 1;
      Nrf.Spi_Master'Elab_Spec;
      Nrf.Spi_Master'Elab_Body;
      E178 := E178 + 1;
      E228 := E228 + 1;
      E226 := E226 + 1;
      E265 := E265 + 1;
      E247 := E247 + 1;
      E263 := E263 + 1;
      Nrf.Timers'Elab_Spec;
      Nrf.Timers'Elab_Body;
      E182 := E182 + 1;
      Nrf.Twi'Elab_Spec;
      Nrf.Twi'Elab_Body;
      E185 := E185 + 1;
      Nrf.Uart'Elab_Spec;
      Nrf.Uart'Elab_Body;
      E189 := E189 + 1;
      Nrf.Device'Elab_Spec;
      Nrf.Device'Elab_Body;
      E136 := E136 + 1;
      Microbit.Console'Elab_Body;
      E193 := E193 + 1;
      DFR0548'ELAB_SPEC;
      DFR0548'ELAB_BODY;
      E132 := E132 + 1;
      Microbit.Displayrt'Elab_Body;
      E195 := E195 + 1;
      E270 := E270 + 1;
      Microbit.Iosfortasking'Elab_Spec;
      Microbit.Iosfortasking'Elab_Body;
      E219 := E219 + 1;
      Microbit.Radio'Elab_Spec;
      E260 := E260 + 1;
      Microbit.Timehighspeed'Elab_Body;
      E276 := E276 + 1;
      E278 := E278 + 1;
      Rartsmotordriver'Elab_Body;
      E268 := E268 + 1;
      Mybrain'Elab_Spec;
      E258 := E258 + 1;
      Taskact'Elab_Spec;
      Taskact'Elab_Body;
      E126 := E126 + 1;
      Tasksense'Elab_Spec;
      Tasksense'Elab_Body;
      E274 := E274 + 1;
      Taskthink'Elab_Spec;
      Taskthink'Elab_Body;
      E281 := E281 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
   end;

--  BEGIN Object file/option list
   --   C:\Users\ander\Dropbox\PC\Documents\git-repos\RARTS_Mecanum\Mecanum Car\obj\rartsmotordriver.o
   --   C:\Users\ander\Dropbox\PC\Documents\git-repos\RARTS_Mecanum\Mecanum Car\obj\mybrain.o
   --   C:\Users\ander\Dropbox\PC\Documents\git-repos\RARTS_Mecanum\Mecanum Car\obj\taskact.o
   --   C:\Users\ander\Dropbox\PC\Documents\git-repos\RARTS_Mecanum\Mecanum Car\obj\tasksense.o
   --   C:\Users\ander\Dropbox\PC\Documents\git-repos\RARTS_Mecanum\Mecanum Car\obj\taskthink.o
   --   C:\Users\ander\Dropbox\PC\Documents\git-repos\RARTS_Mecanum\Mecanum Car\obj\main.o
   --   -LC:\Users\ander\Dropbox\PC\Documents\git-repos\RARTS_Mecanum\Mecanum Car\obj\
   --   -LC:\Users\ander\Dropbox\PC\Documents\git-repos\RARTS_Mecanum\Mecanum Car\obj\
   --   -LC:\Users\ander\Dropbox\PC\Documents\git-repos\RARTS_Mecanum\Ada_Drivers_Library\boards\MicroBit_v2\obj\full_lib_Debug\
   --   -LC:\gnat\2021-arm-elf\arm-eabi\lib\gnat\ravenscar-full-nrf52833\adalib\
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
