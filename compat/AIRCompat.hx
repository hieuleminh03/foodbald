package flash.desktop;
class NativeApplication {
    public static var nativeApplication(default, null) = new NativeApplication();
    public function new() {}
    public function addEventListener(type:String, listener:Dynamic, ?useCapture:Bool = false, ?priority:Int = 0, ?useWeakReference:Bool = false):Void {}
    public function removeEventListener(type:String, listener:Dynamic, ?useCapture:Bool = false):Void {}
    public function exit():Void {}
}
