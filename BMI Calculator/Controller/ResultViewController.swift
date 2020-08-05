//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Mirana Abrar Anwar on 7/13/20.
//  Copyright © 2020 Mirana Abrar Anwar. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue : String?
    var advice : String?
    var color: UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backgroundColor: UIImageView!
    
    @IBOutlet weak var recalculatePressed: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        backgroundColor.backgroundColor = color
    }
    
    @IBAction func recalc(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
