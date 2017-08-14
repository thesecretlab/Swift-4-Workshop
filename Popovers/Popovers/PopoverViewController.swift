//
//  PopoverViewController.swift
//  Popovers
//
//  Created by Jon Manning on 9/8/17.
//  Copyright © 2017 Secret Lab. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {
    
    @IBAction func closePopover(_: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        let traitCollection = self.presentingViewController?.traitCollection ?? self.traitCollection
        
        switch traitCollection.horizontalSizeClass {
        case .compact:
            self.navigationController?.isNavigationBarHidden = false
        case .regular:
            fallthrough
        case .unspecified:
            self.navigationController?.isNavigationBarHidden = true
        }
        
    }

}


