import UIKit


/*
 Swift Optionals Tutorial - Unwrapping - Guard, If Let, Chaining, Force
 */

var optionalNumber: Int?
optionalNumber = 20

// IF LET
if let number = optionalNumber {
    print("I have a value: \(number)")
} else {
    print("I do not have value, I´m nil")
}

// GUARD
func tripleNumber(_ number: Int?) {
    guard let number = number else {
        print("Exiting function")
        return
    }
    print("My tripled numbers is \(number * 3)")
}

tripleNumber(optionalNumber)

// FORCE URWRAPPING ---> se explica pero no se toca!!!!!
//let forcedNumber = optionalNumber!
//print("Forced number value is: \(forcedNumber)")

// OPTIONAL CHANING
struct Device {
    var type: String
    var price: Float
    var color: String
}

var myPhone: Device?
myPhone = Device(type: "Prhone", price: 900.0, color: "Black")
let devicePrice = myPhone?.price

if let devicePrice = devicePrice {
    print("My total device price is: \(devicePrice + 8.99)")
}
