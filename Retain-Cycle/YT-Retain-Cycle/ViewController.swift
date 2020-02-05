import UIKit

class ViewController: UIViewController {
    
    var sean: Person?
    var matilda: MacBook?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObjects()
        assignProperties()

    }
    
    func createObjects() {
        sean = Person(name: "Sean", macbook: nil)
        matilda = MacBook(name: "Matilda", owner: nil)
    }
    
    func assignProperties() {
        sean?.macbook = matilda
        matilda?.owner = sean
        
        sean = nil
        matilda = nil
    }
}

