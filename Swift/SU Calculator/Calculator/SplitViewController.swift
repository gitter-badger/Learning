//
//  SplitViewController.swift
//  Calculator
//
//  Created by n0p and Mari on 2015-04-30.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        delegate = self
    }

    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController!, ontoPrimaryViewController primaryViewController: UIViewController!) -> Bool {
        if secondaryViewController.isKindOfClass(UINavigationController.classForCoder()) && (secondaryViewController as! UINavigationController).topViewController.isKindOfClass(GrapherViewController.classForCoder()) {
            return true
        } else {
            return false
        }
    }
}
