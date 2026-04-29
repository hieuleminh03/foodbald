package com.distriqt.extension.inappbilling;

class InAppBilling {
    public static var service(default, null):InAppBilling = new InAppBilling();
    public static var isSupported(default, null):Bool = false;
    public var version(default, null):String = "1.0";

    public function new() {}

    public static function init(key:String):Void {}

    public function setup(?key:String="", ?purchasing:Bool=false):Void {}
    public function addEventListener(type:String, cb:Dynamic, ?useCapture:Bool=false, ?priority:Int=0, ?useWeakReference:Bool=false):Void {}
    public function removeEventListener(type:String, cb:Dynamic, ?useCapture:Bool=false):Void {}
    public function getProducts(ids:Array<String>):Void {}
    public function makePurchase(productId:Dynamic):Void {}
    public function consumePurchase(productId:Dynamic):Void {}
    public function restorePurchases():Void {}
    public function finishPurchase(purchase:{transactionId:String, productId:String, quantity:Int, transactionState:String}):Void {}
    public function dispose():Void {}
    public function setAppstoreApplicationReceipt(receipt:Dynamic):Void {}

    public static function isSupportedStatic():Bool return false;
}
