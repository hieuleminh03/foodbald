package mt;
class SecureSO {
    public var data(default, null):Dynamic;
    public function deviceId():String return "web_player_001";
    var name:String;
    
    public function new(cfg:{name:String, aesKey:String, aesIv:String}) {
        this.name = cfg.name;
        this.data = {};
        load();
    }
    
    public function load():Void {}
    public function save():Void {}
    public function flush():Void {}
    public function get(k:String):Dynamic return Reflect.field(data, k);
    public function set(k:String, v:Dynamic):Void Reflect.setField(data, k, v);
}
