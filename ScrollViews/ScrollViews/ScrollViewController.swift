//
//  ViewController.swift
//  ScrollViews
//
//  Created by Jon Manning on 11/8/17.
//  Copyright © 2017 Secret Lab. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    // The scroll view we're working with
    @IBOutlet weak var scrollView: UIScrollView!
    
    // A view inside the scroll view. All content will appear inside it.
    var contentView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create and prepare the content view
        contentView = UIView()
        contentView.backgroundColor = .green
        
        // Disable its automatic constraints and add it to the scroll view
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        // Pin to all 4 edges of the scroll view
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        // Enforce a height; the scroll view will update its scrollable area
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 4000).isActive = true
        
        
        // For each of the numbers 1 through 4, create a label
        _ = (1...4).map { (number : Int) in
            
            // Create the label and set up its appearance and content
            let view = UILabel()
            view.backgroundColor = .blue
            view.textAlignment = .center
            view.textColor = .white
            view.font = UIFont.boldSystemFont(ofSize: 100)
            
            // Make it display the number we need
            view.text = String(number)
            
            // Add it to the view and disable its automatic constraints
            contentView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            
            // Set up the layout for the boxes
            
            // Boxes are a fixed square size
            let boxSize : CGFloat = 200
            
            view.widthAnchor.constraint(equalToConstant: boxSize).isActive = true
            view.heightAnchor.constraint(equalToConstant: boxSize).isActive = true
            
            // Set up the vertical and horizontal anchors.
            // We want this appearance:
            // 1   2
            //
            // 3   4
            
            // Vertical anchors
            switch number {
            case 1,2:
                // top-aligned
                view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            case 3,4:
                // bottom-aligned
                view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            default:
                fatalError("Case $0 should never be reached")
            }
            
            // Horizontal anchors
            switch number {
            case 1,3:
                // left-aligned
                view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            case 2,4:
                // right-aligned
                view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            default:
                fatalError("Case $0 should never be reached")
            }
        }
        
        // Enable zooming by setting a delegate and specifying zoom scale limits
        scrollView.delegate = self
        
        scrollView.maximumZoomScale = 2.0
        scrollView.minimumZoomScale = 1.0
    }

}

extension ScrollViewController : UIScrollViewDelegate {
    
    // "Which subview of the scroll view should increase its scale as the user pinches?"
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return contentView
    }
    
}

