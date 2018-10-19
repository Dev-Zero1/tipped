//
//  ViewController.swift
//  tipped
//
//  Created by administrator on 10/19/18.
//  Copyright © 2018 administrator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewSeg: UISegmentedControl!
    @IBOutlet weak var input:       UITextField!
    @IBOutlet weak var selection:   UISegmentedControl!
    @IBOutlet weak var tipLabel:    UILabel!
    @IBOutlet weak var totalLabel:  UILabel!
    
     let vc = SettingsViewController(nibName: "SettingsViewController", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        input.becomeFirstResponder()
    }
    
    @IBAction func changeView(_ sender: Any) {
        //  1 is true (dark).
        if(viewSeg.selectedSegmentIndex == 0){
            
             self.view.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            
        // 0 is false (light)
        }else{
            self.view.backgroundColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        selection.setTitle(String(format: "%.0f",vc.amt), forSegmentAt: 3)
        
        let rate        = [0.18, 0.2, 0.25, 0.0]
        let bill        = Double(input.text!) ?? 0
        var tip: Float  = 0
        
        // cannot get values to transfer over from settings!
        if(vc.modified){
           
            tip =   Float((vc.amt / 100)  * Float(bill))
        }else{
            tip =   Float(rate[selection.selectedSegmentIndex] * bill)
        }
        
        let total = bill + Double(tip)
        
        
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
        
    }
    
    @IBAction func hideKB(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calcTip(_ sender: Any) {
        let rate        = [0.18, 0.2, 0.25, 0.0]
        let bill        = Double(input.text!) ?? 0
        var tip: Float  = 0
        
        if(vc.modified){
 
            tip =   Float((vc.amt / 100)  * Float(bill))
        }else{
              tip =   Float(rate[selection.selectedSegmentIndex] * bill)
        }
        
        let total = bill + Double(tip)
       
        
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
        
    }
    
}

