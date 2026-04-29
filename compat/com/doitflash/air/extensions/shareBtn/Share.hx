package com.doitflash.air.extensions.shareBtn;
import flash.events.EventDispatcher;
class Share extends EventDispatcher {
    public function new() { super(); }
    public function shareMessage(title:String, msgTitle:String, str:String):Void {}
    public function shareViaTwitter(str:String):Void {}
    public function shareViaFacebook():Void {}
}
