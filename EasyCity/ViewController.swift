//
//  ViewController.swift
//  EasyCity
//
//  Created by tolgahan sonmez on 20.03.2023.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let currency = ["Dolar ($)", "Euro (€)", "Gram", "Çeyrek"]
    
    @IBOutlet weak var picker: UIPickerView!
    

    @IBOutlet weak var enterCurreny: UITextField!
    
    @IBOutlet weak var resultCurrency: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "1")!)
        // Do any additional setup after loading the view.
    
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currency.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currency[row]
    }

}

