package com.distriqt.extension.inappbilling.events;
class InAppBillingEvent {
    public static var SETUP_SUCCESS = "setupSuccess";
    public static var SETUP_FAILURE = "setupFailure";
    public static var PRODUCTS_LOADED = "productsLoaded";
    public static var PRODUCTS_FAILED = "productsFailed";
    public static var INVALID_PRODUCT = "invalidProduct";
    public static var PRODUCT_DETAILS_SUCCESS = "productDetailsSuccess";
    public static var PRODUCT_DETAILS_FAILED = "productDetailsFailed";
    public static var PURCHASE_SUCCESS = "purchaseSuccess";
    public static var PURCHASE_CANCELLED = "purchaseCancelled";
    public static var PURCHASE_FAILED = "purchaseFailed";
    public static var CONSUME_SUCCESS = "consumeSuccess";
    public static var CONSUME_FAILED = "consumeFailed";
    public static var RESTORE_SUCCESS = "restoreSuccess";
    public static var RESTORE_FAILED = "restoreFailed";
    public static var RESTORE_PURCHASES_SUCCESS = "restorePurchasesSuccess";
    public static var RESTORE_PURCHASES_FAILED = "restorePurchasesFailed";
    public var data:Dynamic;
    public var errorCode:Dynamic = 0;
    public function new(type:String) {}
}
