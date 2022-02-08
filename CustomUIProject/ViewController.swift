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
        let circleTwoFrame = circleTwo.frame
        let circleThreeFrame = circleThree.frame
        let circleFourFrame = circleFour.frame
        let circleFiveFrame = circleFive.frame
        let circleSixFrame = circleSix.frame
        let circleSevenFrame = circleSeven.frame
        
        
        for val in Int(circleOneFrame.minY)...Int(circleOneFrame.maxX) {
            for i in 1..<circles.count {
                if Int(circles[i].frame.origin.y) == val {
                    circles[i].isHidden = true
                    circles[i].frame = CGRect(x: circles[i].frame.minX, y: circles[i].frame.minY, width: 0, height: 0)
                    circleOne.frame = CGRect(x: circleOne.frame.minX, y: circleOne.frame.minY, width: circleOne.frame.width + 5, height: circleOne.frame.height + 5)
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

