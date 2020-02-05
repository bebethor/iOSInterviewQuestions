
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fileImageView: UIImageView!
    @IBOutlet weak var trashImageView: UIImageView!
    
    var fileViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //fileImageView.isUserInteractionEnabled = true
        addPanGesture(view: fileImageView)
        fileViewOrigin = fileImageView.frame.origin
        view.bringSubviewToFront(fileImageView)
    }
   
    func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    // Refactor
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        // Where the magic happens
        let fileView = sender.view! // fileView is fileImageView and we attach the sender to this view
        let translation = sender.translation(in: view) // translation is a property of PanGestureRecognizer that tracks the location and the velocity of the movement of the pan in the main view.
        switch sender.state {
        case .began, .changed:
            fileView.center = CGPoint(x: fileView.center.x + translation.x, y: fileView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            if fileImageView.frame.intersects(trashImageView.frame) {
                UIView.animate(withDuration: 0.3) {
                    self.fileImageView.alpha = 0.0
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.fileImageView.frame.origin = self.fileViewOrigin
                }
            }
        default:
            break
        }
    }
}
