/**
 * Created by HOME on 04.04.2016.
 */
package core.model.proxy {
   import core.config.GameEvents;
import core.config.GameNotifications;
import core.model.caller.ServerCaller;

   import flash.events.Event;

   import org.puremvc.as3.patterns.proxy.Proxy;

   public class SpinReelProxy extends Proxy {

      public static const NAME:String = "SpinReelProxy";
      private var serverCaller:ServerCaller = new ServerCaller();

      public function SpinReelProxy() {
         super(NAME);

         serverCaller.addEventListener(SlotMachineEvent.STOP_ROUND_ANIMATION, serverResponse);
      }

       public function spinStart():void {

           serverCaller.spinStart();
       }


      private function serverResponse(event:Event):void {

         sendNotification(GameNotifications.STOP_SPIN, serverCaller.response);
      }
   }
}


