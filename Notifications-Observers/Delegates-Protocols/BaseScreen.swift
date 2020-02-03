import UIKit

let lightNotificationKey = "co.jarcg.lightSide"
let darkNotificationKey = "co.jarcg.darkSide"

class BaseScreen: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    let light = Notification.Name(rawValue: darkNotificationKey)
    let dark = Notification.Name(rawValue: lightNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseButton.layer.cornerRadius = chooseButton.frame.size.height / 2
        createObservers()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func createObservers() {
        //light
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateCharacterImage(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateNameLabel(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateBackground(notification:)), name: light, object: nil)
        
        //dark
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateCharacterImage(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateNameLabel(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateBackground(notification:)), name: dark, object: nil)
    }
    
    @objc func updateCharacterImage(notification: NSNotification) {
        let isLight = notification.name == light
        let image = isLight ? UIImage(named: "luke")! : UIImage(named: "vader")!
        mainImageView.image = image
    }
    
    @objc func updateNameLabel(notification: NSNotification) {
        let isLight = notification.name == light
        let name = isLight ? "Luke" : "Vader"
        nameLabel.text = name
    }
    
    @objc func updateBackground(notification: NSNotification) {
        let isLight = notification.name == light
        let backgroundColor = isLight ? UIColor.cyan : UIColor.red
        view.backgroundColor = backgroundColor
    }
    
    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        let selectionVC = storyboard?.instantiateViewController(identifier: "SelectionScreen") as! SelectionScreen
        present(selectionVC, animated: true, completion: nil)
    }
}
