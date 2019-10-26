//
//  ResultsViewController.swift
//  MyTipApp
//
//  Created by Aguilar, Julio on 10/25/19.
//  Copyright © 2019 Julio Cesar. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!

    var result: String?
    var tip: Int?
    var split: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingsLabel.text = "Split between \(split ?? 0) people, with \(tip ?? 10)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
