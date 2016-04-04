package core.view.vl {
   import core.config.GameEvents;
   import core.utils.ResourceWarehouse;

   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;

   public class SlotMachineViewLogic extends ViewLogic {

      public var icons:MovieClip;
      public var controlBar:MovieClip;
      private var reels:Vector.<Reel> = new <Reel>[];
      private var spinButton:MovieClip;

      public function SlotMachineViewLogic() {
         super("slotMachine");

         icons = new (ResourceWarehouse.getInstance().getAsset("iconsContainer"));
         controlBar = content["controlPanel"] ;
         spinButton = controlBar["spinBtn"];

         updateWin(0);

         var iconsBitmapVector:Vector.<Bitmap> = new <Bitmap>[];
         for(var i:int = 0; i < 6; i++){
            icons.gotoAndStop(i);

            var btm:Bitmap = generateBitmap(icons);

            iconsBitmapVector.push(btm);
         }
         createReel(iconsBitmapVector);
         registerSpinButton();
      }

      public function responseIsReady(serverResponse:*):void {
         for(var i:int = 0; i < 3; i++){
            trace(serverResponse.icons[i]);
            icons.gotoAndStop(serverResponse.icons[i]);
            var btm:Bitmap = generateBitmap(icons);
            reels[i].serverIcon = btm;
         }
         updateWin(serverResponse.winValue);
      }

      private function updateWin(value:int):void {
         controlBar["winValue"].text = value;
      }

      private function createReel(iconsBitmapVector:Vector.<Bitmap>):void {

         for(var i:int = 0; i < 3; i++){
            reels.push(new Reel(content["reel_" + i], iconsBitmapVector));
         }
      }

      private function generateBitmap(icon:MovieClip):Bitmap {

         var bmd:BitmapData=new BitmapData(icon.width, icon.height,false);
         bmd.draw(icon);

         var btm:Bitmap = new Bitmap();
         btm.bitmapData = bmd
         btm.smoothing = true;
         return btm;
      }

      private function registerSpinButton():void {
         spinButton["spinBtnHit"].addEventListener(MouseEvent.CLICK, spinButtonClicked);
      }

      private function spinButtonClicked(event:MouseEvent):void {

         updateWin(0);

         for(var i:int = 0; i < 3; i++){
            (reels[i] as Reel).startSpin();
         }

         dispatchEvent(new Event(GameEvents.SPIN_BUTTON_CLICKED))
      }
   }
}


