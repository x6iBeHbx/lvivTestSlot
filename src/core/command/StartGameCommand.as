package core.command {
import core.model.proxy.SpinReelProxy;
import core.view.mediator.SlotMachineMediator;
   import core.view.vl.SlotMachineViewLogic;

   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;

   public class StartGameCommand extends SimpleCommand {

      override public function execute(notification:INotification):void {

         facade.registerProxy(new SpinReelProxy())
         facade.registerMediator(new SlotMachineMediator(new SlotMachineViewLogic()));
      }
   }
}


