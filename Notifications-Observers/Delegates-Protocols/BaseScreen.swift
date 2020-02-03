import UIKit

let lightNotificationKey = "co.jarcg.lightSide"
let darkNotificationKey = "co.jarcg.darkSide"

class BaseScreen: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func createObservers() {
        
    }
    
    @objc func updateCharacterImage(notification: NSNotification) {
        
    }
    
    @objc func updateNameLabel(notification: NSNotification) {
        
    }
    
    @objc func updateBackground(notification: NSNotification) {
        
    }
    
    
    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "SelectionScreen") as! SelectionScreen
        self.present(newViewController, animated: true, completion: nil)
    }
}
