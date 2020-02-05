import Foundation

class Person {
    var name: String
    var macbook: Macbook?
    
    init(name: String, macbook: Macbook?) {
        self.name = name
        self.macbook = macbook
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Macbook {
    var name: String
    weak var owner: Person?
    
    init(name: String, owner: Person?) {
        self.name = name
        self.owner = owner
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}
