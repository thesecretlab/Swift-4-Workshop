//
//  ViewController.swift
//  Popovers
//
//  Created by Jon Manning on 8/8/17.
//  Copyright © 2017 Secret Lab. All rights reserved.
//

import UIKit

class PopoverMainViewController: UIViewController {

    // Note that the type of the sender is given as UIButton
    @IBAction func showImagePicker(_ sender: UIButton) {
        
        // Create an image picker
        let imagePicker = UIImagePickerController()
        
        // Tell it to present itself in a popover
        // This will make the popoverPresentationController property available
        imagePicker.modalPresentationStyle = .popover
        
        // Present from the button's frame, in the coordinate space of the view controller's view
        imagePicker.popoverPresentationController?.sourceView = self.view
        imagePicker.popoverPresentationController?.sourceRect = sender.frame
        
        // Present the popover (on iPhone, this will appear as a regular modal)
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
}

