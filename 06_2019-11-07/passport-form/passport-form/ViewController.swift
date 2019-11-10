//
//  ViewController.swift
//  passport-form
//
//  Created by Павел Усов on 09.11.2019.
//  Copyright © 2019 Pavel Usov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var seriesTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var resultTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seriesTextField.delegate = self
        numberTextField.delegate = self
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
    }
    
    @IBAction func showPassportInfo(_ sender: UIButton) {
        resultTextLabel.text = "Паспорт: \(seriesTextField.text!) \(numberTextField.text!)\nИмя: \(firstNameTextField.text!)\nФамилия: \(lastNameTextField.text!)"
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
