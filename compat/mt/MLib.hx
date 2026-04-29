package mt;
class MLib {
    public static inline function round(v:Float):Int return Math.round(v);
    public static inline function floor(v:Float):Int return Math.floor(v);
    public static inline function ceil(v:Float):Int return Math.ceil(v);
    public static inline function fmin(a:Float, b:Float):Float return Math.min(a, b);
    public static inline function fmax(a:Float, b:Float):Float return Math.max(a, b);
    public static inline function fclamp(v:Float, min:Float, max:Float):Float return v < min ? min : v > max ? max : v;
    public static inline function clamp(v:Int, min:Int, max:Int):Int return v < min ? min : v > max ? max : v;
    public static inline function toDeg(r:Float):Float return r * 180 / Math.PI;
    public static inline function toRad(d:Float):Float return d * Math.PI / 180;
    public static inline function fabs(v:Float):Float return Math.abs(v);
    public static inline function iabs(v:Int):Int return v < 0 ? -v : v;
    public static function max(a:Dynamic, b:Dynamic):Dynamic { return a > b ? a : b; }
    public static function min(a:Dynamic, b:Dynamic):Dynamic { return a < b ? a : b; }
    public static var PI(default, null):Float = Math.PI;
    public static var PI2(default, null):Float = Math.PI * 2;
}
