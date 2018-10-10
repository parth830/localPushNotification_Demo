//
//  ViewController.swift
//  localPushNotification_Demo
//
//  Created by Ayaan Ruhi on 10/10/18.
//  Copyright © 2018 parth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Request user permission for push notification
        LocalPushManager.shared.requestAuthorization()
    }

    @IBAction func startTimerButtonTapped(_ sender: UIButton) {
        
        //MARK: Setup the push notification
        guard let timerText = timeTextField.text else { return }
        guard let time = TimeInterval(timerText) else { return }
        
        LocalPushManager.shared.sendNotification(in: time)
    }
    
}

