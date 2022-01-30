//
//  ViewController.swift
//  Prework
//
//  Created by Jeff Wang on 1/29/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    var total = 0.00
    var stepperVal = 0.00
    var rounded = false
    var temp = 0.00
    
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var partSizeLabel: UILabel!
    @IBOutlet weak var partySizeIncrement: UIStepper!
    @IBOutlet weak var partySize: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitAmount: UILabel!
    @IBOutlet weak var roundUp: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill *
            tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        if (rounded) {
            totalLabel.text = String(format: "$%.2f", round(total))
            if (stepperVal == 0.00) {
                splitAmount.text = "$0.00"
            }
            else {
                splitAmount.text = String(format: "$%.2f", (round(total/stepperVal)))
            }
        }
        else {
            totalLabel.text = String(format: "$%.2f", total)
            if (stepperVal == 0.00) {
                splitAmount.text = "$0.00"
            }
            else {
                splitAmount.text = String(format: "$%.2f", (total/stepperVal))
            }
        }
    }
    
    
    @IBAction func partySizeAdjust(_ sender: UIStepper) {
        partySize.text = Int(sender.value).description
        stepperVal = Double(sender.value)
        
        if (stepperVal == 0.00) {
            splitAmount.text = "$0.00"
        }
        else {
            if (rounded) {
                splitAmount.text = String(format: "$%.2f", (round(total/stepperVal)))
            }
            else {
                splitAmount.text = String(format: "$%.2f", (total/stepperVal))
            }
        }
    }
    
    @IBAction func roundUpAction(_ sender: UISwitch) {
        if (sender.isOn) {
            temp = round(total)
            totalLabel.text = String(format: "$%.2f", temp)
            if (stepperVal == 0.00) {
                splitAmount.text = "$0.00"
            }
            else {
                splitAmount.text = String(format: "$%.2f", (temp/stepperVal))
            }
            rounded = true;
        }
        else {
            totalLabel.text = String(format: "$%.2f", total)
            if (stepperVal == 0.00) {
                splitAmount.text = "$0.00"
            }
            else {
                splitAmount.text = String(format: "$%.2f", (total/stepperVal))
            }
            rounded = false
        }
    }
    
}

