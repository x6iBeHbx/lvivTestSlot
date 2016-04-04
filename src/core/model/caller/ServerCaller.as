/**
 * Created by HOME on 04.04.2016.
 */
package core.model.caller {
   public class ServerCaller extends SlotMachine {
      public function ServerCaller() {
         super();
      }

      public function spinStart():void {
         dispatchEvent(new SlotMachineEvent(SlotMachineEvent.ROUND_STARTED));
      }
   }
}


