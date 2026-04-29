package flash.desktop;
import flash.events.EventDispatcher;
class NativeApplication extends EventDispatcher {
    public static var nativeApplication(default, null):NativeApplication = new NativeApplication();
    public var systemIdleMode:Dynamic;
    public function new() { super(); }
    public function activate():Void {}
    public function exit(?errorCode:Int=0):Void {}
}
