//
//  TipCalculatorViewController.swift
//  MyTipApp
//
//  Created by Aguilar, Julio on 10/25/19.
//  Copyright © 2019 Julio Cesar. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var numberOfPeople = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        resetButtons()
        sender.isSelected = true
        tip = getTipInDecimal(withString: sender.currentTitle!)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }

    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard var bill = billTextField.text else { return }
        bill = bill != "" ? bill : "270.63"
        
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = getTotal(withBill: bill)
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
    
    // MARK: - Helpers
    
    func resetButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    func getTipInDecimal(withString percentage: String ) -> Double {
        return Double(percentage.dropLast())! / 100.0
    }
    
    func getTotal(withBill bill: String) -> String {
        guard bill != "", let bill = Double(bill) else { return "" }
        let result = bill * (1 + tip) / Double(numberOfPeople)
        return String(format: "%.2f", result)
    }
}
