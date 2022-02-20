import UIKit
import Darwin

var str = "Hello, playground"

enum ServerError : Error{
    case AuthFail
    case Timeout
}

func handleServerResponse(responseCode:Int) throws -> String{
     switch responseCode {
    case 200:
         return "ok"
    case 401:
        throw ServerError.AuthFail
    case 500:
        throw ServerError.Timeout
    default:
         return "Done"
    }
//return "Success"
}

let result : String?

// if success print the value
if let result2 = try? handleServerResponse(responseCode: 200){
    print(result2)
}

// do try/catch
do {
    result = try handleServerResponse(responseCode: 400)
}catch ServerError.AuthFail{
    result = "Error"
}
catch  {
    result = error.localizedDescription
}

// null check
if result != nil{
    print(result!)
}

// Guard & Defer
// Guard let values available after this statement which is not the case with if let
// let, let, let {}
// defer{} always exceure at the end

class User{
    var name:String = ""
}

extension User{
    func getAge(){
        name = "Nav"
        print("Nav's age is 4")
    }
}
let user = User()
user.getAge()
print("Ok")

var sex:String? = nil

sex = "M"

//guard let sex = sex else {
//    throw ServerError.AuthFail
//}
//

if let sex1 = sex {
    print("sex \(sex1)")

}else{
    print("No sex")
}

print("Sex is \(sex)")

// protocol
protocol Task{
    func uploadText(_ rawInput:String)
}

class TaskResopnder:Task{
    func uploadText(_ rawInput: String) {
        print("I upload will tasks")
    }
}

class RawTextProcessor{
    let taskDelegate:Task = TaskResopnder()
    
    func doTask(){
        taskDelegate.uploadText( "Hi Nav here")
    }
    
    // static method
    class func staticMethod(){
        print("Hi from static")
    }
}

class Singelton{
    var list:[String] = ["nav","singh"]
    
    static let shared = Singelton()
    
    private init(){
        
    }
}


func sampleClosure(name:String, completion:(Bool, String)->Void){
    if name.isEmpty{
        completion(false, "")
    }else{
        completion(true,name)
    }
}

sampleClosure(name: "nav", completion: { state, name in
    if state {
        print(name)
    }
    
})

RawTextProcessor.staticMethod()

Singelton.shared.list.append("Lamme")

print(Singelton.shared.list)
