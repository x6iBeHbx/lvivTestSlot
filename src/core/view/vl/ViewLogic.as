package core.view.vl
{
   import core.utils.ResourceWarehouse;

   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.EventDispatcher;

   public class ViewLogic extends EventDispatcher
   {
      protected var _content:DisplayObjectContainer;

      public function ViewLogic(_class_name:String)
      {
         _content = new (ResourceWarehouse.getInstance().getAsset(_class_name));
      }

      public function addContent(insContent:DisplayObject):void
      {
         (_content as DisplayObjectContainer).addChild(insContent);
      }

      public function get content():DisplayObject
      {
         return _content as DisplayObject;
      }
   }
}


