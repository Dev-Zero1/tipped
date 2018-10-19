//
//  ViewController.swift
//  tipped
//
//  Created by administrator on 10/19/18.
//  Copyright © 2018 administrator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var input:       UITextField!
    @IBOutlet weak var selection:   UISegmentedControl!
    @IBOutlet weak var tipLabel:    UILabel!
    @IBOutlet weak var totalLabel:  UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        input.becomeFirstResponder()
    }

    @IBAction func hideKB(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calcTip(_ sender: Any) {
        tipLabel.text = "10.00"
        totalLabel.text = "110.00"

        let rate = [0.18, 0.2, 0.25]
        let bill = Double(input.text!) ?? 0
        let tip = rate[selection.selectedSegmentIndex] * bill
        let total = bill + tip
       
        
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
        
    }
    
}

