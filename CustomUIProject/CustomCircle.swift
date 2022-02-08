import UIKit

@IBDesignable
class CustomCircle: UIView {

    var workingView: UIView!
    var xibName: String = "CustomCircle"
    let vc = ViewController()
    
    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomView()
    }
    
    func getFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    func setCustomView() {
        workingView = getFromXib()
        workingView.frame = bounds
        workingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        workingView.layer.cornerRadius = frame.size.width / 2
        workingView.layer.masksToBounds = true
        
        
        addSubview(workingView)
    }
    
//    @IBAction func panAction(_ gesture: UIPanGestureRecognizer) {
//
//        let gestureTranslation = gesture.translation(in: vc.view)
//
//        guard let gestureView = gesture.view else {
//            return
//        }
//
//        gestureView.center = CGPoint(x: gestureView.center.x + gestureTranslation.x, y: gestureView.center.y + gestureTranslation.y)
//
//        gesture.setTranslation(.zero, in: vc.view)
//
//        guard gesture.state == .ended else {
//            return
//        }
//
//    }
}
