
import UIKit

protocol SideSelectionDelegate {
    func didTapChoice(image: UIImage, name: String, color: UIColor)
}

class SelectionScreen: UIViewController {
    var sideSelectionDelegate: SideSelectionDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func imperialButtonTapped(_ sender: UIButton) {
        sideSelectionDelegate.didTapChoice(image: UIImage(imageLiteralResourceName: "vader"), name: "Vader", color: .red)
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func rebelButtonTapped(_ sender: UIButton) {
        sideSelectionDelegate.didTapChoice(image: UIImage(imageLiteralResourceName: "luke"), name: "Luke", color: .cyan)
        self.dismiss(animated: true, completion: nil)
    }
}
