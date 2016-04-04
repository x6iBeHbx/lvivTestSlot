package core.view.mediator {
   import core.config.GameEvents;
   import core.config.GameNotifications;
   import core.config.GeneralNotifications;
   import core.view.vl.SlotMachineViewLogic;

   import flash.events.Event;

   import org.puremvc.as3.interfaces.INotification;

   import org.puremvc.as3.patterns.mediator.Mediator;

   public class SlotMachineMediator extends UIMediator {

      public static const NAME:String = "SlotMachineMediator";

      public function SlotMachineMediator(viewComponent:SlotMachineViewLogic) {

         super(NAME, viewComponent);
      }

      override public function onRegister():void {
         super.onRegister();
         registerListener();
      }

      override public function listNotificationInterests():Array {
         return [
            GameNotifications.STOP_SPIN
            ];
      }

      override public function handleNotification(notification:INotification):void {
         switch (notification.getName()){
            case GameNotifications.STOP_SPIN:

               (viewComponent as SlotMachineViewLogic).responseIsReady(notification.getBody());
               break;
         }
      }

      private function registerListener():void {
         (viewComponent as SlotMachineViewLogic).addEventListener(GameEvents.SPIN_BUTTON_CLICKED, spinButtonClickedHandler);
      }

      private function spinButtonClickedHandler(e:Event):void {

         sendNotification(GameNotifications.START_SPIN_COMMAND);
      }
   }
}


