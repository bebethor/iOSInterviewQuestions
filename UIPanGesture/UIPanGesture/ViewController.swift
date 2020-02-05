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
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        // Where the magic happens
        let fileView = sender.view! // fileView is fileImageView and we attach the sender to this view
        switch sender.state {
        case .began, .changed:
            moveViewWithPan(view: fileView, sender: sender)
        case .ended:
            if fileImageView.frame.intersects(trashImageView.frame) {
                returnViewToOrigin()
            } else {
                deleteView()
            }
        default:
            break
        }
    }
    
    func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view) // translation is a property of PanGestureRecognizer that tracks the
        view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    func returnViewToOrigin() {
        UIView.animate(withDuration: 0.3) {
            self.fileImageView.alpha = 0.0
        }
    }
    
    func deleteView() {
        UIView.animate(withDuration: 0.3) {
            self.fileImageView.frame.origin = self.fileViewOrigin
        }
    }
}
