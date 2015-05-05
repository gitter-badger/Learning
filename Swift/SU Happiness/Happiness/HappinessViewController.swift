//
//  HappinessViewController.swift
//  Happiness
//
//  Created by n0p and Mari on 2015-04-11.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceDataSource {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }

    var happiness: Int = 10 {   // 0 = very sad, 100 = ecstatic
        didSet {
            min(max(happiness, 0), 100)
            println("Happiness = \(happiness)")
            updateUI()
        }
    }

    private struct Constants {
        static let HappinessGestureScale: CGFloat = 6
    }

    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }

    private func updateUI() {
        faceView.setNeedsDisplay()
    }

    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50) / 50
    }
}
