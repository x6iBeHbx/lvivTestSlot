package core.command {
   import core.config.GameNotifications;
   import core.config.GeneralNotifications;
   import core.model.dto.ResourceUrlDto;
   import core.model.proxy.ExternalResourceProxy;
   import core.view.mediator.RootMediator;

   import flash.display.Sprite;

   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;

   public class StarUpCommand extends SimpleCommand {
      override public function execute(notifaction:INotification):void {

         var rootSprite:Sprite = notifaction.getBody() as Sprite;

         registerProxy();
         registerCommands();
         registerMediators(rootSprite);

         var resourceUrl:String = externalResourceProxy.resourceUrlDto.mainSwfUrl;

         sendNotification(GeneralNotifications.START_RESOURCE_LOADING, resourceUrl);
      }

      private function registerProxy():void {

         facade.registerProxy(new ExternalResourceProxy(new ResourceUrlDto()));
      }

      private function registerMediators(root:Sprite):void {

         facade.registerMediator(new RootMediator(root))
      }

      private function registerCommands():void {

         facade.registerCommand(GeneralNotifications.START_RESOURCE_LOADING, LoadResourceCommand);
         facade.registerCommand(GeneralNotifications.START_GAME, StartGameCommand);
         facade.registerCommand(GameNotifications.START_SPIN_COMMAND, StartSpinCommand);
         //facade.registerCommand(GameNotifications.STOP_SPIN_COMMAND, StopSpinCommand);
      }

      private function get externalResourceProxy():ExternalResourceProxy {

         return facade.retrieveProxy(ExternalResourceProxy.NAME) as ExternalResourceProxy;
      }
   }
}


