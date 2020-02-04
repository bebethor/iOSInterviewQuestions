
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fileImageView: UIImageView!
    @IBOutlet weak var trashImageView: UIImageView!
    
    var fileViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGesture(view: fileImageView)
        fileViewOrigin = fileImageView.frame.origin
    }
   
    func addPanGesture(view: UIView) {
        let pan = UIGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        // Where the magic happens
        let fileView = sender.view! // fileView is fileImageView and we attach the sender to this view
        let translation = sender.translation(in: view) // translation is a property of PanGestureRecognizer that tracks the location and the velocity of the movement of the pan in the main view.
        switch sender.state {
        case .began, .changed:
            fileView.center = CGPoint(x: fileView.center.x + translation.x, y: fileView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            break
        default:
            break
        }
    }
}
