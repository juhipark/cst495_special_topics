//
//  ViewController.swift
//  TipCalculator
//
//  Created by Juhi on 8/27/19.
//  Copyright © 2019 Juhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var percentControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // bill amount is always the first responder
        inputField.becomeFirstResponder()
        
        // remebering the bill amount when app restarts
        inputField.text = UserDefaults.standard.string(forKey: "billAmount") ?? ""
        
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        
        if let percentControl = sender as? UISegmentedControl {
            print("Segmented")
            
            percentControl.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
            print("clicked")
            
            UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 6.0, options: .allowUserInteraction, animations:{ [weak self] in
                self?.percentControl.transform = .identity
                }, completion: nil)
        }
        
        let tipPercent = [0.10, 0.15]
        
        let bill = Double(inputField.text!) ?? 0
        
        // remembering the bill amount
        UserDefaults.standard.set(inputField.text, forKey: "billAmount")
        
        let tip = (bill * tipPercent[percentControl.selectedSegmentIndex])
        let total = tip + bill
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize the way to grouping and decimal separator
        currencyFormatter.locale = Locale.current
 
        let localeTipString = currencyFormatter.string(from: NSNumber(value:tip))
        let localeTotalString = currencyFormatter.string(from: NSNumber(value: total))
        
        tipLabel.text = localeTipString
        totalLabel.text = localeTotalString
        
    }
    
}

