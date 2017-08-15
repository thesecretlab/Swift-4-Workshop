//
//  DetailViewController.swift
//  Assignment1
//
//  Created by Jon Manning on 15/8/17.
//  Copyright © 2017 Secret Lab. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configureView() {
        // Update the user interface for the detail item.
        
        guard let detail = detailItem else {
            return
        }
        
        guard let textField = textField else {
            return
        }
        
        guard let dateLabel = dateLabel else {
            return
        }
        
        textField.text = detail.data
        dateLabel.text = detail.created.description
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard let detail = detailItem else {
            return
        }
        
        detail.data = textField.text ?? ""
        
        DataManager.shared.saveData()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: DataEntry? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

