import Cocoa

var str = "Hello, playground"

class Transaccion{
    
    var from : String = "";
    var to = "";
    var amount : Int = 0;
    init(from:String, to:String, amount:Int){
        self.from = from
        self.to = to
        self.amount = amount
        
    }
    func cobrarComision(amount: Int, from:String, to:String){
        
    }
}

var envio1 = Transaccion(from:"Mary", to : "Joe", amount : 1);
envio1.cobrarComision(amount: 1, from: "Maru", to: "Bob")

class Block{
    var index:Int = 0
    var nounce:Int = 0
    var hash:String?
    var previousHash:String?
    private (set) var transactions:[Transaction] = [Transaction]()
}
