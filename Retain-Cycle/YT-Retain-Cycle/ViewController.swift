import UIKit

class ViewController: UIViewController {
    var jose: Person?
    var myMacBook: Macbook?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObject()
        assignProperties()
    }
    
    func createObject() {
        jose = Person(name: "Jose", macbook: nil)
        myMacBook = Macbook(name: "My MacBook", owner: nil)
    }
    
    func assignProperties() {
        jose?.macbook = myMacBook
        myMacBook?.owner = jose
        
        jose = nil
        myMacBook = nil
    }
}
