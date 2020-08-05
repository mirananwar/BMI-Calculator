//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Mirana Abrar Anwar on 7/13/20.
//  Copyright © 2020 Mirana Abrar Anwar. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func stringBmi () ->String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    
    mutating func calcBmi(height: Float, weight: Float){
        let heightsq = powf(height, 2)
        let weight = weight
        let bmiValue = Float(weight) / heightsq
        
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Underweight" , color:#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
        }
        else if (bmiValue < 24.9){
            bmi = BMI(value: bmiValue, advice: "Healthy :)", color: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1))
        }
        else{
            bmi = BMI(value: bmiValue, advice: "Overweight", color: #colorLiteral(red: 0.4525604248, green: 0.04035380483, blue: 0.02648418956, alpha: 1))
            
        }
    }
    
    func getAdvice(BMI: BMI) -> String{
        return BMI.advice
    }
    
    func getColor(BMI: BMI) -> UIColor{
        return BMI.color
    }
}
