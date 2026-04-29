class Ga {
    public static function init():Void {}
    public static function event(cat:String, action:String, ?label:String, ?value:Int):Void {}
    public static function pageview(path:String, ?extra:Dynamic):Void {}
    public static function social(network:String, action:String, target:String):Void {}
    public static function transaction(id:String, revenue:Float, ?affil:Dynamic, ?items:Array<Dynamic>):Void {}
    public static var Affiliation = { IAP: "IAP" };
}
