import UIKit

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

var runCount = 0

Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
    print("Timer fired!")
    runCount += 1

    if runCount == 3 {
        timer.invalidate()
    }
}

