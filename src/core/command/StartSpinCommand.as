/**
 * Created by HOME on 04.04.2016.
 */
package core.command {
   import core.model.proxy.SpinReelProxy;

   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;

   public class StartSpinCommand extends SimpleCommand {
      override public function execute(notification:INotification):void {

         spinProxy.spinStart();
      }

      private function get spinProxy():SpinReelProxy {
         return facade.retrieveProxy(SpinReelProxy.NAME) as SpinReelProxy;
      }
   }
}


