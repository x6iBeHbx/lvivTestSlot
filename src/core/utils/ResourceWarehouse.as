package core.utils {
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.utils.Dictionary;

   public class ResourceWarehouse {

      private var _wh:Vector.<DisplayObject> = new <DisplayObject>[];

      private static var _instance:ResourceWarehouse;

      public static function  getInstance():ResourceWarehouse
      {
         if (_instance==null)
         {
            _instance= new ResourceWarehouse();
         }
         return _instance as ResourceWarehouse;
      }

      public function addAsset(asset:DisplayObject):void
      {
         _wh.push(asset);
      }

      public function getAsset(it_name_class:String):Class
      {
         var ItClass:Class;
         for each(var assetClass:Loader in _wh)
            if (assetClass.contentLoaderInfo.applicationDomain.hasDefinition(it_name_class))
            {
               ItClass=assetClass.contentLoaderInfo.applicationDomain.getDefinition(it_name_class) as Class;
               break;
            }
         return ItClass;
      }
   }
}


