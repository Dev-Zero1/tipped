//
//  SettingsViewController.swift
//  tipped
//
//  Created by administrator on 10/19/18.
//  Copyright © 2018 administrator. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipAmt: UILabel!
    @IBOutlet weak var slider: UISlider!
    var modified: Bool = false
    var amt :     Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modified = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateCustomTip(_ sender: Any) {
        self.modified = true
        slider.value = roundf(slider.value)
        tipAmt.text  = String(format: "%f.0 %", slider.value)
       self.amt = roundf(slider.value)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
