/**
 * Created by HOME on 03.04.2016.
 */
package core.model.proxy {
import core.model.dto.ResourceUrlDto;

import org.puremvc.as3.patterns.proxy.Proxy;

   public class ExternalResourceProxy extends Proxy {

      public static const NAME:String = "ExternalResourceProxy";
      public function ExternalResourceProxy(data:ResourceUrlDto) {

         super(NAME, data);
      }

       public function get resourceUrlDto():ResourceUrlDto {

           return getData() as ResourceUrlDto;
       }
   }
}


