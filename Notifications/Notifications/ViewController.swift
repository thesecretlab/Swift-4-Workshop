//
//  ViewController.swift
//  Notifications
//
//  Created by Jon Manning on 9/8/17.
//  Copyright © 2017 Secret Lab. All rights reserved.
//

import UIKit

// NSNotification.Name is the type that contains all notification names
// You add a new notification name by extending the type and adding a new one
extension NSNotification.Name {
    static let DidSomethingCool = Notification.Name("didSomethingCool")
}

class ViewController: UIViewController {

    @IBAction func sendNotification() {
        NotificationCenter.default.post(name: .DidSomethingCool, object: nil)
    }
    
    var observer : AnyObject? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardFrameChanged), name: .UIKeyboardDidChangeFrame, object: nil)
        
        observer = NotificationCenter.default.addObserver(forName: .DidSomethingCool, object: nil, queue: nil, using: { (notification) in
            NSLog("DidSomethingCool notification posted")
        })
        
    }
    
    // Must be @objc in order to use with #selector
    @objc
    func keyboardFrameChanged(notification: Notification) {
        NSLog("Keyboard frame changed")
    }
    
    deinit {
        // We need to manually tidy up
        NotificationCenter.default.removeObserver(self)
    }


}

