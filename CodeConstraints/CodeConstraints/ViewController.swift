//
//  ViewController.swift
//  CodeConstraints
//
//  Created by Jon Manning on 10/8/17.
//  Copyright © 2017 Secret Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        
        // --- CREATING THE VIEWS ---
        
        // Create our base view; make it the size of the screen
        self.view = UIView(frame: UIScreen.main.bounds)
        self.view.backgroundColor = .white
        
        // Create our top half view, set it up, and add it
        let topHalfView = UIView()
        topHalfView.backgroundColor = .green
        self.view.addSubview(topHalfView)
        
        // Create our label
        let label = UILabel()
        label.text = "Hi there!"
        topHalfView.addSubview(label)
        
        // --- SETTING UP THE LAYOUT ---
        
        // Don't automatically create constraints on these views
        topHalfView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Get the guidelines
        let layoutGuide = self.view.layoutMarginsGuide
        
        // Lay out the top half view:
        
        // Pin to the top
        topHalfView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        
        // Pin to the sides
        topHalfView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        topHalfView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        
        // It's half the height of its parent view
        topHalfView.heightAnchor.constraint(equalTo: layoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        
        // Lay out the label:
        
        // It's horizontally centered in the box, and the first line's baseline is aligned with the vertical center
        label.centerXAnchor.constraint(equalTo: topHalfView.centerXAnchor).isActive = true
        label.firstBaselineAnchor.constraint(equalTo: topHalfView.centerYAnchor).isActive = true
        
    }
}

