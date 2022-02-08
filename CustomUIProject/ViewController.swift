//
//  ViewController.swift
//  CustomUIProject
//
//  Created by Sungur on 07.02.2022.
//

import UIKit

//var customCircleElement2: CustomCircle = CustomCircle(frame: CGRect(x: 110, y: 320, width: 71, height: 71))
//var customCircleElement3: CustomCircle = CustomCircle(frame: CGRect(x: 87, y: -130, width: 71, height: 71))
//var customCircleElement4: CustomCircle = CustomCircle(frame: CGRect(x: 300, y: 200, width: 71, height: 71))
//var customCircleElement5: CustomCircle = CustomCircle(frame: CGRect(x: 20, y: 140, width: 71, height: 71))
//var customCircleElement6: CustomCircle = CustomCircle(frame: CGRect(x: 210, y: 160, width: 71, height: 71))
//var customCircleElement7: CustomCircle = CustomCircle(frame: CGRect(x: 87, y: 500, width: 71, height: 71))


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
        
//        view.addSubview(customCircleElement2)
//        view.addSubview(customCircleElement3)
//        view.addSubview(customCircleElement4)
//        view.addSubview(customCircleElement5)
//        view.addSubview(customCircleElement6)
//        view.addSubview(customCircleElement7)
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
        
//        let circlesFrame = [circleOneFrame, circleTwoFrame, circleThreeFrame, circleFourFrame, circleFiveFrame, circleSixFrame, circleSevenFrame]
        
//        for j in 1..<circlesFrame.count {
//            for val in Int(circlesFrame[j].minX)...Int(circlesFrame[j].maxX) {
//                for i in 1..<circles.count {
//                    if Int(circles[i].frame.origin.x) == val {
//                        circles[i].isHidden = true
//                        circles[i].frame = CGRect(x: circles[i].frame.minX, y: circles[i].frame.minY, width: 0, height: 0)
//                        circles[j].backgroundColor = .red
//                        circles[j].frame = CGRect(x: circleOne.frame.minX, y: circleOne.frame.minY, width: circleOne.frame.width + 5, height: circleOne.frame.height + 5)
//                        circles[j].layer.cornerRadius = circleOne.frame.width / 2
//                        circles[j].layer.masksToBounds = true
//                    }
//                }
//                break
//            }
//            break
//        }
        
        for val in Int(circleOneFrame.minY)...Int(circleOneFrame.maxX) {
            for i in 1..<circles.count {
                if Int(circles[i].frame.origin.y) == val {
                    circles[i].isHidden = true
//                    print("circ 2 hide")
                    circles[i].frame = CGRect(x: circles[i].frame.minX, y: circles[i].frame.minY, width: 0, height: 0)
                    circleOne.frame = CGRect(x: circleOne.frame.minX, y: circleOne.frame.minY, width: circleOne.frame.width + 5, height: circleOne.frame.height + 5)
                    circleOne.backgroundColor = UIColor.red
                    circleOne.layer.cornerRadius = circleOne.frame.width / 2
                    circleOne.layer.masksToBounds = true
                }
            }
            break
        }
        
//        for val in Int(circleTwoFrame.minY)...Int(circleTwoFrame.maxX) {
//            for i in 2..<circles.count {
//                if circles[i] == circles[1] {
//                    continue
//                }
//                if Int(circles[i].frame.origin.y) == val {
//                    circles[i].isHidden = true
//                    print("circ 2 hide")
//                    circles[i].frame = CGRect(x: circles[i].frame.minX, y: circles[i].frame.minY, width: 0, height: 0)
//                    circleTwo.backgroundColor = .red
//                    circleTwo.frame = CGRect(x: circleTwo.frame.minX, y: circleTwo.frame.minY, width: circleTwo.frame.width + 5, height: circleTwo.frame.height + 5)
//                    circleTwo.layer.cornerRadius = circleTwo.frame.width / 2
//                    circleTwo.layer.masksToBounds = true
//                }
//            }
//            break
//        }
        
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

