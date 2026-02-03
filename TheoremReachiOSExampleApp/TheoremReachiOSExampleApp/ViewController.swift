//
//  ViewController.swift
//  TheoremReachiOSExampleApp
//
//  Migrated from Objective-C to Swift
//  Copyright © 2017 theoremreach. All rights reserved.
//

import UIKit
import TheoremReachSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.async {
            self.initializeTheoremReachSDK()
        }
    }

    func initializeTheoremReachSDK() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        if !appDelegate.didBecomeActive {
            DispatchQueue.main.async {
                self.initializeTheoremReachSDK()
            }
            return
        }

        appDelegate.askForIDFAPermissions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func launchTheoremReach(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        appDelegate.initializeTheoremReachSDK()
    }
}
