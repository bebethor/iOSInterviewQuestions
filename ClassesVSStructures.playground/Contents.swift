import UIKit


/*
 CLASSES VS STRUCTURES
 */


// CLASSES: Are reference types
class MacBook {
    var year: Int
    var color: String
    
    init(year: Int, color: String) {
        self.year = year
        self.color = color
    }
}

let myMacBook = MacBook(year: 2020, color: "Space grey")
let stolenMacBook = myMacBook

stolenMacBook.color = "Spraypainted green"

print(myMacBook.color)


// Structs are value types. Struct do not need init.
struct Iphone {
    var number: Int
    var color: String
}

let myIphone = Iphone(number: 10, color: "Black")
var stolenIphone = myIphone
stolenIphone.color = "Pink"
print(myIphone.color)

