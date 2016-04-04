/**
 * Created by HOME on 04.04.2016.
 */
package core.view.vl {
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.Event;

   public class Reel {

      private var reel:MovieClip
      private var iconsBitmapVector:Vector.<Bitmap> = new <Bitmap>[];
      private var serverResponseIcon:Bitmap = new Bitmap();
      private var topIcon:Bitmap = new Bitmap();
      private var visibleIcon:Bitmap = new Bitmap();
      private var bottomIcon:Bitmap = new Bitmap();

      private var reelStop:Boolean;
      private var responseAdded:Boolean;

      public function Reel(reel:MovieClip, iconsBitmapVector:Vector.<Bitmap>) {

         this.reel = reel;
         this.iconsBitmapVector = iconsBitmapVector;

         topIcon.bitmapData = generateRandomIcon.bitmapData.clone();
         topIcon.y = -topIcon.height;

         visibleIcon.bitmapData = generateRandomIcon.bitmapData.clone();

         this.reel.addChild(topIcon);
         this.reel.addChild(visibleIcon);
      }

      private function cloneBitmap(originBitmap:Bitmap):Bitmap {

         var btm:Bitmap = new Bitmap();
         btm.bitmapData = originBitmap.bitmapData.clone();

         return btm;
      }

      private function get generateRandomIcon():Bitmap {

         var randomIconID:Number = Math.floor(Math.random()*iconsBitmapVector.length);
         return iconsBitmapVector[randomIconID] as Bitmap;
      }

      private function addedIconToReel(icon:Bitmap, reelIndex:int):void {
         reel.addChild(cloneBitmap(icon));
      }

      private function onEnterFrame(event:Event):void {

         var step:int = 15;

         topIcon.y += step;
         visibleIcon.y += step;
         bottomIcon.y += step;

         if (visibleIcon.y >= visibleIcon.height) {

            bottomIcon.bitmapData = visibleIcon.bitmapData.clone();
            bottomIcon.y = bottomIcon.height;
            visibleIcon.bitmapData.dispose();
            reel.addChild(bottomIcon);
         }

         if (topIcon.y >= 0) {

            visibleIcon.bitmapData = topIcon.bitmapData.clone();
            visibleIcon.y = 0;

            topIcon.bitmapData.dispose();

            if (responseAdded) {
               reel.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
               reelStop = false;
            }

            if (reelStop) {
               topIcon.bitmapData = serverResponseIcon.bitmapData.clone();
               topIcon.y = -topIcon.height
               responseAdded = true;
            } else {
               topIcon.bitmapData = generateRandomIcon.bitmapData.clone();
               topIcon.y = -topIcon.height
            }

         }

         reel.addChild(visibleIcon);
         reel.addChild(topIcon);
      }

      public function startSpin():void {
         reel.addEventListener(Event.ENTER_FRAME, onEnterFrame);
         reelStop = false;
         responseAdded = false;
      }

      public function set serverIcon(serverResponseIcons:Bitmap):void {
         reelStop = true;
         this.serverResponseIcon = serverResponseIcons;
      }
   }
}


