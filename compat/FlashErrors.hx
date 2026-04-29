package flash.errors;
class Error {
    public var errorID:Int;
    public var message:String;
    public function new(message:String="", id:Int=0) { this.message = message; this.errorID = id; }
}
