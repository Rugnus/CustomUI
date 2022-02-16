//
//  ViewController.swift
//  CustomUIProject
//
//  Created by Sungur on 07.02.2022.
//

import UIKit


class ViewController: UIViewController {


    @IBOutlet weak var circleOne: CustomCircle!
    
    @IBOutlet weak var circleTwo: CustomCircle!
    
    @IBOutlet weak var circleThree: CustomCircle!
    
    @IBOutlet weak var circleFour: CustomCircle!
    
    @IBOutlet weak var circleFive: CustomCircle!
    
    @IBOutlet weak var circleSix: CustomCircle!
    
    @IBOutlet weak var circleSeven: CustomCircle!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleOne.layer.cornerRadius = circleOne.frame.width / 2
        
        
    }

    @IBAction func panAction(_ gesture: UIPanGestureRecognizer) {
        
        let circles: [CustomCircle] = [circleOne, circleTwo, circleThree, circleFour, circleFive, circleSix, circleSeven]
        
        let circleOneFrame = circleOne.frame
        let animation = CABasicAnimation(keyPath: "transform.scale.x")
        animation.fromValue = 1
        animation.toValue = 1.2
        animation.duration = 3
        animation.autoreverses = false
        
        let animationH = CABasicAnimation(keyPath: "transform.scale.y")
        animationH.fromValue = 1
        animationH.toValue = 1.2
        animationH.duration = 3
        animationH.autoreverses = false
        
        for val in Int(circleOneFrame.minY)...Int(circleOneFrame.maxX) {
            for i in 1..<circles.count {
                if Int(circles[i].frame.origin.y) == val {
                    circles[i].isHidden = true
                    circles[i].frame = CGRect(x: circles[i].frame.minX, y: circles[i].frame.minY, width: 0, height: 0)
                    circleOne.layer.cornerRadius = circleOne.frame.width / 2
                    circleOne.layer.masksToBounds = true
                    UIView.animate(withDuration: 3, delay: 0, options: .curveEaseInOut, animations: {
                        self.circleOne.frame = CGRect(x: self.circleOne.frame.minX, y: self.circleOne.frame.minY, width: self.circleOne.frame.width + 10, height: self.circleOne.frame.height + 10)
                        self.circleOne.backgroundColor = .purple
                    }, completion: nil)
                    circleOne.layer.cornerRadius = circleOne.frame.width / 2
                    circleOne.layer.masksToBounds = true
                    
                }
            }
            break
        }
        
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view else {
            return
        }
        
        gestureView.center = CGPoint(x: gestureView.center.x + gestureTranslation.x, y: gestureView.center.y + gestureTranslation.y)
        
        gesture.setTranslation(.zero, in: view)
        
        guard gesture.state == .ended else {
            return
        }
    }
    
    func changeView(_ circle: CustomCircle) {
        circle.backgroundColor = .red
        circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY, width: circle.frame.width + 10, height: circle.frame.height + 10)
    }
}

