//
//  ViewController.swift
//  DragAndDrop
//
//  Created by Jon Manning on 10/8/17.
//  Copyright © 2017 Secret Lab. All rights reserved.
//

import UIKit

class DragAndDropViewController: UIViewController {

    @IBOutlet weak var dragView: UIView!
    @IBOutlet weak var dropView: UIView!
    
    @IBOutlet weak var dropResultLabel: UILabel!

}

// Setup
extension DragAndDropViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dragView.addInteraction(UIDragInteraction(delegate: self))
        dropView.addInteraction(UIDropInteraction(delegate:self))
        
    }
}

// Handling drags
extension DragAndDropViewController : UIDragInteractionDelegate {
    
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        
        let text = "This is some text I'm dragging!"
        
        let itemProvider = NSItemProvider(object: text as NSString)
        
        let dragItem = UIDragItem(itemProvider: itemProvider)
        
        return [dragItem]
        
    }
    
}


// Handling drops
extension DragAndDropViewController : UIDropInteractionDelegate {
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        
        return UIDropProposal(operation: .copy)
        
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        
        session.loadObjects(ofClass: NSString.self) { textItems in
            let texts = textItems as! [NSString]
            
            self.dropResultLabel.text = texts.first as String?
        }
        
    }
    
}


