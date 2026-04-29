package mt;
import mt.Delayer;
class DelayerAdd {
    public static inline function add(d:Delayer, ms:Float, cb:Void->Void, ?id:String) {
        d.addMs(id, cb, ms);
    }
}
