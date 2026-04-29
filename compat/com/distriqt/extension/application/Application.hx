package com.distriqt.extension.application;
class Application {
    public static var service(default, null):Application = new Application();
    public static var isSupported(default, null):Bool = false;
    public function new() {}
    public static function init(key:String):Void {}
    public function getAppStoreId():String return "0";
}
