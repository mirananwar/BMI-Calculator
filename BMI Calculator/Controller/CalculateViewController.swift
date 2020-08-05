//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Mirana Abrar Anwar on 7/13/20.
//  Copyright © 2020 Mirana Abrar Anwar. All rights reserved.
//
import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightSliderChanged: UISlider!
    
    @IBOutlet weak var weightSliderChanged: UISlider!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    // height slider viewed in meters and feet
    @IBAction func heightChanged(_ sender: UISlider) {
        let x = heightSliderChanged.value
        let y = Float(roundf(100*x)/100)
        let feet = Float(roundf(y * 3.28084 * 10) / 10)
        heightLabel.text = String(y) + "m / " + String(feet) + "feet"
        
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        let pounds = Int(round(sender.value * 2.205))
        weightLabel.text = String(format: "%.0f", sender.value) + "kg / " + String(pounds) + "pounds"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSliderChanged.value
        let weight = weightSliderChanged.value
        
        calculatorBrain.calcBmi(height: height, weight:weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let BMIval = calculatorBrain.bmi
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.stringBmi()
            destinationVC.advice = calculatorBrain.getAdvice(BMI: BMIval!)
            destinationVC.color = calculatorBrain.getColor(BMI: BMIval!)
        }
    }
}

