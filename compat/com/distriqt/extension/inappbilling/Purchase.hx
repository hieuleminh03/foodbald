package com.distriqt.extension.inappbilling;
class Purchase {
    public var transactionId:String;
    public var productId:String;
    public var quantity:Int;
    public var transactionState:String;
    public function new() {}
    public static var STATE_PURCHASED = "purchased";
    public static var STATE_RESTORED = "restored";
    public static var STATE_FAILED = "failed";
    public static var STATE_CANCELLED = "cancelled";
}
